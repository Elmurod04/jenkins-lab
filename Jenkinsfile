pipeline {
    agent any

    stages {
        stage('Checkout Info') {
            steps {
                sh 'echo "Repo checked out successfully"'
            }
        }
        stage('Build in Node container') {
            agent any {
                docker { image 'node:20-alpine' }
            }
            steps {
                sh 'node --version'
                sh 'npm --version'
            }
        }
    }
}
