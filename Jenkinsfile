pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'master',
                    credentialsId: 'git',
                    url: 'https://github.com/Arunprakash1177/react-app-deployment-with-docker.git'
            }
        }

        stage('Set File Permission') {
            steps {
                sh 'chmod +x build.sh'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                }
            }
        }

        stage('Build & Deploy') {
            steps {
                sh './build.sh'
            }
        }
    }
}
