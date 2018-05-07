
# Recipe

* Clone this repo:
```
git clone https://github.com/rsignell-usgs/docker-terria-usgs
```

* Copy content in vanilla directory to /opt/docker/vanilla

* Build an image using `Dockerfile` called `terria-vanilla` by the `docker buid` command below. If installing more than one instance of TerriaMap see the instructions in the `Dockerfile` to change the installation folder prior this commad. 
```
docker build -t terria-vanilla .
```

* Edit tokens in `devserverconfig.json`, `config.json` and `usgs.json`
- Get a personal access token for gist here: https://github.com/settings/tokens

* Copy content in `docker-compose.yml` 

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


 
