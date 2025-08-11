FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 9001
ENTRYPOINT ["java", "-jar", "app.jar"]
