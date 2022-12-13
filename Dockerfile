FROM maven as build
WORKDIR /app
COPY ..
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/target/hello-image.jar /./
EXPOSE 8085
CMD [ "java","-jar","docker-image" ]
