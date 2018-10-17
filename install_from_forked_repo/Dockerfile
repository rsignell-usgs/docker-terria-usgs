FROM node:8.12

MAINTAINER Rich Signell <rsignell@usgs.gov>
LABEL Description="TerriaJS dockerized for USGS Applications"

# ------------
# Install Gdal 
# ------------

RUN apt-get update && apt-get install -y git gdal-bin


# ----------------------------------------
# Pick TerriaMap repo
# ----------------------------------------

WORKDIR /usr/local/app/

RUN git clone https://github.com/rsignell-usgs/TerriaMap.git 

WORKDIR /usr/local/app/TerriaMap

RUN npm install -g sync-dependencies && \
    sync-dependencies --source terriajs && \
    npm install && \
    npm run gulp

EXPOSE 3001

# --------------------
# Run within container
# --------------------

CMD [ "node", "node_modules/terriajs-server/lib/app.js", "--config-file", "devserverconfig.json" ]

