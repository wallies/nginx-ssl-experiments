#!/bin/bash
export DOTOKEN=your-api-token
export DOMAIN=dns-domain
eval "$(docker-machine env -u)"

docker-machine create --driver digitalocean \
--digitalocean-access-token $DOTOKEN \
--digitalocean-region lon1 \
--digitalocean-image coreos-alpha \
--digitalocean-ssh-user core \
coreos-alpha

eval "$(docker-machine env coreos-alpha)"

docker run -it --rm --name letsencrypt \
  -v "$(pwd)/certs:/etc/letsencrypt" \
  quay.io/letsencrypt/letsencrypt \
  certonly --standalone \
  --csr /etc/letsencrypt/ecc.csr \
  --cert-path /etc/letsencrypt/live/cert.pem \
  --chain-path /etc/letsencrypt/live/chain.pem \
  --fullchain-path /etc/letsencrypt/live/fullchain.pem \
  --agree-tos \
  --renew-by-default \
  --email info@$DOMAIN \
  -d $DOMAIN \
  -d ssldemo.$DOMAIN

docker-compose -f docker-compose.yml -f docker-compose-prod.yml up -d
