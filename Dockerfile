# --------- Builder Stage ---------
FROM maven:3.9.0-eclipse-temurin-17 AS build
WORKDIR /home/app

# Copy pom.xml and download dependencies (cache)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and package the application
COPY src ./src
RUN mvn clean package -DskipTests

# --------- Final Stage ---------
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy the fat JAR from the builder stage
COPY --from=build /home/app/target/*.jar app.jar

# Expose the application port
EXPOSE 8081

# Run the Spring Boot application
ENTRYPOINT ["java","-jar","/app/app.jar"]


# FROM eclipse-temurin:21-jdk-alpine
#
# WORKDIR /app
#
# COPY target/CICDtestapp.jar app.jar
#
# ENTRYPOINT ["java", "-jar", "app.jar"]