#!/bin/bash
CWD=$(cd $(dirname $0)/; pwd)
cd $CWD/..

APP=m3coordinator
systemctl stop ${APP}

mkdir -p /opt/${APP}/{bin,etc}

cp -af ./bin/* /opt/${APP}/bin/
cp -af ./etc/*.yml /opt/${APP}/etc/

sudo cp -a ./systemd/${APP}.service /usr/lib/systemd/system/${APP}.service
systemctl daemon-reload
systemctl start ${APP}
systemctl status ${APP}
