pipeline {
    agent any

    stages {
        stage('Checkout Info') {
            steps {
                sh 'echo "Repo checked out successfully"'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Building..."'
            }
        }
        stage('Test') {
            steps {
                sh '''
                mkdir -p test-reports
                cat > test-reports/results.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<testsuite name="SampleTests" tests="3" failures="1" errors="0" skipped="0">
    <testcase classname="sample.MathTest" name="testAddition" time="0.01"/>
    <testcase classname="sample.MathTest" name="testSubtraction" time="0.01"/>
    <testcase classname="sample.MathTest" name="testDivision" time="0.02">
        <failure message="Expected 2 but got 3">AssertionError: Expected 2 but got 3</failure>
    </testcase>
</testsuite>
EOF
                '''
            }
        }
    }
    post {
        always {
            junit 'test-reports/results.xml'
        }
    }
}
