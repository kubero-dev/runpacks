#!/bin/sh

# whipe the app dir
rm -rf /app/* /app/.*

# fetch code from git
cd /app 
git clone $GIT_REPOSITORY .
rm -rf .git

# install node dependencies
npm install