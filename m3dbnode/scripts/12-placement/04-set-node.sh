curl -X POST http://localhost:7201/api/v1/services/m3db/placement/set -d '
{
  "placement": {
    "instances": {
      "m3db_local": {
        "id": "m3db_local",
        "isolationGroup": "local",
        "zone": "embedded",
        "weight": 1,
        "endpoint": "127.0.0.1:9000",
        "shards": [
          {
            "id": 0,
            "state": "AVAILABLE",
            "sourceId": "",
            "cutoverNanos": "0",
            "cutoffNanos": "0"
          },
          {
            "id": 1,
            "state": "AVAILABLE",
            "sourceId": "",
            "cutoverNanos": "0",
            "cutoffNanos": "0"
          },
          {
            "id": 2,
            "state": "AVAILABLE",
            "sourceId": "",
            "cutoverNanos": "0",
            "cutoffNanos": "0"
          },
          {
            "id": 3,
            "state": "AVAILABLE",
            "sourceId": "",
            "cutoverNanos": "0",
            "cutoffNanos": "0"
          },
          {
            "id": 4,
            "state": "AVAILABLE",
            "sourceId": "",
            "cutoverNanos": "0",
            "cutoffNanos": "0"
          },
          {
            "id": 5,
            "state": "AVAILABLE",
            "sourceId": "",
            "cutoverNanos": "0",
            "cutoffNanos": "0"
          },
          {
            "id": 6,
            "state": "AVAILABLE",
            "sourceId": "",
            "cutoverNanos": "0",
            "cutoffNanos": "0"
          },
          {
            "id": 7,
            "state": "AVAILABLE",
            "sourceId": "",
            "cutoverNanos": "0",
            "cutoffNanos": "0"
          }
        ],
        "shardSetId": 0,
        "hostname": "localhost",
        "port": 9000,
        "metadata": {
          "debugPort": 0
        }
      }
    },
    "replicaFactor": 1,
    "numShards": 8,
    "isSharded": true,
    "cutoverTime": "0",
    "isMirrored": false,
    "maxShardSetId": 0
  },
  "confirm": true,
  "version": 5
}'
