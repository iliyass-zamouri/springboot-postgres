#!/bin/bash

# Initialize and start PostgreSQL
service postgresql start

# Optionally, initialize the database here (e.g., create tables)

# Start your Java application
java -jar /app/target/*.jar
