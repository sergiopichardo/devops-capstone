pipeline {
    agent any 
    environment {
        DOCKERHUB_CREDENTIALS="dockerhub"
    }
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
                withCredentials([usernamePassword(credentialsId: DOCKERHUB_CREDENTIALS, passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                }
                sh 'make upload'
            }
        }
    }
}