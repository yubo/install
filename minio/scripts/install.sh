#!/bin/bash
CWD=$(cd $(dirname $0)/; pwd)
cd $CWD/..

systemctl stop minio

mkdir -p /opt/minio/{etc,bin}
mkdir -p /opt/data/minio

sudo cp -a ./etc/minio /opt/minio/etc/
sudo cp -a ./bin/minio /opt/minio/bin/
sudo cp -a ./systemd/minio.service /usr/lib/systemd/system/minio.service
systemctl daemon-reload
systemctl start minio
systemctl status minio
