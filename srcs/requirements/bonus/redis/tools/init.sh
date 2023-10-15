#!/bin/sh

if [ -n "$REDIS_PASSWORD" ]; then
    echo -e "\nrequirepass $REDIS_PASSWORD" >> /etc/redis.conf
else
    echo -e "\nprotected-mode no" >> /etc/redis.conf
fi

redis-server /etc/redis.conf