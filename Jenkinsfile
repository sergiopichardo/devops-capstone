pipeline {
    agent any 
    environment {

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
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                }
                sh 'make upload'
            }
        }
    }
}