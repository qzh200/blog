# BBS 论坛系统项目文档

## 项目概述

这是一个基于 Spring Boot + Vue.js 的全栈 BBS 论坛系统，采用前后端分离架构。系统包含管理端、PC 端和移动端三个前端应用，以及一个 Java 后端服务。

### 技术栈

**后端技术:**
- Spring Boot 2.7.18 (Java 1.8)
- Spring Data JPA + MySQL 8.0
- Maven 项目管理
- Spring Security OAuth2
- EhCache 缓存
- Quartz 定时任务
- Lucene 全文检索

**前端技术:**
- Vue 3 + TypeScript
- Vite 构建工具
- Element Plus UI (管理端)
- Vant UI (移动端)
- Axios HTTP 客户端

**部署环境:**
- Docker + Docker Compose
- Nginx 反向代理
- MySQL 数据库

## 项目结构

```
E:\blog\
├── bbs-web-admin\          # 管理后台前端 (Vue 3 + Element Plus)
├── bbs-web-pc\             # PC 端前端 (Vue 3 + Element Plus)
├── bbs-web-mobile\         # 移动端前端 (Vue 3 + Vant)
├── src\                    # Java 后端源码
│   └── main\java\cms\      # 主要包路径
├── lib\                    # 本地 JAR 依赖库
├── image\                  # 项目图片资源
├── log\                    # 日志文件目录
├── target\                 # Maven 编译输出目录
├── bbs-pro.sql             # 数据库初始化脚本
├── docker-compose.yml      # Docker 容器编排配置
├── nginx.conf              # Nginx 配置文件
├── pom.xml                 # Maven 项目配置
└── start_app.sh            # 项目启动脚本
```

## 构建和运行

### 环境要求
- Java 1.8+
- Node.js 16+
- Maven 3.6+
- Docker & Docker Compose
- MySQL 8.0+

### 快速启动

1. **使用 Docker Compose 启动基础服务**:
   ```bash
   docker-compose up -d
   ```

2. **完整项目启动** (推荐):
   ```bash
   chmod +x start_app.sh
   ./start_app.sh
   ```
   该脚本会:
   - 清理旧的 Docker 容器
   - 启动 MySQL 数据库
   - 询问是否打包前端项目 (可选)
   - 编译并启动 Spring Boot 后端服务

### 单独构建各模块

**后端构建和启动**:
```bash
# 编译项目
mvn install

# 启动后端服务
mvn spring-boot:run
```

**前端构建** (在各前端目录下执行):
```bash
# 安装依赖
npm install

# 开发模式启动
npm run dev

# 生产构建
npm run build
```

## 开发规范

### 后端开发规范
- 主包路径: `cms`
- 实体类使用 JPA 注解
- 控制器位于 `cms.web.action` 包
- 服务层位于 `cms.service` 包
- 工具类位于 `cms.utils` 包

### 前端开发规范
- 使用 TypeScript 开发
- 组件采用 Vue 3 Composition API
- 管理端使用 Element Plus UI 组件库
- 移动端使用 Vant UI 组件库
- API 请求统一使用 Axios

### 数据库规范
- 表名使用小写字母和下划线
- 主键统一命名为 `id`
- 时间字段使用 `create_time` 和 `update_time`
- 软删除字段使用 `status` (0-正常, 1-删除)

## 主要功能模块

### 管理端功能
- 用户管理
- 内容管理
- 系统设置
- 数据统计
- 权限管理

### PC 端功能
- 论坛板块
- 帖子发布与浏览
- 用户互动 (点赞、评论、收藏)
- 个人中心
- 搜索功能

### 移动端功能
- 响应式论坛界面
- 移动优化的用户体验
- 推送通知
- 移动端特有交互

## 部署说明

### 生产环境部署
1. 配置 `docker-compose.yml` 中的环境变量
2. 修改数据库密码
3. 构建前端项目: `npm run build`
4. 启动所有服务: `docker-compose up -d`

### 端口配置
- Nginx: 80
- MySQL: 33066 (映射到容器 3306)
- Spring Boot: 8080

## 注意事项

1. **数据库字符集**: 确保使用 UTF-8 编码
2. **文件存储**: 上传文件默认存储在 `/data/bbs/file` 目录
3. **日志管理**: 应用日志位于 `log/app.log`
4. **安全配置**: 生产环境请修改默认密码和密钥
5. **性能优化**: 大文件上传和图片处理已集成优化方案

## 扩展开发

### 添加新的 API 接口
1. 在 `cms.web.action` 包下创建控制器
2. 在 `cms.service` 包下实现业务逻辑
3. 使用 JPA 注解定义数据模型

### 添加新的前端页面
1. 在对应前端项目的 `src/views` 目录下创建页面组件
2. 在路由配置中添加路由规则
3. 遵循现有组件的命名和结构规范

## 故障排除

常见问题及解决方案:
1. **数据库连接失败**: 检查 MySQL 服务状态和连接配置
2. **前端构建失败**: 确保 Node.js 版本兼容，清理 node_modules 重新安装
3. **文件上传失败**: 检查文件目录权限和磁盘空间
4. **内存溢出**: 调整 JVM 参数，增加堆内存大小