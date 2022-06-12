FROM node:18-alpine
RUN apk update
RUN apk add git
COPY --chmod=0755 init.sh /init.sh
ENTRYPOINT [ "/init.sh" ]
#WORKDIR /app