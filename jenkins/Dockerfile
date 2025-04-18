FROM jenkins/jenkins:lts

USER root



RUN apt-get update && apt-get install -y docker.io \
    && groupadd -f docker \
    && usermod -aG docker jenkins

RUN apt-get install -y maven


COPY jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt


COPY jenkins/basic-security.groovy /usr/share/jenkins/ref/init.groovy.d/basic-security.groovy

COPY jenkins/jobs.groovy /usr/share/jenkins/ref/init.groovy.d/jobs.groovy

USER jenkins

