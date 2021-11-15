provider "aws" {
  profile = "terraform"
  region  = var.region
}


# Create RDS instance
resource "aws_db_instance" "wordpressdb" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = var.database_name
  username               = var.database_user
  password               = var.database_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.RDS_allow_rule.id]
  db_subnet_group_name   = aws_db_subnet_group.mysql.name
}

# Create EC2 ( only after RDS is provisioned)
resource "aws_launch_configuration" "wordpressec2" {
  security_groups             = [aws_security_group.ec2_allow_rule.id]
  image_id                    = var.ami
  instance_type               = var.instance_type
  user_data                   = file("user_data.tpl")
  key_name                    = var.key_name
  name                        = "Wordpress.web"
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

# Launch template for ASG
resource "aws_launch_template" "amazon-linux" {
  name_prefix   = "Amazon_2"
  image_id      = "ami-030e490c34394591b"
  instance_type = "t2.micro"
}


# Auto Scaling Group
resource "aws_autoscaling_group" "web" {
  name                 = "ASG-terraform"
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.wordpressec2.name
  min_size             = 2
  max_size             = 3
  vpc_zone_identifier  = [aws_subnet.public1.id, aws_subnet.public2.id]

  dynamic "tag" {
    for_each = {
      # TAGKEY = "TAGVALUE"
      Name  = "WebServer-in-ASG"
      Owner = "Bohdan Marti"
    }
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

output "RDS-Endpoint" {
  value = aws_db_instance.wordpressdb.endpoint
}
