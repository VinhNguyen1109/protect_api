# Sử dụng JDK 17 (hoặc JDK bạn dùng)
FROM openjdk:17-jdk-alpine

# Tạo thư mục volume tạm
VOLUME /tmp

# ARG để lấy file JAR
ARG JAR_FILE=target/*.jar

# Copy file jar vào container
COPY ${JAR_FILE} app.jar

# Lệnh chạy ứng dụng
ENTRYPOINT ["java","-jar","/app.jar"]