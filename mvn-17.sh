#!/bin/bash

# Set JAVA_HOME to JDK 17
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home

# Invoke Maven with all arguments passed to the script
mvn "$@"
