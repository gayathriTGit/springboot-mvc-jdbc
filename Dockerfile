FROM tomcat:9.0-jdk21-temurin AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package 

# Stage 2: Create the final image
FROM tomcat:9.0-jdk21-temurin
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 9001
ENTRYPOINT ["java", "-jar", "app.jar"]
