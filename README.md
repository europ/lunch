# Lunch

Daily menu scraper and visualizer built on top of ruby on rails hosted in a container behind a reverse proxy container provided by nginx.

## Schema

![schema.png](.other/schema.png)

## Setup

### Server

Instructions how to host this multicontainer application on a server with a specific domain name including SSL certificates.

#### Prerequisities

* domain name
* SSL certificate
* [docker-compose](https://docs.docker.com/compose)
    * [docker](https://docs.docker.com/engine)

#### Instructions

1. configure enviroment
    1. run `cp .env.example .env`
    1. add your domain name to `.env` file
1. add your SSL certificate files to `proxy/conf.d/`
    * add your CRT file as `lunch.crt`(`proxy/conf.d/lunch.crt`)
    * add your KEY file as `lunch.key`(`proxy/conf.d/lunch.key`)
1. build the application via `docker-compose build`
1. start the application via `docker-compose up -d`

### Local

Instructions how to launch locally rails application only.

#### Prerequisities

It is recommended to use [rbenv/rbenv](https://github.com/rbenv/rbenv) with [rbenv/ruby-build](https://github.com/rbenv/ruby-build).

| software | version |
| -------- | ------- |
| ruby     | 2.7.1   |
| gem      | 3.1.2   |
| bundle   | 2.1.4   |
| rails    | 6.0.3.3 |

#### Instructions

1. change directory to lunch via `cd lunch`
1. install dependencies via `bundle install`
1. start the application via `bundle exec rails server`
    * to specify custom IP address use `-b <IP>`
    * to specify custom port number use `-p <NUM>`
1. visit `http://localhost:3000`
