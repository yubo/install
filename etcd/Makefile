.PHONY: clean log status test install disable enable stop

# https://www.yuque.com/ecmc/manual/nzgpzr
# https://etcd.io/docs/v3.4.0/op-guide/configuration/

clean:
	rm -f ./certs/* && \
	rm -f ./systemd/etcd.service

install:
	sudo ./scripts/install.sh

disable:
	sudo systemctl disable etcd

enable:
	sudo systemctl enable etcd

stop:
	sudo systemctl stop etcd

test:
	/opt/etcd/bin/etcdctl --endpoints=https://127.0.0.1:2379 \
	--ca-file=/opt/etcd/certs/ca.pem \
	--cert-file=/opt/etcd/certs/client.pem \
	--key-file=/opt/etcd/certs/client-key.pem \
	member list && \
	/opt/etcd/bin/etcdctl --endpoints=https://127.0.0.1:2379 \
	--ca-file=/opt/etcd/certs/ca.pem \
	--cert-file=/opt/etcd/certs/client.pem \
	--key-file=/opt/etcd/certs/client-key.pem \
	cluster-health

status:
	sudo systemctl status etcd

log:
	sudo journalctl -u etcd -f
