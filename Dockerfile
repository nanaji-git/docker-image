FROM openjdk:8
EXPOSE 8090
ADD target/hello-image.jar hello-image.jar
ENTRYPOINT ["java","-jar","/docker-image.jar"]
