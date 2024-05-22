# specify the node base image with your desired version node:<version>
FROM node:16

WORKDIR /usr/app

COPY package.json ./package.json
RUN npm install --omit=dev

COPY src/*.ts .
COPY tsconfig.json ./tsconfig.json
RUN npx esbuild ./app.ts --bundle --platform=node

# FROM node:16
# COPY --from=0 /usr/app/dist/* .
EXPOSE 8888
CMD [ "npm run start" ]
