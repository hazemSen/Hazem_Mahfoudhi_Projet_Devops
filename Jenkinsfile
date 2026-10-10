pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/hazemSen/Hazem_Mahfoudhi_Projet_Devops.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'chmod +x mvnw'
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube-Server') {
                    sh './mvnw org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=backend -Dsonar.projectName=backend'
                }
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    // 1. Construire l'image localement
                    sh 'docker build -t backend:latest .'
                    
                    // 2. Se connecter à Docker Hub et pousser l'image
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                        sh 'docker tag backend:latest $DOCKER_USER/backend:latest'
                        sh 'docker push $DOCKER_USER/backend:latest'
                    }
                }
            }
        }
    }
}