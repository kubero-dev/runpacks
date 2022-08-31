# Kubero Docker-images

This is the home of the Kubero Base image. The main purpose of this image ist to fetch the code from the repository and prepare the init scripts based on the Procfile.

For now only the Procfile is respected (devfile and app.json may follow in the future).

Format of the Procfile with a node application:
```
build: npm install
web: node index.js
worker: node worker.js
```

## Usage

```bash
export GIT_REPOSITORY=git@github.com:kubero-dev/template-nodeapp.git
export GIT_BRANCH=main
```

In case you want to pull a private repository you need to place your private deploy key in the `./keys/deploykey` file. 

Build the base image
```bash
cd packs/base
docker-compose build
docker-compose up -d
```

Run your App after the code was fetched into the `./data` directory.
```bash
cd packs/node
docker-compose up -d
```