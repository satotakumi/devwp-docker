# Develop WordPress theme in Docker

This repository helps to develop wordpress theme in Docker.

![Imgur](http://i.imgur.com/wLl5Bdv.png)
## Requirements

* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)

## Quick Start

```bash
$ git clone git@github.com:satotakumi/devwp-docker.git && cd devwp-docker
$ ./devwp.sh start
```

## Commands


### Start Containers 
```bash
$ ./devwp.sh start
```

### Stop Containers
```bash
$ ./devwp.sh stop
```

### Restart Containers
```bash
$ ./devwp.sh restart
```

### Reset Containers
```bash
$ ./devwp.sh reset
```
This command excute stop, `docker-compose rm` and start.

### Remove Containers
```bash
$ ./devwp.sh remove
```
