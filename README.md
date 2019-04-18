# docker-ragemp-server

A docker image for a ragemp-server (Debian-based).

## Installation

Pull the docker image:

```sh
docker pull eisengrind/docker-ragemp-server
```

## Usage

You can choose whether you want to start the server directly

```sh
docker run -p 22005:22005/udp -p 22006:22006/tcp -it eisengrind/ragemp-server:1
```

or use the docker image for custom images in your **Dockerfile**

```sh
FROM eisengrind/ragemp-server:1
[...]
```
