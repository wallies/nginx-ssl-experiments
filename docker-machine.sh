#!/bin/bash
export DOTOKEN=your-api-token
eval "$(docker-machine env -u)"

docker-machine create --driver digitalocean \
--digitalocean-access-token $DOTOKEN \
--digitalocean-region lon1 \
--digitalocean-image coreos-alpha \
--digitalocean-ssh-user core \
coreos-alpha

eval "$(docker-machine env coreos-alpha)"

docker-compose -f docker-compose.yml -f docker-compose-prod.yml up -d
