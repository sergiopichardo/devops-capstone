pipeline {
    environment {
        DOCKERHUB_REGISTRY="https://hub.docker.com"
        DOCKERHUB_CREDENTIALS="DOCKERHUB_CREDENTIALS"
        // DOCKER_IMAGE="sergiopichardo/nginx-blue"
        REGION="us-east-1"
        AWS_CREDENTIALS="aws_credentials"
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
                        
                        sh "echo $DOCKERHUB_PASSWORD >> dockerhub_password_file"
                        sh "cat dockerhub_password_file | docker login -u $DOCKERHUB_USERNAME --password-stdin"
                        sh "rm -rf dockerhub_password_file"

                        // remove later
                        docker.withRegistry('', "$DOCKERHUB_CREDENTIALS") {
                            // dockerImageBlue = docker.build("${DOCKER_IMAGE_BLUE}")
                            // dockerImageGreen = docker.build("${DOCKER_IMAGE_GREEN}")
                            // dockerImageBlue.push()
                            // dockerImageGreen.push()
                            sh "make build"
                            sh "make upload"

                        }
                    }
                }
            }
        }

        stage('Deploy to Kubernetes Cluster') {
            steps {
                withAWS(credentials: "$AWS_CREDENTIALS", region: "$REGION") { 
                    sh "aws eks --region us-east-1 update-kubeconfig --name devops-capstone-cluster"
                    sh "kubectl apply -f blue-deployment.yml"
                    sh "kubectl apply -f green-deployment.yml"
                    sh "kubectl apply -f service.yml"
                    
                }
            }
        }        
    }
}



