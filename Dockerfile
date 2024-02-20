FROM openjdk:17-jdk-alpine

ARG JAR_FILE=target/*.jar

# Add the application's jar file to the container
ADD ./target/backend-0.0.1-SNAPSHOT.jar app.jar

ENV DATABASE_URL postgres://db_user:password@postgres:5432/backend_db

# Run the jar file
ENTRYPOINT ["java","-jar","/app.jar"]
