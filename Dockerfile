# Stage 1: Build the application
FROM gradle:7.6.1-jdk17 AS build
WORKDIR /app

# Gradle 캐시 디렉토리 생성 및 권한 부여 (선택적으로 보강)
RUN mkdir -p /app/.gradle && chmod -R 777 /app/.gradle

COPY build.gradle settings.gradle ./
COPY src src

# Gradle 캐시 디렉토리 지정하여 빌드 수행
RUN gradle build --no-daemon -x test -g /app/.gradle
RUN ls /app/build/libs/ # JAR 파일이 제대로 생성되었는지 확인

# Stage 2: Create the final Docker image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
