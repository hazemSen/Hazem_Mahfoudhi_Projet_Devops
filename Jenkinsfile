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
                    // Option 1 : Construction simple de l'image Docker locale
                    sh 'docker build -t backend:latest .'
                    
                    /* 
                      Option 2 : Si vous souhaitez pousser l'image sur Docker Hub 
                      (Nécessite de configurer des identifiants Docker dans Jenkins)
                      
                      docker.withRegistry('https://index.docker.io/v1/', 'votre-id-credential-dockerhub') {
                          def customImage = docker.image("votre-username-dockerhub/backend:latest")
                          customImage.build(".")
                          customImage.push()
                      }
                    */
                }
            }
        }
    }
}