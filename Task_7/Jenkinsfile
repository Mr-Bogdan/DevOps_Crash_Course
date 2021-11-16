pipeline {
    agent any
    environment {
      PROJECT_NAME = "Zeffirka"
      OWNER_NAME   = "Bohdan Marti"
    }

    stages {
        stage('1-Build') {
            steps {
                echo "Start of Stage Build..."
                echo "Building......."
                echo "End of Stage Build..."
            }
        }
        stage('2-Test') {
            steps {
                echo "Start of Stage Test..."
                echo "Testing......."
                echo "Hello ${PROJECT_NAME}"
                echo "Owner is ${OWNER_NAME}"
                echo "End of Stage Build..."
            }
        }
        stage('3-Deploy') {
            steps {
                echo "Start of Stage Deploy..."
                echo "Deploying......."
                echo "End of Stage Deploy..."
            }
        }
		stage('4-Prod') {
            steps {
                echo "Start of Stage Prod..."
                echo "Prod......."
                echo "End of Stage Prod..."
            }
        }	
		stage('5-Celebrate') {
            steps {
                echo "Project ${PROJECT_NAME} is DONE!"
            }
        }	
    }
}