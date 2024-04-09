#!/bin/bash

ID=$(($(date +%s)*1000))

cd /home/docker/actions-runner
./config.sh --url ${URL} --token ${TOKEN} --name ${NAME:-self-hosted}-${ID} --work working-dir --labels ${LABELS:-nullplatform} --unattended --replace

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

node server.js &

./run.sh & wait $!
