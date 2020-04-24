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
                script {
                    image = docker.build("sergiopichardo/nginx-blue") 
                    docker.withRegistry('', 'dockerhub') {
                        image.push()
                    }
                }
                // withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                //     // sh 'docker login -u $DOCKERHUB_USERNAME --password-stdin < ~/dockerhub_password'
                //     // sh 'make build'
                //     sh 'echo env'
                // }
            }
        }
    }
}

