FROM node:24-alpine3.21

WORKDIR /src

# Install ALL deps (incl. @nestjs/cli) for the build step
COPY package.json package-lock.json* ./
RUN npm ci

COPY . .

# Build with full deps, then drop devDependencies in the same layer
RUN npm run build && npm prune --omit=dev

ENV NODE_ENV=production

EXPOSE 3000
CMD ["node", "dist/main.js"]