pipeline {
    agent any

    stages {
        stage('Checkout Info') {
            steps {
                sh 'echo "Repo checked out successfully."'
                sh 'ls -la'
                sh 'git log -1'
                sh 'll'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Building..."'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Testing..."'
            }
        }
    }
}
