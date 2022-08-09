FROM node:18-alpine
ENV npm_config_cache="/tmp/npm-cache"
COPY --chmod=555 kubero-entrypoint.sh /kubero-entrypoint.sh
ENTRYPOINT ["/kubero-entrypoint.sh"]