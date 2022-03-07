#!/bin/bash
docker build -t jmeritt/sonarr --no-cache .
docker push jmeritt/sonarr