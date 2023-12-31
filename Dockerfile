FROM node:16.16.0-alpine as node
WORKDIR /app

FROM node as modules
COPY package.json .
COPY package-lock.json .
RUN npm ci

FROM node as build
COPY . .
COPY --from=modules /app/node_modules /app/node_modules
RUN npm run build

FROM nginx:1.23.1-alpine
WORKDIR /app
COPY nginx /etc/nginx
COPY --from=build /app/dist /app