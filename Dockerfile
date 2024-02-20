# Use an official Java base image with Maven included
FROM maven:3.8.4-openjdk-17 as build

# Copy your Java application source
WORKDIR /app
COPY . .

# Build your Java application
RUN mvn package

# Use a slim Java runtime for the final image
FROM openjdk:17-slim

WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/target/*.jar /app/app.jar

# Expose the port your app runs on
EXPOSE 8080

# Run your Java application
CMD ["java", "-jar", "app.jar"]
