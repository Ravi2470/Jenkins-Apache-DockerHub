
pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-token')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://https://github.com/Ravi2470/apache.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t ravis2470/apache:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push ravis2470/apache:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
