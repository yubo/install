#!/bin/bash
docker run -d --rm --name s3 \
        -p 8090:9000 \
        -e MINIO_ACCESS_KEY=admin1234 \
        -e MINIO_SECRET_KEY=admin1234 \
        -v /var/lib/minio:/data minio/minio server /data
