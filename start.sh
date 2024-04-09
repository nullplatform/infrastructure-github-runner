#!/bin/bash

ID=$(($(date +%s)*1000))

cd /home/docker/actions-runner
./config.sh --url ${URL} --token ${TOKEN} --name service-provisioning-${ID} --work working-dir --labels service-provisioning --unattended --replace

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

node server.js &

./run.sh & wait $!
