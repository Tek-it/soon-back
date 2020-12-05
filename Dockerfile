FROM openjdk:8-jdk-alpine
EXPOSE 8080
ARG JAR_FILE=target/back-end-2.3.4.RELEASE.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
