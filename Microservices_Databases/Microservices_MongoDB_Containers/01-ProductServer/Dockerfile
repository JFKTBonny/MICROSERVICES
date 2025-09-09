FROM maven:3.8.1-openjdk-17-slim AS build
WORKDIR /workspace

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

COPY --from=build /workspace/target/*.jar /app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.jar"]
