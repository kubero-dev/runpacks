#!/bin/sh

#echo "========= load deployment keys"
#eval `ssh-agent`
#ssh-add /root/.ssh/*
#ssh-keyscan github.com >>~/.ssh/known_hosts

echo "========== whipe the app dir"
rm -rf /app/* /app/.* >> /dev/null 2>&1

echo "========== Clone Repository from $GIT_REPOSITORY"
cd /app 
git clone --recurse-submodules $GIT_REPOSITORY .
#git checkout $GIT_BRANCH
rm -rf .git

echo "========== write startupscripts based on Procfile"
if [ ! -f init_build.sh ]
    BUILD_CMD=$(cat Procfile | grep build | awk -F  ": " '{print $2}')
    echo init-build.sh
    echo "#!/bin/sh" > init-build.sh
    echo -n $BUILD_CMD >> init-build.sh
fi

if [ ! -f init_build.sh ]
    WEB_CMD=$(cat Procfile | grep web | awk -F  ": " '{print $2}') 
    echo init-web.sh
    echo "#!/bin/sh" > init-web.sh
    echo -n $WEB_CMD >> init-web.sh
fi

if [ ! -f init_build.sh ]
    WORKER_CMD=$(cat Procfile | grep worker | awk -F  ": " '{print $2}')
    echo init-worker.sh
    echo "#!/bin/sh" > init-worker.sh
    echo -n $WORKER_CMD >> init-worker.sh
fi

chmod +x init-*.sh
