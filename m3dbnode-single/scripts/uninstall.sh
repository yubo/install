#!/bin/bash
systemctl stop m3dbnode 
systemctl disable m3dbnode 

if [[ -d /opt/data/m3db ]]; then
	rm -rf /opt/data/m3db
fi

if [[ -d /opt/data/m3kv ]]; then
	rm -rf /opt/data/m3kv
fi

if [[ -d /opt/m3db ]]; then
	rm -rf /opt/m3db
fi

if [[ -f /usr/lib/systemd/system/m3dbnode.service ]]; then
	rm /usr/lib/systemd/system/m3dbnode.service
fi

systemctl daemon-reload
