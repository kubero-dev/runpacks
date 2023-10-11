FROM alpine:3.18
RUN apk update
RUN apk add git openssh openssh-client
COPY --chmod=0755 ssh_config /etc/ssh/ssh_config
COPY --chmod=0755 init.sh /init.sh

RUN adduser -D -u 1000 kubero
USER kubero
#ENTRYPOINT [ "/init.sh" ]
CMD [ "/init.sh" ]
#WORKDIR /app