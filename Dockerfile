# Build stage: use Maven with Java 21 to build the project
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /workspace

# copy only pom first to leverage Docker layer caching
COPY pom.xml .
COPY src ./src

# Build the application (skip tests for faster iteration; remove -DskipTests to run tests)
RUN mvn -B -DskipTests package

# Runtime stage: lightweight JRE for Java 21
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy the built jar (assumes single jar in target)
COPY --from=builder /workspace/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]