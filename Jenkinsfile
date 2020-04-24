pipeline {
    environment {
        DOCKERHUB_REGISTRY = "https://hub.docker.com"
        DOCKERHUB_CREDENTIALS_ID = "dockerhub"
        DOCKER_IMAGE = "sergiopichardo/nginx-blue"
    }
    agent any 
    stages {
        stage('Lint HTML and Dockerfile') {
            steps {
                sh 'make lint'
            }
        }

        stage('Build Docker and Push Image') {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: "${DOCKERHUB_CREDENTIALS_ID}", 
                        usernameVariable: "DOCKERHUB_USERNAME", 
                        passwordVariable: "DOCKERHUB_PASSWORD")]) {
                        sh "docker login -u ${DOCKERHUB_USERNAME} --password-stdin ${DOCKERHUB_PASSWORD}"
                        
                        docker.withRegistry('', "$DOCKERHUB_CREDENTIALS_ID") {
                            dockerImage = docker.build("${DOCKER_IMAGE}")
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }
}



