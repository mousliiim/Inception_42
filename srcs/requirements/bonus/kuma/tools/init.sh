#!/bin/bash

cd /app

remote_url=$(git config --get remote.origin.url)

desired_url="https://github.com/louislam/uptime-kuma.git"

if [ "$remote_url" = "$desired_url" ]; then
    npm run setup
else
    git clone https://github.com/louislam/uptime-kuma.git .
    git config --global --add safe.directory /app
    npm run setup
fi

node server/server.js
