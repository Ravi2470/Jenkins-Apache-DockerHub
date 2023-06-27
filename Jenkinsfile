
pipeline {
    agent any 
    environment {
    DOCKER_USERNAME = credentials('dockerhub-username')
    DOCKER_PASSWORD = credentials('dockerhub-password')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git branch: 'main', url: 'https://github.com/Ravi2470/apache.git'
            }
        }

        stage('Build docker image') {/var/www/html/build
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
        stage('pull image')
            steps{
                sh 'docker pull ravis2470/apache:$BUILD_NUMBER'
            }
        stage('create container') 
            steps{
                sh 'docker run -p 877:80 ravis2470/apache:$BUILD_NUMBER'
            } 
}
post {
        always {
            sh 'docker logout'
        }
    }
}
