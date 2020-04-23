pipeline {
    agent any 
    stages {
        stage('Lint HTML and Dockerfile') {
            steps {
                sh 'make lint'
            }
        }

        stage('Build Docker Images') {
            steps {
                sh 'make build'
            }
        }

        stage('Upload Image to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "dockerhub", passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh 'echo username is: $USERNAME'
                    sh 'echo password is: $PASSWORD'
                }
            }
        }
    }
}