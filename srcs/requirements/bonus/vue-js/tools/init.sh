#!/bin/sh

if vue inspect; then
    npm run serve -- --port 4848;
else
    echo "Y" | vue create . --default;
    npm run serve -- --port 4848;
fi