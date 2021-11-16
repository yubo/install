.PHONY: install uninstall start stop enable disable restart log status docker

docker-run:
	docker run -d --name jaeger \
		-e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
		-p 5775:5775/udp \
		-p 6831:6831/udp \
		-p 6832:6832/udp \
		-p 5778:5778 \
		-p 16686:16686 \
		-p 14268:14268 \
		-p 14250:14250 \
		-p 9411:9411 \
		jaegertracing/all-in-one:1.28

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
