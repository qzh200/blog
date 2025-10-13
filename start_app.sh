#!/bin/bash

# 打印执行信息
echo "开始构建项目..."

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
LOG_FILE="app.log"

# 检查日志文件是否存在，存在则备份
if [ -f "$LOG_FILE" ]; then
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    mv "$LOG_FILE" "${LOG_FILE}.${TIMESTAMP}.bak"
    echo "日志文件已备份为：${LOG_FILE}.${TIMESTAMP}.bak"
fi

# 使用nohup后台运行，并记录进程ID
nohup mvn spring-boot:run > "$LOG_FILE" 2>&1 &
APP_PID=$!

echo "Spring Boot 应用已在后台启动，进程ID: $APP_PID"
echo "日志输出到: $LOG_FILE"
echo "使用 'tail -f $LOG_FILE' 查看实时日志"
echo "使用 'kill $APP_PID' 停止应用"

echo "脚本执行完成"