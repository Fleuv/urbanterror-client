# Dockerized Urban Terror Client

Launch and play [Urban Terror](https://www.urbanterror.info/) via docker.

> Currently under construction, looking for contributers! Have a look at the issues.


## Usage

First retrieve the image from docker hub.

```
docker pull fleuv/urbanterror-client:latest
```

Last but not least create a simple shell script wrapper to easily launch the game.

```
#!/bin/sh

HOST_Q3UT4="$HOME"/.q3ut4
DOCKER_Q3UT4=/usr/local/game/UrbanTerror/q3ut4

docker run \
    --rm \
    --net=host \
    -v "$HOST_Q3UT4"/authkey:"$DOCKER_Q3UT4"/authkey
    -v "$HOST_Q3UT4"/my.cfg:"$DOCKER_Q3UT4"/my.cfg
    fleuv/urbanterror-client:latest
