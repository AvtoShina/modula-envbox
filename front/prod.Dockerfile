FROM node:24-alpine3.21 AS builder

RUN npm install && npm run build

FROM nginx:1.25
COPY --from=builder /src/dist /usr/share/nginx/html
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
