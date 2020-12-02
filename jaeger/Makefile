.PHONY: install uninstall start stop enable disable restart log status

install:
	sudo ./scripts/install.sh

uninstall:
	sudo rm /usr/lib/systemd/system/jaeger.service && \
	sudo systemctl daemon-reload

enable:
	sudo systemctl enable jaeger

disable:
	sudo systemctl disable jaeger

start:
	sudo systemctl start jaeger

stop:
	sudo systemctl stop jaeger

restart:
	sudo systemctl restart jaeger

status:
	sudo systemctl status jaeger

log:
	sudo journalctl -u jaeger -f
