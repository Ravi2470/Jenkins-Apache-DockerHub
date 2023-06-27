
pipeline {
    agent any 
    environment {
    DOCKER_USERNAME = credentials('dockerhub-username')
    DOCKER_PASSWORD = credentials('dockerhub-password')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/Ravi2470/apache.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t ravis2470/apache:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
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
