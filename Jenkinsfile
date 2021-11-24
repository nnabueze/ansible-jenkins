pipeline {
    agent any
    stages {
        stage('Building Custom jenkins Image') {
            steps {
                sh 'docker image build -t villavelle101/customjenkins .'
            }
        }

        stage('Push image to dockerhub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerHubLogin')]) {
                    // some block
                    sh "docker login -u villavelle101 -p ${dockerHubLogin}"
                    sh 'docker push'
                }                
            }
        }

        // stage('Deploying server with ansible') {
        //     steps {
        //     }
        // }

    }
}