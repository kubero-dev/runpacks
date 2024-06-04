FROM alpine
RUN apk add --no-cache bash kubectl
COPY --chmod=755 init.sh /init.sh
ENTRYPOINT ["/init.sh"]
