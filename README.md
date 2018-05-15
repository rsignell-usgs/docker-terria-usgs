# docker-terria-usgs
TerriaJS container customized for USGS applications. See instructions below for installing a clean USGS TerriaMap from scratch. 

# List of changes
Following changes were applied to deploy USGS TerriaMap. Changes implemented through `init` and `config` files or mapping files :
 - Added USGS logo
 - Map starts in 2D map zoomed to USA
 - Added feedback tool and instructions in devserverconfig.json to customize it to use user's github tokens 
- About button redirects to USGS maps page.

Changes made by modifying the repository content or to the code:
 - Replaced  basemap layer thumbnails from AU to USA
- Modified feedback script to prevent from posting names, emails and IP address


# Recipe
* Clone this repo:
```
git clone https://github.com/rsignell-usgs/docker-terria-usgs
```

Choose one of the two installation options: Option 1 to install from the original TerriaJS repo and replace the files to customize or Option 2 to install form the personal repo forked from TerriaJS. They produce the same result.   

### Option 1 - Install from original repo 
* Copy the `Dockerfile` in `install from original repo` directory to `/opt/docker/vanilla`

### Option 2 - Install from forked repo 
* Copy the `Dockerfile` and the folders in `install from forked repo` directory to `/opt/docker/vanilla`

Following steps are common in both installation options.  

* Use the correct `Dockerfile` to create an image called `terria-vanilla` 
: 
```
docker build -t terria-vanilla .
```

* Copy content in `required files` directory to `/opt/docker/vanilla`. These are the files that are mapped in `docker-compose.yml`
* Edit the copied files. Edit tokens in `devserverconfig.json` and `config.json`. Get a personal access token for gist here: https://github.com/settings/tokens

* Edit nginx config file to map port 3002:

```
# terria-vanilla

  location /terria-vanilla/ {
    proxy_set_header Host $host;
    proxy_read_timeout 3600;
    proxy_pass http://terria-vanilla:3002/;
    include /etc/nginx/conf.d/include/cors.include;
  }
```

* Start the conatiner with: 
```
docker-compose up -d
``` 
