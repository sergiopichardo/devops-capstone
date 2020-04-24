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
                    
                    sh "echo ${env.DOCKERHUB_PASSWORD}"
                    sh "docker login -u $DOCKERHUB_USERNAME --password-stdin < ${env.DOCKERHUB_PASSWORD}"
                    // sh 'make build'
                }
            }
        }
    }
}

