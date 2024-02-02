#!/bin/sh

#echo "========= load deployment keys"
#eval `ssh-agent`
#ssh-add /root/.ssh/*
#ssh-keyscan github.com >>~/.ssh/known_hosts

echo "========== debug"
echo "GIT_REPOSITORY: $GIT_REPOSITORY"
echo "GIT_BRANCH: $GIT_BRANCH"
echo "KUBERO_BUILDPACK_DEFAULT_BUILD_CMD: $KUBERO_BUILDPACK_DEFAULT_BUILD_CMD"
echo "KUBERO_BUILDPACK_DEFAULT_RUN_CMD: $KUBERO_BUILDPACK_DEFAULT_RUN_CMD"
echo "User:" `whoami`
echo "ID:" `id`
echo "Home:" $HOME
echo "PWD:" `pwd`

# prepare ssh keys
echo "========== copy ssh keys"
mkdir -p ~/.ssh
chmod -v 700 ~/.ssh
cat /home/kubero/.ssh-mounted/deploykey > ~/.ssh/deploykey
chmod -v 600 ~/.ssh/deploykey
#chmod -v 644 ~/.ssh/*.pub
touch ~/.ssh/known_hosts
chmod -v 644 ~/.ssh/known_hosts

echo "========== whipe the app dir"
rm -rf /app/* /app/.* >> /dev/null 2>&1
echo "Done"

echo "========== Clone Repository from $GIT_REPOSITORY"
cd /app
git clone --recurse-submodules $GIT_REPOSITORY .
git checkout $GIT_BRANCH
rm -rf .git

echo "========== write startupscripts based on Procfile"
if [ ! -f init_build.sh ]; then
    if [ -f Procfile ]; then
        BUILD_CMD=$(cat Procfile | grep build | awk -F  ": " '{print $2}')
    else
        BUILD_CMD=$KUBERO_BUILDPACK_DEFAULT_BUILD_CMD
    fi
    echo init-build.sh
    echo "#!/bin/sh" > init-build.sh
    echo -n $BUILD_CMD >> init-build.sh
fi

if [ ! -f init-web.sh ]; then
    if [ -f Procfile ]; then
        WEB_CMD=$(cat Procfile | grep web | awk -F  ": " '{print $2}')
    else
        WEB_CMD=$KUBERO_BUILDPACK_DEFAULT_RUN_CMD
    fi
    echo init-web.sh
    echo "#!/bin/sh" > init-web.sh
    echo -n $WEB_CMD >> init-web.sh
fi

if [ ! -f init-worker.sh ]; then
    if [ -f Procfile ]; then
        WORKER_CMD=$(cat Procfile | grep worker | awk -F  ": " '{print $2}')
    else
        WORKER_CMD=$KUBERO_BUILDPACK_DEFAULT_RUN_CMD
    fi
    echo init-worker.sh
    echo "#!/bin/sh" > init-worker.sh
    echo -n $WORKER_CMD >> init-worker.sh
fi

chmod +x init-*.sh
