#!/bin/bash

export WORKSPACE=/workspace/quickwin

command -v podman >/dev/null 2>&1 && { 

    podman build --format docker -t localhost/detect-water-body:latest ${WORKSPACE}/water-bodies/command-line-tools/detect-water-body

} || command -v docker >/dev/null 2>&1 && { 

    docker build -t localhost/detect-water-body:latest ${WORKSPACE}/water-bodies/command-line-tools/detect-water-body 
}



