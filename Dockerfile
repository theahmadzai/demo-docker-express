# Build stage
FROM node:current-alpine AS build

WORKDIR /build

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

# Runtime stage
FROM nginx:alpine AS runtime

COPY --chown=node:node --from=build /build/build /usr/share/nginx/html
