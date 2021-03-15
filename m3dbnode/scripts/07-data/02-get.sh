#!/bin/bash
curl -sS -X POST http://localhost:9003/query -d '{
  "namespace": "default",
  "query": {
    "regexp": {
      "field": "server",
      "regexp": "a"
    }
  },
  "rangeStart": '"$(date -d "10 second ago" "+%s")"',
  "rangeEnd": '"$(date "+%s")"'
}'

