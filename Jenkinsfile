pipeline {
    agent any
    stages {
        stage('Building Custom jenkins Image') {
            steps {
                sh 'docker image build villavelle101/customjenkins .'
            }
        }

        stage('Push image to dockerhub') {
            steps {
            }
        }

        stage('Deploying server with ansible') {
            steps {
            }
        }

    }
}