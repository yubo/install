# 单点节点 m3dbnode

## 安装启动

#### docker 方式启动
[single node](https://m3db.github.io/m3/how_to/single_node/)

```
docker run -p 7201:7201 -p 7203:7203 -p 9003:9003 \
	--name m3db -v $(pwd)/m3db_data:/var/lib/m3db \
	quay.io/m3db/m3dbnode:latest
```

#### systemd 启动
install
```
sudo ./scripts/install.sh
sudo systemctl status m3dbnode
```

paths
```
/opt/data/m3db
/opt/data/m3kv
/opt/m3db
```

## create database
create a persistent data directory on your host for durability:
```
curl -X POST http://localhost:7201/api/v1/database/create -d '{
  "type": "local",
  "namespaceName": "default",
  "retentionTime": "12h"
}'
```

get placement
```
curl http://localhost:7201/api/v1/placement | jq .
```

Now you can experiment with writing tagged metrics:
```
curl -sS -X POST http://localhost:9003/writetagged -d '{
  "namespace": "default",
  "id": "foo",
  "tags": [
    {
      "name": "__name__",
      "value": "user_login"
    },
    {
      "name": "city",
      "value": "new_york"
    },
    {
      "name": "endpoint",
      "value": "/request"
    }
  ],
  "datapoint": {
    "timestamp": '"$(date "+%s")"',
    "value": 42.123456789
  }
}
'
```

And reading the metrics you've written using the M3DB /query endpoint:
```
curl -sS -X POST http://localhost:9003/query -d '{
  "namespace": "default",
  "query": {
    "regexp": {
      "field": "city",
      "regexp": ".*"
    }
  },
  "rangeStart": 0,
  "rangeEnd": '"$(date "+%s")"'
}' | jq .

{
  "results": [
    {
      "id": "foo",
      "tags": [
        {
          "name": "__name__",
          "value": "user_login"
        },
        {
          "name": "city",
          "value": "new_york"
        },
        {
          "name": "endpoint",
          "value": "/request"
        }
      ],
      "datapoints": [
        {
          "timestamp": 1606901403,
          "value": 42.123456789
        }
      ]
    }
  ],
  "exhaustive": true
}
```
