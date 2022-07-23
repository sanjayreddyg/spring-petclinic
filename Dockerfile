FROM maven:3.8-jdk-11 AS builder
LABEL Author=Sanjay
RUN git clone https://github.com/spring-projects/spring-petclinic.git && cd spring-petclinic && mvn package

FROM openjdk:11.0-jdk
COPY --from=builder spring-petclinic/target/spring-petclinic-2.7.0-SNAPSHOT.jar /Spring/spring-petclinic.jar
WORKDIR Spring
EXPOSE 8080
CMD ["java","-jar","spring-petclinic.jar"]