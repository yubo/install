#!/bin/bash
curl -sS -X POST http://localhost:9003/query -d '{
  "namespace": "default",
  "query": {
     "conjunction": {
       "queries": [
          { "term": { "field": "__name__", "term": "prometheus_engine_query_duration_seconds" } }
       ]
     }
  },
  "noData": true,
  "rangeStart": '"$(date -d "100 second ago" "+%s")"',
  "rangeEnd": '"$(date "+%s")"'
}'

