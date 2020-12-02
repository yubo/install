.PHONY: install log status stop uninstall

install:
	sudo ./scripts/install.sh

uninstall:
	sudo systemctl stop m3dbnode && \
	sudo systemctl disable etcd

stop:
	sudo systemctl stop m3dbnode

status:
	sudo systemctl status m3dbnode

log:
	sudo journalctl -u m3dbnode -f
