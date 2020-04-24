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
                    load "$NAME"
                    sh "echo ${env.NAME}"
                    // sh 'docker login -u $DOCKERHUB_USERNAME --password-stdin < ~/dockerhub_password'
                    // sh 'make build'
                }
            }
        }
    }
}

