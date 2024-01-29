# Use a minimal base image for building
FROM openjdk:11-jdk-slim AS build

# Set the working directory
WORKDIR /app

# Copy only the build files needed for dependency resolution
COPY build.gradle settings.gradle ./

# Download and resolve dependencies using the Gradle Wrapper
COPY gradlew .
COPY gradle gradle

# Give execute permission to the Gradle Wrapper
RUN chmod +x gradlew

# Run Gradle task to download dependencies
RUN ./gradlew dependencies

# Copy the rest of the source code
COPY . .

# Use gosu to run the build as a non-root user
RUN apt-get update && apt-get install -y gosu \
    && gosu gradle ./gradlew build --stacktrace || true

# Use a minimal base image for the runtime
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "app.jar"]
