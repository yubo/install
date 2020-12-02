#!/bin/bash
# -p 3000:3000 \
docker run -d \
  	--network host \
	--name grafana \
	grafana/grafana:latest
