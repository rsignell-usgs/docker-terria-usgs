# docker-terria-usgs
TerriaJS Docker configuration for USGS applications featuring:
- USGS logo
- Map starts in 2D map zoomed to USA
- Added feedback tool and instructions in devserverconfig.json to customize it to use user's github tokens 
- About button redirects to USGS maps page.
- Basemap layer thumbnails for USA
- Feedback script dose not capture IP (names, emails)

## Installation

* Clone this repository: 
  ```
   git clone https://github.com/rsignell-usgs/docker-terria-usgs.git
  ```
* Build the Docker container:
  * Option 1: use a forked/customized version of the TerriaJS code.
    * Copy the `Dockerfile` in `install_from_original_repo` directory to a local folder.
  * Option 2: use the official version of the TerriaJS code with `COPY` commands to overwrite files that need to be customized. 
    * Copy the `Dockerfile` and the folders in `install_from_forked_repo` directory to a local folder. 
  Whether you selected Option 1 or Option 2, build the container with:  
  ```
  docker build -t terria-usgs .
  ```

* Copy the config files in `required_files` to the directory where you have `docker-compose.yml`
* Edit the copied files modifying the tokens in `devserverconfig.json` and `config.json`. To get a personal access token for gist, go to: https://github.com/settings/tokens

* Edit nginx config file to map port 3002.  It should look something like:

```
# terria-vanilla

  location /terria-usgs/ {
    proxy_set_header Host $host;
    proxy_read_timeout 3600;
    proxy_pass http://terria-usgs:3002/;
    include /etc/nginx/conf.d/include/cors.include;
  }
```

* Start the container: 
```
docker-compose up -d terria-usgs
``` 

