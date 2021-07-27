#!/bin/bash
curl -sS -X POST http://localhost:9003/writetagged -d '{
  "namespace": "default",
  "id": "test-id-0",
  "tags": [
    {
      "name": "city",
      "value": "bj"
    }
  ],
  "datapoint": {
    "timestamp": '"$(date "+%s")"',
    "value": 42.123456789
  }
}'


curl -sS -X POST http://localhost:9003/query -d '{
  "namespace": "default",
  "query": { "term": { "field": "city", "term": "bj" } },
  "rangeStart": '"$(date -d "10 second ago" "+%s")"',
  "rangeEnd": '"$(date "+%s")"'
}'
