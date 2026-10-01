node {
    stage('Git Checkout') {
        git branch: 'main', url: 'https://github.com/hazemSen/Hazem_Mahfoudhi_Projet_Devops.git'
    }

    stage('Maven Build') {
        sh 'mvn clean package -DskipTests'
    }
}