#! /bin/bash

pushd machine
machine-import soundoftext.zip
popd

eval $(docker-machine env soundoftext)

./scripts/up.sh
