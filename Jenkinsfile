pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Wanted162/trend-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t trend-app .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh '''
                        docker stop trend-container || true
                        docker rm trend-container || true
                        docker run -d -p 3000:3000 --name trend-container trend-app
                    '''
                }
            }
        }
    }
}
