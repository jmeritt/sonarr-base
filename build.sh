#!/bin/bash
docker buildx build --platform linux/amd64 -t jmeritt/sonarr --no-cache .
docker push jmeritt/sonarr