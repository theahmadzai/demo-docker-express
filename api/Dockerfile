FROM node:14-slim

WORKDIR /usr/api

COPY package.json ./

RUN npm i -g nodemon

RUN npm install

COPY . .

EXPOSE 8000

CMD ["npm", "start"]
