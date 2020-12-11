#!/bin/bash
APP=m3coordinator
systemctl stop ${APP}
systemctl disable ${APP}

if [[ -f /usr/lib/systemd/system/${APP}.service ]]; then
	rm -f /usr/lib/systemd/system/${APP}.service
fi

systemctl daemon-reload
