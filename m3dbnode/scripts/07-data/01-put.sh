#!/bin/bash

#for i in {1..20}; do
i=0
curl -sS -X POST http://localhost:9003/writetagged -d '{
  "namespace": "default",
  "id": "test-id-'${i}'",
  "tags": [
    {
      "name": "server",
      "value": "a"
    },
    {
      "name": "server",
      "value": "b"
    },
    {
      "name": "city",
      "value": "city-'${i}'"
    }
  ],
  "datapoint": {
    "timestamp": '"$(date "+%s")"',
    "value": 42.123456789
  }
}
'
#done

