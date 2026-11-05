FROM node:24-alpine3.21

WORKDIR /src

# Install deps at build time so restarts are fast.
# A bind mount will shadow /src, so also declare a node_modules volume in compose.
COPY package.json package-lock.json* ./
RUN npm ci

EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]
