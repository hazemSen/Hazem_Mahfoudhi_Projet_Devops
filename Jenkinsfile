pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                // Récupère automatiquement le code depuis le dépôt GitHub lié au job
                checkout scm
            }
        }
        
        stage('Maven Build') {
            steps {
                // Lance la compilation et le packaging Maven (en ignorant les tests si besoin)
                sh 'mvn clean package -DskipTests'
            }
        }
    }
}