#!/bin/bash
CWD=$(cd $(dirname $0)/; pwd)
cd $CWD/..

systemctl stop prometheus

mkdir -p /opt/prometheus/{bin,etc,consoles,console_libraries}
mkdir -p /opt/data/prometheus

cp -a ./systemd/prometheus.service /usr/lib/systemd/system/prometheus.service
cp -a ./bin/prometheus /opt/prometheus/bin/
cp -a ./etc/prometheus.yml /opt/prometheus/etc/
cp -a ./consoles/* /opt/prometheus/consoles/
cp -a ./console_libraries/* /opt/prometheus/console_libraries


systemctl daemon-reload
systemctl start prometheus
systemctl status prometheus
