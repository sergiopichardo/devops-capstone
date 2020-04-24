pipeline {
    agent any 
    stages {
        stage('Lint HTML and Dockerfile') {
            steps {
                sh 'make lint'
            }
        }

        stage('Build Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'sudo ls /var/bin/jenkins'
                    // sh 'docker login -u $DOCKERHUB_USERNAME --password-stdin < ~/dockerhub_password'
                    // sh 'make build'
                }
            }
        }
    }
}

