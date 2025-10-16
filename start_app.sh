#!/bin/bash
# 打印执行信息
echo "开始构建项目..."

# 查找并终止正在运行的Spring Boot进程
echo "检查是否有正在运行的Spring Boot进程..."
# 兼容Windows环境的进程查找方式
if command -v tasklist &> /dev/null; then
    # Windows环境
    SPRING_PID=$(tasklist | findstr "java" | findstr "spring-boot" | awk '{print $2}')
else
    # Unix/Linux环境
    SPRING_PID=$(ps aux | grep 'spring-boot' | grep -v grep | awk '{print $2}')
fi

if [ ! -z "$SPRING_PID" ]; then
    echo "发现正在运行的Spring Boot进程: $SPRING_PID"
    echo "正在终止进程..."
    if command -v taskkill &> /dev/null; then
        # Windows环境
        taskkill /PID $SPRING_PID /F
    else
        # Unix/Linux环境
        kill -9 $SPRING_PID
    fi
    if [ $? -eq 0 ]; then
        echo "进程已成功终止"
    else
        echo "进程终止失败"
    fi
else
    echo "没有发现正在运行的Spring Boot进程"
fi

# 创建日志目录
mkdir -p log

# 执行 mvn install 命令
echo "执行 mvn install..."
mvn install

# 检查 mvn install 是否成功
if [ $? -ne 0 ]; then
    echo "mvn install 失败，请检查错误信息"
    exit 1
fi

# 使用nohup在后台执行 mvn spring-boot:run 命令
echo "mvn install 成功，开始启动Spring Boot应用（后台运行）..."
LOG_FILE="log/app.log"

# 检查日志文件是否存在，存在则备份
if [ -f "$LOG_FILE" ]; then
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    mv "$LOG_FILE" "log/app.log.${TIMESTAMP}.bak"
    echo "日志文件已备份为：log/app.log.${TIMESTAMP}.bak"
fi

# 使用nohup后台运行，并记录进程ID
echo "启动Spring Boot应用..."
nohup mvn spring-boot:run > "$LOG_FILE" 2>&1 &
APP_PID=$!

echo "Spring Boot 应用已在后台启动，进程ID: $APP_PID"
echo "日志输出到: $LOG_FILE"
echo "使用 'tail -f $LOG_FILE' 查看实时日志"
echo "使用 'kill $APP_PID' 停止应用"

echo "脚本执行完成"