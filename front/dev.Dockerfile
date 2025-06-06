FROM node:24-alpine3.21

WORKDIR /src
EXPOSE 5173

CMD ["sh", "-c", "npm install -D && npm run dev"]
