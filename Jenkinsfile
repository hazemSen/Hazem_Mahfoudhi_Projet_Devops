node {
    stage('Git Checkout') {
        git branch: 'main', url: 'https://github.com/hazemSen/Hazem_Mahfoudhi_Projet_Devops.git'
    }

    stage('Maven Build') {
        // Donner les permissions d'exécution au script wrapper
        sh 'chmod +x mvnw'
        // Lancer le build via le wrapper Maven du projet
        sh './mvnw clean package -DskipTests'
    }

    stage('SonarQube Analysis') {
        // Utilisation du serveur SonarQube configuré dans Jenkins
        withSonarQubeEnv('SonarQube-Server') {
            // Lancement de l'analyse SonarQube via Maven
            sh './mvnw sonar:sonar'
        }
    }
}