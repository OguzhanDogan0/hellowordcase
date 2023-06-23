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
                sh 'docker tag $IMAGENAME oguzhandogan/$IMAGENAME:latest'
                sh 'docker push oguzhandogan/$IMAGENAME:latest'
            }
        }
        stage("Kubernetes Deployment"){
            steps{
                script{
                    kubernetesDeploy kubeconfigId: 'kubeconfig', configs: 'Deployment.yaml'
                    //withCredentials([kubeconfigFile(credentialsId: 'kubeconfig')]) {
                        //sh 'kubectl apply -f Deployment.yaml'
                    }
                }
            }
        }
    }

