FROM node:20.10.0 as base
WORKDIR /app

FROM base as dev
ARG UID=1000
ARG GID=1000
RUN groupmod -g $GID node && \
    usermod -u $UID -g $GID node
USER node
CMD ["/bin/sh", "-c", "npm i && npm run dev"]

FROM base as build
COPY package.json .
COPY package-lock.json .
RUN npm ci
COPY public public
COPY src src
COPY env.d.ts .
COPY index.html .
COPY postcss.config.js .
COPY tailwind.config.ts .
COPY tsconfig.app.json .
COPY tsconfig.json .
COPY tsconfig.node.json .
COPY tsconfig.vitest.json .
COPY vite.config.ts .
RUN npm run build

FROM scratch as dist
COPY --from=build /app/dist /