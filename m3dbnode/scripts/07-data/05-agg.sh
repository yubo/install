#!/bin/bash
curl -sS -X POST http://localhost:9003/aggregate -d '{
  "namespace": "default",
  "query": {
     "conjunction": {
       "queries": [
          { "term": { "field": "__name__", "term": "prometheus_engine_query_duration_seconds" } }
       ]
     }
  },
  "noData": true,
  "aggregateQueryType": "AGGREGATE_BY_TAG_NAME",
  "rangeStart": '"$(date -d "100 second ago" "+%s")"',
  "rangeEnd": '"$(date "+%s")"'
}'

