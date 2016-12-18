# Laravel Queue Worker

### From CLI
```
$ cd /path/to/laravel
$ docker run jrdn/laravel-queue-worker -e "QUEUE=high,default"
```

### From docker-compose.yml
```yaml
worker:
  image: jrdn/laravel-queue-worker:latest
  volumes:
    - ./:/var/www
  restart: always
  environment:
    - QUEUE=high,default     # Defaults to 'default'
    - CONNECTION=redis       # Defaults to 'default'
  
```

#### Expectations
* Expects laravel installation to be present and will mount in /var/www