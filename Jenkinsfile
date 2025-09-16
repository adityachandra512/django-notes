@Library("Shared") _
pipeline {
    
    agent { label 'jenkinAdmin' }

    stages {
        stage("Hello") {
            steps {
                script {
                    hello()
                }
            }
        }
        stage('Code') {
            steps {
                script {
                    clone("https://github.com/adityachandra512/django-notes.git","master")
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    docker_build("notes-app","latest","aditya512")
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    docker_push("notes-app","latest","aditya512")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker_compose()
                }
            }
        }
    }
}
