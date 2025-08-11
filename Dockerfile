FROM maven:3.9.6-eclipse-temurin-21-alpine
EXPOSE 9001
ADD target/spring-boot-mvc-jdbc-1.0.0.jar spring-boot-mvc-jdbc-1.0.0.jar
ENTRYPOINT ["java","-jar","/spring-boot-mvc-jdbc-1.0.0.jar"]
