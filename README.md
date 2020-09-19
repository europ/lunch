# Lunch

Daily menu scraper and visualizer built on top of ruby on rails.

### Prerequisities

* [docker-compose](https://docs.docker.com/compose)
    * [docker](https://docs.docker.com/engine)

### Setup

1. run `docker-compose up -d`
    * add `--build` option to rebuild the docker image
1. get container IP
    1. run `docker ps`
    1. run `docker inspect <CONTAINER ID>`
    1. look for `IPAddress`
1. open `http://<IPAddress>/`
