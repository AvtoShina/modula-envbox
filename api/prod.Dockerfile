FROM node:24-alpine3.21

ENV NODE_ENV=production
WORKDIR /src

COPY package.json package-lock.json* ./
RUN npm ci

COPY . .
RUN npm run build && npm prune --omit=dev

EXPOSE 3000
CMD ["node", "dist/main.js"]
