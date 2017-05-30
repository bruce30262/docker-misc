# reference: http://phriscage.github.io/2016/01/18/Hexo-blog-development-on-Docker/

FROM node:latest
MAINTAINER bruce30262

## set HEXO_SERVER_PORT environment default
ENV HEXO_SERVER_PORT=4000

## update the respositories
RUN apt-get update
## install git & expect for deployment
RUN apt-get install git expect -y

## solve permission issue
RUN npm config set user 0 && npm config set unsafe-perm true

## install hexo-cli globally
RUN npm install -g hexo-cli

## set the workdir
WORKDIR /app

## expose the HEXO_SERVER_PORT
EXPOSE ${HEXO_SERVER_PORT}

## npm install the latest packages from package.json and run the hexo server
CMD npm install; hexo clean; hexo server -d -p ${HEXO_SERVER_PORT}
