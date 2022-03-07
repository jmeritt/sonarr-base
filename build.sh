#!/bin/bash
docker build -t --no-cache jmeritt/sonarr .
docker push jmeritt/sonarr