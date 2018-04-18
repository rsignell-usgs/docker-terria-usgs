
# Recipe

* Clone this repo:
```
git clone https://github.com/rsignell-usgs/docker-terria-usgs
```

* Copy content in vanilla directory to /opt/docker/vanilla

* Build an image using `Dockerfile` called `terria-vanilla` by this command:
```
docker build -t terria-vanilla .
```

* Edit tokens in `devserverconfig.json`, `config.json` and `usgs.json`

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


 
