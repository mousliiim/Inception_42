#!/bin/sh

echo "Y" | vue create . --default;
npm run serve -- --port 4848;