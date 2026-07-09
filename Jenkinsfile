pipeline {
    agent any

    environment {
        IMAGE_NAME = 'jenkins-lab-demo'
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Info') {
            steps {
                sh 'echo "Repo checked out successfully"'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }
        stage('Test Image') {
            steps {
                sh 'docker run --rm ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
        stage('Tag as Latest') {
            steps {
                sh 'docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:latest'
            }
        }
    }

    post {
        always {
            sh 'docker rmi ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:latest || true'
        }
    }
}
