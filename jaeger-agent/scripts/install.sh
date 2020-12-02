#!/bin/bash
CWD=$(cd $(dirname $0)/; pwd)
cd $CWD/..

systemctl stop jaeger-agent

mkdir -p /opt/jaeger-agent/{etc,bin}
mkdir -p /opt/data/jaeger-agent

sudo cp -a ./bin/jaeger-agent /opt/jaeger-agent/bin/
sudo cp -a ./etc/* /opt/jaeger-agent/etc/
sudo cp -a ./systemd/jaeger-agent.service /usr/lib/systemd/system/jaeger-agent.service
systemctl daemon-reload
systemctl start jaeger-agent
systemctl status jaeger-agent
