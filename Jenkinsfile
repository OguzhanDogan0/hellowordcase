pipeline {
    agent any
    environment{
        IMAGENAME = "helloword-v1"
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-oguzhandogan')
        
    }
    stages {
        stage('Docker Build') {
           steps{
            sh 'docker build -t $IMAGENAME:latest .'
           }
        }
        stage('Docker Login'){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PWS | docker login -u $DOCKERHUB_CREDENTIALS --password-stdin'
            }
        }
        stage('Docker Push'){
            steps{
                sh 'docker push $IMAGENAME:latest'
            }
        }
    }
}
