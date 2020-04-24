pipeline {
    agent any 
    environment {
        DOCKERHUB_USERNAME=credentials('DOCKERHUB_USERNAME')
        DOCKERHUB_PASSWORD=credentials('DOCKERHUB_PASSWORD')
    }
    stages {
        stage('Lint HTML and Dockerfile') {
            steps {
                sh 'make lint'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                sh 'make build'
            }
        }
    }
}

