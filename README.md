# Docker container for debugging

This is a simple container for debugging purposes. You can use it as a companion container to an existing one.
You can find the image on Dockerhub (https://hub.docker.com/r/csana/docker-debug/) 

The idea based on Janoszen's container (github.com/janoszen/docker-debug/) what he used on his devopsakademia.hu course (https://devopsakademia.hu/termek/hibakereses-docker-kornyezetben/), I just added few more apps I often use.

## Usage

First, you need to indentify the already running container you want to debug (eg. docker ps). **If your container is not running,
this will not work.**

Next, you have to launch this container while joining the existing containers namespaces. This will enable you to see
its processes and network interface:

```
export TARGET="target container ID here"
docker run \
  --pid container:$TARGET \
  --net container:$TARGET \
  --cap-add NET_RAW \
  --cap-add NET_ADMIN \
  --cap-add SYS_PTRACE \
  -ti
  janoszen/debug
```

You are now in a container that has more privileges than your normal running container (you can strace, etc) but sees
the same processes and network interface as the container you wish to debug.

