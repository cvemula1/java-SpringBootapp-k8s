#Get base image having openjdk version 8
FROM openjdk:8u131-jre

MAINTAINER Chenna Vemula <cvemula.unix@gmail.com>
#Expose ports
EXPOSE 8080

ENV JAVA_VER=1.8.0

# This part we can run if the base image doesn't have the Java8 Installed
# RUN yum install -y wget \
#         yum install -y java-1.8.0-openjdk-headless \
#         yum clean all

RUN mkdir /projectname

# Add jar file from jenkins workspace or from S3/Artifactory

ADD projectname-1.0.jar /projectname

WORKDIR /projectname

RUN chown -R 1001:1001 /projectname

USER 1001

#RUN bash -c "touch /projectname//projectname-1.0.jar"

#ENTRYPOINT exec java $JAVA_OPTS -jar /project-name//projectname-1.0.jar

# Mention the Starting Point of the Docker Container

CMD ["java","-jar","/projectname-1.0.jar"]
