# Kubero Buildpacks

Kubero does NOT build real docker images but uses allready public available an well maintained Images. A buildpack consists of a three parts: 
- fetch (initContainer)
- build (initContainer)
- run (actual running Container for web abd worker deployment)

There are several examples in the packs folder to simulate on docker-compose how the app will be deployed. 

## fetch image
This is also the home of the Kubero fetch image. The main purpose of this image ist to pull the code from the repository and prepare the init scripts based on the Procfile. The Procfile will be ignored if a init allready exists. This allows you to write more complex init scripts.

For now only the Procfile is respected (devfile and app.json may follow in the future).

Format of the Procfile with a node application:
```
build: npm install
web: node index.js
worker: node worker.js
```

## Usage

1) Configure the repository you want to deploy.
```bash
export GIT_REPOSITORY=git@github.com:kubero-dev/template-nodeapp.git
export GIT_BRANCH=main
```

2) In case you want to pull a private repository you need to place your private deploy key in the `./keys/deploykey` file. 

3) Build the base image
```bash
cd packs/base
docker-compose build
docker-compose up -d
```

3) Run your App after the code was fetched into the `./data` directory.
```bash
cd packs/node
docker-compose up -d
```