# ---------- Stage 1: Build ứng dụng ----------
FROM maven:3.9.4-eclipse-temurin-17-alpine AS build

# Tạo thư mục cho source
WORKDIR /app

# Copy toàn bộ mã nguồn vào image
COPY . .

# Build project, tạo file .jar trong target/
RUN mvn clean package -DskipTests

# ---------- Stage 2: Run ứng dụng ----------
FROM openjdk:17-jdk-alpine

# Tạo thư mục volume tạm
VOLUME /tmp

# Copy file JAR từ stage 1
COPY --from=build /app/target/*.jar app.jar

# Lệnh chạy ứng dụng
ENTRYPOINT ["java", "-jar", "/app.jar"]
