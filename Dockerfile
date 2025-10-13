# 使用Java 8作为基础镜像
FROM openjdk:8-jdk-alpine

# 设置工作目录
WORKDIR /app

# 设置环境变量
ENV LANG=C.UTF-8
ENV JAVA_OPTS="-Dfile.encoding=utf-8"

# 复制jar包到镜像中
COPY target/bbs-pro-6.9.jar app.jar

# 暴露端口
EXPOSE 8080

# 添加执行权限
RUN chmod +x app.jar

# 设置启动命令
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]