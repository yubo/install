.PHONY: install uninstall start stop enable disable restart log status

install:
	sudo ./scripts/install.sh

uninstall:
	sudo rm /usr/lib/systemd/system/prometheus.service && \
	sudo systemctl daemon-reload

enable:
	sudo systemctl enable prometheus

disable:
	sudo systemctl disable prometheus

start:
	sudo systemctl start prometheus

stop:
	sudo systemctl stop prometheus

restart:
	sudo systemctl restart prometheus

status:
	sudo systemctl status prometheus

log:
	sudo journalctl -u prometheus -f
