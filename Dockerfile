# Use a base image with Java and Maven pre-installed
FROM maven:3.8.5-openjdk-17 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file to the working directory
COPY pom.xml .

# Download project dependencies (this will be cached if pom.xml doesn't change)
RUN mvn dependency:go-offline

# Copy the source code to the working directory
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# Use a minimal base image for running the application
FROM eclipse-temurin:17-jre-focal

# Set the working directory
WORKDIR /app

# Copy the packaged application from the builder stage
COPY --from=builder /app/target/*.war ./app.war

# Expose the port the application will run on (adjust as needed)
EXPOSE 8080

# Command to run the application.  You might need to adjust this depending on your application server.
CMD ["java", "-jar", "app.war"]
