# dispatch

Dispatch is an image to triger kpacks builds, wait till the image is built and then deploy it by patching the Kuberoapp CRD with the new image.

## install kpacks
```bash
## will be installed with the kubero cli
kubectl apply -f https://github.com/buildpacks-community/kpack/releases/download/v0.13.3/release-0.13.3.yaml

## will be handled by kubero operator
kubectl apply -f secrets.example.yaml -n yourpipeline-production
```

## build and deploy an image
```bash
## will be triggered by the kuberi-ui
kubectl apply -f job.example.yaml -n yourpipeline-production
```

## helpful debug commands
```bash
kubectl get builds -n yourpipeline-production
``` 
