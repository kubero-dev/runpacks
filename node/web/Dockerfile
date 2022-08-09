FROM node:18-alpine
COPY --chmod=555 kubero-entrypoint.sh /kubero-entrypoint.sh
ENTRYPOINT ["/kubero-entrypoint.sh"]
CMD ["node", "index.js"]