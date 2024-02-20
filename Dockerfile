# Use an Ubuntu base image that can support both Java and PostgreSQL
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Set your desired timezone.
ENV TZ=Africa/Casablanca

# Preconfigure selected timezone.
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install PostgreSQL, OpenJDK for Java, and Maven for building the Java app
RUN apt-get update && apt-get install -y postgresql postgresql-contrib openjdk-17-jdk maven

# Setup PostgreSQL (You may need to adjust this for your needs)
ENV POSTGRES_USER=db_user
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=backend_db

# Copy your Java application source
WORKDIR /app
COPY . .

# Build your Java application
RUN mvn package

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script to run on container start
ENTRYPOINT ["/entrypoint.sh"]

# Expose the port your app runs on
EXPOSE 8080 5432
