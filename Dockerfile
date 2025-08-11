FROM eclipse-temurin:21-jre-alpine
EXPOSE 9001
ADD target/spring-boot-mvc-jdbc-1.0.0.jar spring-boot-mvc-jdbc-1.0.0.jar
ENTRYPOINT ["java","-jar","/spring-boot-mvc-jdbc-1.0.0.jar"]
