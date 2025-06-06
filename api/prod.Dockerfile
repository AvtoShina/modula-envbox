FROM node:24-alpine3.21

WORKDIR /src
RUN npm install
RUN npm install -g pm2
EXPOSE 3000

# TODO: fix that. no-daemon is not working option here
CMD ["pm2-runtime", "start", "bin/www", "--no-daemon"]
