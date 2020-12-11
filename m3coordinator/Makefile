APP=m3coordinator

.PHONY: install
install:
	sudo ./scripts/install.sh

.PHONY: uninstall
uninstall:
	sudo ./scripts/uninstall.sh

.PHONY: stop
stop:
	sudo systemctl stop $(APP)

.PHONY: status
status:
	sudo systemctl status $(APP)

.PHONY: log
log:
	sudo journalctl -u $(APP) -f
