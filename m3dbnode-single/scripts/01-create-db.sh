#!/bin/bash
curl -s -X POST http://localhost:7201/api/v1/database/create -d '{
  "type": "local",
  "namespaceName": "default",
  "numShards": "8",
  "retentionTime": "24h"
}'
