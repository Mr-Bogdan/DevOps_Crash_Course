database_name           = "wordpress"             // database name
database_user           = "marti"                 // database username
shared_credentials_file = "C:/Users/Badmin/.aws"  // Access key and Secret key file location
region                  = "eu-central-1"          // europe region
ami                     = "ami-047e03b8591f2d48a" // linux 2 ami
key_name                = "Frankfurt-key"         // key name for ec2, make sure it is created before terrafomr apply
instance_type           = "t2.micro"              // type pf instance

stack = "terraformik" // for tags names
