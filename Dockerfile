# Build stage
FROM node:current-alpine AS build

WORKDIR /build

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

# Runtime stage
FROM alpine:latest AS runtime

RUN apk add --update nodejs

RUN addgroup -S node && adduser -S node -G node

USER node

WORKDIR /home/docker-demo

COPY --chown=node:node --from=build /build .

EXPOSE 8000

CMD ["node", "./src/index.js"]
