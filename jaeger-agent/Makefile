.PHONY: install uninstall start stop enable disable restart log status

install:
	sudo ./scripts/install.sh

uninstall:
	sudo rm /usr/lib/systemd/system/jaeger-agent.service && \
	sudo systemctl daemon-reload

enable:
	sudo systemctl enable jaeger-agent

disable:
	sudo systemctl disable jaeger-agent

start:
	sudo systemctl start jaeger-agent

stop:
	sudo systemctl stop jaeger-agent

restart:
	sudo systemctl restart jaeger-agent

status:
	sudo systemctl status jaeger-agent

log:
	sudo journalctl -u jaeger-agent -f
