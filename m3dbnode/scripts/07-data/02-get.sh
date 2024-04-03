#!/bin/bash
curl -sS -X POST http://localhost:9003/query -d '{
  "namespace": "default",
  "query": {
    "regexp": {
      "field": "server",
      "regexp": "a"
    }
  },
  "rangeStart": '"$(date -v-1m "+%s")"',
  "rangeEnd": '"$(date "+%s")"'
}'

