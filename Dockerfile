# Use a base image with Java 21 and Maven
FROM maven:3.9.5-eclipse-temurin-21 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file to the working directory
COPY pom.xml .

# Download project dependencies (this will be cached if pom.xml doesn't change)
RUN mvn dependency:go-offline -B

# Copy the source code to the working directory
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# Use Java 21 for the runtime image
FROM eclipse-temurin:21-jre

# Set the working directory
WORKDIR /app

# Copy the packaged application from the builder stage
COPY --from=builder /app/target/*.war ./app.war

# Copy webapp-runner if it exists in the builder stage
COPY --from=builder /app/target/dependency/webapp-runner*.jar ./webapp-runner.jar 2>/dev/null || true

# Expose the port the application will run on
EXPOSE 8080

# Check if webapp-runner exists and use it, otherwise use the WAR directly
CMD if [ -f webapp-runner.jar ]; then \
        java -jar webapp-runner.jar app.war; \
    else \
        java -jar app.war; \
    fi