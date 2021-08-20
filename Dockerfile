# UPGRADE_POINT:
# See: https://hub.docker.com/_/node/
FROM node:15.2.1-buster

# UPGRADE_POINT:
# See: https://www.npmjs.com/package/heroku
RUN npm install --global heroku@7.57.0

ENTRYPOINT [ "heroku" ]
