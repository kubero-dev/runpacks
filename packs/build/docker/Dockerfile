FROM alpine:3
RUN apk --update add curl bash tar openrc buildah podman

# Install Nixpacks
RUN curl -sSL https://nixpacks.com/install.sh | bash

# Install pack for buildpacks
# (not installed since it is not possible to run pack inside a kubernetes cluster)
#RUN curl -sSL "https://github.com/buildpacks/pack/releases/download/v0.29.0/pack-v0.29.0-linux.tgz" | tar -C /usr/local/bin/ --no-same-owner -xzv pack