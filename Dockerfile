FROM node:current-alpine

USER node

WORKDIR /home/docker-demo

COPY --chown=node:node package.json package-lock.json ./

RUN npm ci

COPY --chown=node:node ./src ./src

EXPOSE 8000

CMD ["node", "./src/index.js"]
