# nginx-ssl-experiments
Nginx with BoringSSL and Docker

Blog article on choices made and step through instructions.
https://blog.redfog.io/devops/nginx-brotli-and-elliptic-curve-cryptography/

There are two example Virtual Hosts, one is for using ghost on local development with docker compose, the other is to use on a real domain with lets encrypt.

If you want to have a look at the [nginx.conf](https://github.com/Wonderfall/dockerfiles/blob/master/boring-nginx/nginx.conf) or how the docker image was built with boringssl that is [here](https://github.com/Wonderfall/dockerfiles/blob/master/boring-nginx/Dockerfile).
