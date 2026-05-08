#FROM maven:3.3-jdk-8 as builder
#COPY . /usr/src/mymaven/
#WORKDIR /usr/src/mymaven/
#RUN mvn clean package

#FROM tomcat:9-jdk11-temurin
#MAINTAINER "opstree <opstree@gmail.com>"
#RUN rm -rf /usr/local/tomcat/webapps/*
#COPY --from=builder /usr/src/mymaven/target/Spring3HibernateApp.war /usr/local/tomcat/webapps/ROOT.war
#WORKDIR /usr/local/tomcat/webapps/
#EXPOSE 8080

#below dockerfile is to test from buildpiper wherin war is already created in the maven build step
FROM tomcat:9-jdk11-temurin

LABEL maintainer="opstree <opstree@gmail.com>"

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/Spring3HibernateApp.war /usr/local/tomcat/webapps/ROOT.war

WORKDIR /usr/local/tomcat/webapps/

EXPOSE 8080
