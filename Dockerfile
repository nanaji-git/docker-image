FROM maven as build
WORKDIR /training
COPY ..
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /training/target/hello-image.jar /app/
EXPOSE 8085
CMD [ "java","-jar","hello-image" ]
