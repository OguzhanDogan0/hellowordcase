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
                sh 'docker logout'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Docker Push'){
            steps{
                sh 'docker tag $IMAGENAME oguzhandogan/$IMAGENAME'
                sh 'docker push $IMAGENAME:latest'
            }
        }
    }
}
