# specify the node base image with your desired version node:<version>
FROM node:16

WORKDIR /usr/app

COPY package.json /usr/app/package.json
RUN npm install

COPY *.js ./
RUN npm update

# replace this with your application's default port
EXPOSE 8888
CMD [ "npm run start" ]
