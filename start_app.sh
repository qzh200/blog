# 打印执行信息
# 创建文件存储目录
mkdir -p /data/bbs/file/topic
chmod -R 755 /data/bbs

echo "开始构建项目..."
# 清理旧的docker容器
echo "开始清理旧的docker容器..."
docker-compose down

# 部署mysql
echo "开始部署mysql..."
docker-compose up -d
# 交互式询问是否打包前端项目
echo "前端项目打包选项"
echo "是否需要对前端项目进行打包处理？"
echo "输入 Y/y (是) 或 N/n (否)，然后按回车键确认"

# 循环获取用户输入，直到输入有效选项
while true; do
    read -p "请输入您的选择 [Y/N]: " choice
    case "$choice" in
        [Yy]|[Yy][Ee][Ss])
            echo "您选择了打包前端项目..."
            echo "开始使用Docker容器打包前端项目..."
            
            # 创建Docker网络（如果不存在）
            docker network create bbs-build-network 2>/dev/null || true
            
            # 打包管理端
            echo "正在使用Docker容器打包管理端项目..."
            docker run --rm \
                -v "$(pwd)/bbs-web-admin:/app" \
                -w /app \
                --network bbs-build-network \
                node:22-alpine \
                sh -c "npm config set registry https://registry.npmmirror.com/ && npm install && NODE_OPTIONS='--max-old-space-size=4096' npm run build"
            if [ $? -eq 0 ]; then
                echo "管理端项目打包成功"
            else
                echo "管理端项目打包失败，请检查错误信息"
                exit 1
            fi
            
            # 打包PC端
            echo "正在使用Docker容器打包PC端项目..."
            docker run --rm \
                -v "$(pwd)/bbs-web-pc:/app" \
                -w /app \
                --network bbs-build-network \
                node:22-alpine \
                sh -c "npm config set registry https://registry.npmmirror.com/ && npm install && NODE_OPTIONS='--max-old-space-size=4096' npm run build"
            if [ $? -eq 0 ]; then
                echo "PC端项目打包成功"
            else
                echo "PC端项目打包失败，请检查错误信息"
                exit 1
            fi
            
            # 打包移动端
            echo "正在使用Docker容器打包移动端项目..."
            docker run --rm \
                -v "$(pwd)/bbs-web-mobile:/app" \
                -w /app \
                --network bbs-build-network \
                node:22-alpine \
                sh -c "npm config set registry https://registry.npmmirror.com/ && npm install && NODE_OPTIONS='--max-old-space-size=4096' npm run build"
            if [ $? -eq 0 ]; then
                echo "移动端项目打包成功"
            else
                echo "移动端项目打包失败，请检查错误信息"
                exit 1
            fi
            
            # 清理Docker网络
            docker network rm bbs-build-network 2>/dev/null || true
            
            echo "所有前端项目打包完成"
            break
            ;;
        [Nn]|[Nn][Oo])
            echo "您选择了跳过前端项目打包"
            echo "注意：如果前端代码有更新，请确保已手动打包"
            break
            ;;
        *)
            echo "无效输入，请输入 Y/y (是) 或 N/n (否)"
            ;;
    esac
done

# 查找并终止正在运行的Spring Boot进程
echo "检查是否有正在运行的Spring Boot进程..."

# Unix/Linux环境
SPRING_PID=$(ps aux | grep 'spring-boot' | grep -v grep | awk '{print $2}')

if [ ! -z "$SPRING_PID" ]; then
    echo "发现正在运行的Spring Boot进程: $SPRING_PID"
    echo "正在终止进程..."
        # Unix/Linux环境
        kill -9 $SPRING_PID
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