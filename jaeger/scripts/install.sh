#!/bin/bash
CWD=$(cd $(dirname $0)/; pwd)
cd $CWD/..

systemctl stop jaeger

mkdir -p /opt/jaeger/{etc,bin}
mkdir -p /opt/data/jaeger

sudo cp -a ./bin/jaeger-all-in-one /opt/jaeger/bin/
sudo cp -a ./etc/* /opt/jaeger/etc/
sudo cp -a ./systemd/jaeger.service /usr/lib/systemd/system/jaeger.service
systemctl daemon-reload
systemctl start jaeger
systemctl status jaeger
