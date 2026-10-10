# Utiliser une image Java 17 légère (JRE)
FROM eclipse-temurin:17-jre-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier JAR généré par Maven dans le conteneur
COPY target/backend-1.0.0.jar app.jar

# Exposer le port de l'application (ajustez si nécessaire, ex: 8080 ou 8081)
EXPOSE 8080

# Lancer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]