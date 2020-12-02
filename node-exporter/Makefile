.PHONY: install uninstall start stop enable disable restart log status

install:
	sudo ./scripts/install.sh

uninstall:
	sudo rm /usr/lib/systemd/system/node-exporter.service && \
	sudo systemctl daemon-reload

enable:
	sudo systemctl enable node-exporter

disable:
	sudo systemctl disable node-exporter

start:
	sudo systemctl start node-exporter

stop:
	sudo systemctl stop node-exporter

restart:
	sudo systemctl restart node-exporter

status:
	sudo systemctl status node-exporter

log:
	sudo journalctl -u node-exporter -f
