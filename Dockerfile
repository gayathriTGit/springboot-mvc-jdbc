# Build Stage
FROM maven:3.9.6-eclipse-temurin-21-alpine AS build

WORKDIR /app

# Copy your Maven project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Runtime Stage
FROM eclipse-temurin:21-jre-alpine

WORKDIR /etc/tomcat

# Download and extract Tomcat 9
ARG TOMCAT_VERSION=9.0.108
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tar.gz && \
    tar xzvf /tmp/tomcat.tar.gz -C /etc/tomcat --strip-components=1 && \
    rm /tmp/tomcat.tar.gz

# Remove unnecessary files for a slimmer image
RUN rm -rf /etc/tomcat/webapps/examples /etc/tomcat/webapps/docs /etc/tomcat/webapps/host-manager /etc/tomcat/webapps/manager

# Copy the built WAR file from the build stage
COPY --from=build /app/target/*.jar /etc/tomcat/webapps/springboot-mvc.jar

# Expose Tomcat's default port
EXPOSE 9001

# Define the command to run Tomcat
CMD ["catalina.sh", "run"]
