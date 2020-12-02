#!/bin/bash
#    -p 9090:9090 \
docker run \
	-d --name prom \
	--network host \
	-v $(pwd)/config:/etc/prometheus \
	prom/prometheus
