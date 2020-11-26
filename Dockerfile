FROM tomcat:jdk8-adoptopenjdk-hotspot
USER root

COPY ROOT.war /usr/local/tomcat/webapps/
COPY mariadb-java-client-2.7.1-sources.jar /usr/local/tomcat/lib/
COPY server.xml /usr/local/tomcat/conf

RUN chmod -R 777 /usr/local/tomcat/*

EXPOSE 8080 
