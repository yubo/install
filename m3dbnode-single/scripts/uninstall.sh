#!/bin/bash
APP=m3dbnode
systemctl stop ${APP}
systemctl disable ${APP}

if [[ -d /opt/data/m3db ]]; then
	rm -rf /opt/data/m3db
fi

if [[ -d /opt/data/m3kv ]]; then
	rm -rf /opt/data/m3kv
fi

if [[ -f /usr/lib/systemd/system/${APP}.service ]]; then
	rm -f /usr/lib/systemd/system/${APP}.service
fi

systemctl daemon-reload
