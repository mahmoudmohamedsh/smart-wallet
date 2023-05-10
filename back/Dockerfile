FROM node:lts-alpine

WORKDIR /app

COPY package*.json  /app

RUN npm install

COPY . /app

EXPOSE 3000

CMD ["node","start"]


# docker build -t node-test .
# docker run -it -p 9000:3000 node-test
# docker run -d -p 9000:3000 node-test
# show work in background containers:
# -----------------------------------
# docker ps
# docker images
# docker login
# delete image:
# -------------
# docker image rm node-test