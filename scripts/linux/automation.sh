#!/bin/bash

docker build -t webserver -f ../Dockerfile ..

image_tag=$(date +%Y%m%d%H%M%S) 
docker tag webserver webserver:$image_tag

sed "s/MY_NEW_IMAGE/$image_tag/" script.yaml > new-app.yaml

kubectl diff -f new-app.yaml
