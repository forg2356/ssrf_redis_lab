FROM centos:7

FROM centos:7

# 更换为阿里云镜像源
RUN sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://mirrors.aliyun.com|g' /etc/yum.repos.d/CentOS-Base.repo

# 安装所需的软件包
RUN yum install php php-curl wget cronie openssh-server -y

RUN yum install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y 
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y 
RUN yum install yum-utils -y 
RUN yum-config-manager --enable remi-php73 -y

RUN yum install php php-curl wget cronie openssh-server -y 
RUN yum groupinstall "Development Tools" -y

RUN wget http://download.redis.io/releases/redis-5.0.5.tar.gz 
RUN tar xzf redis-5.0.5.tar.gz 
RUN cd redis-5.0.5 && make && make install

RUN mkdir /etc/redis && cp /redis-5.0.5/redis.conf /etc/redis

COPY ./start.sh /
RUN chmod +x /start.sh
ADD ./www /www
WORKDIR /www

EXPOSE 8080
EXPOSE 22

ENTRYPOINT ["/start.sh"]
