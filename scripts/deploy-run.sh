#! /bin/bash

command=${1?Please pass in a run script.}

pushd machine
machine-import soundoftext.zip
popd

eval $(docker-machine env soundoftext)

"$command"
