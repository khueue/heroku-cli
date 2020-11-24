FROM node:15.2.1-buster

RUN npm install --global heroku@7.47.3

ENTRYPOINT [ "heroku" ]
