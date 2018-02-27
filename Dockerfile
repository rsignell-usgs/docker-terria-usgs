FROM node:boron

MAINTAINER Rich Signell <rsignell@usgs.gov>
LABEL Description="TerriaJS dockerized for USGS Applications"

# ------------
# Nodejs, Gdal
# ------------

RUN apt-get update && apt-get install -y git gdal-bin
RUN apt-get update && apt-get install -y git nodejs

# ---------------------
# TerriaJS installation
# ---------------------

RUN npm install -g gulp
RUN mkdir -p /usr/local/app/
WORKDIR /usr/local/app/

# ----------------------------------------
# Use TerriaMap branch customized for USGS
# ----------------------------------------

RUN git clone -b USGS https://github.com/zdefne-usgs/TerriaMap
WORKDIR /usr/local/app/TerriaMap

RUN npm install
RUN npm run gulp
EXPOSE 3001

# --------------------
# Run within container
# --------------------

CMD [ "node", "node_modules/terriajs-server/lib/app.js", "--config-file", "devserverconfig.json" ]
