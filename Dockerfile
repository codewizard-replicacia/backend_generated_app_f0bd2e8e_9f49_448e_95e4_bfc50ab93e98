FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend_generated_app_f0bd2e8e_9f49_448e_95e4_bfc50ab93e98 backend_generated_app_f0bd2e8e_9f49_448e_95e4_bfc50ab93e98
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend_generated_app_f0bd2e8e_9f49_448e_95e4_bfc50ab93e98/target/generated_app-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar generated_app-0.0.1-SNAPSHOT.jar"]