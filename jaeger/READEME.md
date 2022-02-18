## Jaeger All in One
https://www.jaegertracing.io/docs/getting-started/

You can then navigate to http://localhost:16686 to access the Jaeger UI.

#### Run as a docker container

```
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
  jaegertracing/all-in-one:1.31
```

#### Run as a service
```
sudo ./scripts/install.sh
sudo systemctl enable jaeger
sudo systemctl start jaeger
```

#### Resources
- https://github.com/jaegertracing/jaeger
- https://www.jaegertracing.io/docs/1.21/getting-started/
