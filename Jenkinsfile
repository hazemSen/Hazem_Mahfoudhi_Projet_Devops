node {
    stage('Git Checkout') {
        git branch: 'main', url: 'https://github.com/hazemSen/Hazem_Mahfoudhi_Projet_Devops.git'
    }

    stage('Maven Build') {
        sh 'chmod +x mvnw'
        sh './mvnw clean package -DskipTests'
    }

stage('SonarQube Analysis') {
    withSonarQubeEnv('SonarQube-Server') {
        sh './mvnw org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=backend -Dsonar.projectName=backend'
    }
}
}