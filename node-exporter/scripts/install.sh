#!/bin/bash
CWD=$(cd $(dirname $0)/; pwd)
cd $CWD/..

systemctl stop node-exporter

mkdir -p /opt/node_exporter/bin

cp -a ./systemd/node-exporter.service /usr/lib/systemd/system/node-exporter.service
cp -a ./bin/node_exporter /opt/node_exporter/bin/

systemctl daemon-reload
systemctl start node-exporter
systemctl status node-exporter
