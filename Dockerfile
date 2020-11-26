FROM docker pull tomcat:jdk8-adoptopenjdk-hotspot
USER root

COPY ROOT.war /usr/local/tomcat
COPY mariadb-java-client-2.7.1-sources.jar /opt/webserver/lib
COPY server.xml /opt/webserver/conf

RUN chmod -R 777 /opt/webserver/*

EXPOSE 8080 
