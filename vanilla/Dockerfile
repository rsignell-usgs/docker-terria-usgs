FROM node:boron

MAINTAINER Siavash Ameli <samei@berkeley.edu>
LABEL Description="TerriaJS dockerized."

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
RUN git clone https://github.com/zdefne-usgs/TerriaMap
WORKDIR /usr/local/app/TerriaMap

# Disabling the disclaimer page at startup.
# RUN sed -i '2s/.*/The information on this website is not for navigation purposes./' lib/Views/GlobalDisclaimer.html

RUN npm install
RUN npm run gulp
EXPOSE 3001

# --------------------
# Run within container
# --------------------

# This section turns when the image is running as a container.
# Only the last CMD is running, so I commented the gulp watch command.

CMD [ "node", "node_modules/terriajs-server/lib/app.js", "--config-file", "devserverconfig.json" ]
