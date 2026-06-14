FROM gradle:8-jdk21 AS build

WORKDIR /app

COPY . .

RUN ./gradlew bootJar --no-daemon

FROM eclipse-temurin:21-jre-alpine AS runtime
WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
