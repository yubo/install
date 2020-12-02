.PHONY: install uninstall start stop enable disable restart log status

install:
	sudo ./scripts/install.sh

uninstall:
	sudo rm /usr/lib/systemd/system/minio.service && \
	sudo systemctl daemon-reload

enable:
	sudo systemctl enable minio

disable:
	sudo systemctl disable minio

start:
	sudo systemctl start minio

stop:
	sudo systemctl stop minio

restart:
	sudo systemctl restart minio

status:
	sudo systemctl status minio

log:
	sudo journalctl -u minio -f
