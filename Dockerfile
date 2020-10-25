FROM node:latest

USER node

WORKDIR /home/node/src

COPY --chown=node:node . .

RUN npm ci

CMD ["node", "index.js"]
