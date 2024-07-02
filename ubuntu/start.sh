#!/bin/bash
ssh-keygen -A
service cron start
service rsyslog start
service sshd start
redis-server /etc/redis/redis.conf --daemonize yes

php -S 0.0.0.0:8080
