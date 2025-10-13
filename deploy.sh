#!/bin/bash
# 进入项目根目录

echo "开始构建项目..."
# 构建项目
mvn install -DskipTests

if [ $? -ne 0 ]; then
    echo "构建失败，请检查错误信息"
    exit 1
fi

echo "构建成功，开始启动Docker容器..."

echo "停止并删除旧的容器（如果存在）..."
docker-compose down

echo "启动新的容器..."
docker-compose up -d

echo "检查容器状态..."
docker-compose ps

echo "部署完成，请检查日志确认服务是否正常运行"
echo "查看日志命令："
echo "  docker logs -f blog-web"
echo "  docker logs -f blog-admin"