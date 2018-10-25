#! /bin/bash

MACHINE_NAME=soundoftext

pushd machine
machine-import $MACHINE_NAME.zip
popd

set -e

docker-machine ssh $MACHINE_NAME "mkdir -p /opt/traefik"
docker-machine scp ./traefik.toml $MACHINE_NAME:/opt/traefik/traefik.toml

eval $(docker-machine env $MACHINE_NAME)

./scripts/up.sh
