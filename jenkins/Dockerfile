FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Install Maven
RUN apt-get install -y maven

# Set Docker group permissions
RUN usermod -aG docker jenkins

# # Optional: install Java explicitly (if not already there)
# RUN apt-get install -y openjdk-17-jdk

COPY jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt


COPY jenkins/basic-security.groovy /usr/share/jenkins/ref/init.groovy.d/basic-security.groovy

COPY jenkins/jobs.groovy /usr/share/jenkins/ref/init.groovy.d/jobs.groovy

USER jenkins

