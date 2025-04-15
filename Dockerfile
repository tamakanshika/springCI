FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

COPY target/CICDtestapp.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]