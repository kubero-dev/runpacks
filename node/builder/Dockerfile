FROM node:18-alpine
RUN apk update
RUN apk add git openssh openssh-client
COPY --chmod=0755 init.sh /init.sh
COPY --chmod=0400 ssh_config /etc/ssh/ssh_config
#ENTRYPOINT [ "/init.sh" ]
CMD [ "/init.sh" ]
#WORKDIR /app