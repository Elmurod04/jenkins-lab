pipeline {
    agent any

    environment {
        IMAGE_NAME = 'elmurodozodboyev/jenkins-lab-demo'
        IMAGE_TAG  = "${BUILD_NUMBER}"
        CONTAINER_NAME = 'jenkins-lab-demo-app'
    }

    stages {
        stage('Checkout Info') {
            steps { sh 'echo "Repo checked out successfully"' }
        }
        stage('Build Image') {
            steps { sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .' }
        }
        stage('Test Image') {
            steps { sh 'docker run --rm ${IMAGE_NAME}:${IMAGE_TAG}' }
        }
        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                        docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:latest
                        docker push ${IMAGE_NAME}:latest
                    '''
                }
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}:${IMAGE_TAG} tail -f /dev/null
                '''
            }
        }
        stage('Verify Deployment') {
            steps {
                sh '''
                    sleep 2
                    docker ps --filter "name=${CONTAINER_NAME}" --format "table {{.Names}}\\t{{.Status}}"
                    docker logs ${CONTAINER_NAME}
                '''
            }
        }
    }

    post {
        always {
            sh 'docker rmi ${IMAGE_NAME}:${IMAGE_TAG} || true'
        }
    }
}
