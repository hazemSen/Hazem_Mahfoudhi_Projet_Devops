node {
    stage('Git Checkout') {
        checkout scm
    }

    stage('Maven Build') {
        sh 'mvn clean package -DskipTests'
    }
}