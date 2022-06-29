FROM node:16.15.1-alpine as node
WORKDIR /app

FROM node as modules
COPY package.json .
COPY package-lock.json .
RUN npm ci

FROM node as build
COPY . .
COPY --from=modules /app/node_modules /app/node_modules
RUN npm run build

FROM nginx:1.23.0-alpine
WORKDIR /app
COPY nginx /etc/nginx
COPY --from=build /app/dist /app