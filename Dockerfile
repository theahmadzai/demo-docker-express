# Build stage
FROM node:lts-alpine AS build

WORKDIR /build

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

# Runtime stage
FROM nginx:alpine AS runtime

COPY --from=build /build/build /usr/share/nginx/html
