FROM openjdk:8
EXPOSE 8090
ADD target/docker-image.jar docker-image.jar
ENTRYPOINT ["java","-jar","/docker-image.jar"]
