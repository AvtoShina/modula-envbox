FROM node:24-alpine3.21

WORKDIR /src
EXPOSE 3000

CMD ["sh", "-c", "npm install -D && npm start"]
