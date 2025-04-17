FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Install Maven
RUN apt-get install -y maven

# Set Docker group permissions
RUN groupadd -g 999 docker && \
    usermod -aG docker jenkins

# Optional: install Java explicitly (if not already there)
RUN apt-get install -y openjdk-17-jdk

USER jenkins

# Copy init.groovy.d or jobs into the image (if any)
COPY jobs.groovy /usr/share/jenkins/ref/init.groovy.d/jobs.groovy
