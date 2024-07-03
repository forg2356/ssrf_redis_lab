# 使用包含 Python 2.7 的基础镜像
FROM python:2.7

# 设置非交互模式
ENV DEBIAN_FRONTEND noninteractive

# 安装 gosu, redis-server, curl 和 netcat
RUN apt-get update && \
    apt-get install -y gosu redis-server curl netcat-openbsd

# 获取并安装 pip
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && \
    python2 get-pip.py

# 复制应用程序代码到 /app 目录
COPY . /app

# 设置工作目录
WORKDIR /app

# 安装 Python 依赖
RUN pip install -r requirements.txt

# 复制并设置启动脚本
COPY ./start.sh /
RUN chmod +x /start.sh

# 暴露端口
EXPOSE 3333

# 设置入口点
ENTRYPOINT ["/start.sh"]
