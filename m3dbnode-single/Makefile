.PHONY: install
install:
	sudo ./scripts/install.sh

.PHONY: uninstall
uninstall:
	sudo ./scripts/uninstall.sh

.PHONY: stop
stop:
	sudo systemctl stop m3dbnode

.PHONY: status
status:
	sudo systemctl status m3dbnode

.PHONY: log
log:
	sudo journalctl -u m3dbnode -f

.PHONY: db
db:
	./scripts/01-create-db.sh
