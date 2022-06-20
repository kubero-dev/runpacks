#!/bin/sh

#echo "========= load deployment keys"
#eval `ssh-agent`
#ssh-add /root/.ssh/*
#ssh-keyscan github.com >>~/.ssh/known_hosts

echo "========== whipe the app dir"
rm -rf /app/* /app/.* >> /dev/null 2>&1

# fetch code from git
echo "========== Clone Repository from $GIT_REPOSITORY"
cd /app 
git clone $GIT_REPOSITORY .
rm -rf .git

echo "========== Run npm install"
# install node dependencies

if [ -f "yarn.lock" ]; then
    yarn install
else 
    npm install
fi