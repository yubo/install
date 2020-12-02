.PHONY: install log start stop enable disable

install:
	sudo ./scripts/install.sh

enable:
	sudo systemctl enable grafana-server

disable:
	sudo systemctl disable grafana-server

start:
	sudo systemctl start grafana-server

stop:
	sudo systemctl stop grafana-server

restart:
	sudo systemctl restart grafana-server

log:
	sudo journalctl -u grafana-server -f

