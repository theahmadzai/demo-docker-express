FROM node:current-alpine

USER node

WORKDIR /home/node/src

COPY --chown=node:node package.json package-lock.json ./

RUN npm ci

COPY --chown=node:node ./src ./src

EXPOSE 8000

CMD ["node", "./src/index.js"]
