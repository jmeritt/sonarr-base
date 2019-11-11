#!/bin/bash
docker build --no-cache -t jmeritt/sonarr .
docker push jmeritt/sonarr