curl -X POST http://localhost:7201/api/v1/database/create -d '{
  "type": "cluster",
  "namespaceName": "default",
  "retentionTime": "36h",
  "numShards": "4",
  "replicationFactor": "1",
  "hosts": [
        {
            "id": "m3db_local",
            "isolationGroup": "g1",
            "zone": "embedded",
            "weight": 100,
            "address": "127.0.0.1",
            "port": 9000
        }
    ]
}'
