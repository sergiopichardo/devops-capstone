pipeline {
    environment {
        DOCKERHUB_REGISTRY = "https://hub.docker.com"
        DOCKERHUB_CREDENTIALS = "DOCKERHUB_CREDENTIALS"
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
                        credentialsId: "${DOCKERHUB_CREDENTIALS}", 
                        usernameVariable: "DOCKERHUB_USERNAME", 
                        passwordVariable: "DOCKERHUB_PASSWORD")]) {
                        
                        // sh "echo $DOCKERHUB_PASSWORD >> dockerhub_password_file"
                        // sh "cat dockerhub_password_file | docker login -u $DOCKERHUB_USERNAME --password-stdin"
                        // sh "rm -rf dockerhub_password_file"

                        sh 'make login'
                        
                        // remove later
                        docker.withRegistry('', "$DOCKERHUB_CREDENTIALS") {
                            dockerImage = docker.build("${DOCKER_IMAGE}")
                            dockerImage.push()
                        }
                    }
                }
            }
        }



    }
}



