#!/bin/bash
set -x
curl -sS -X POST http://localhost:9003/query -d '{
  "namespace": "default",
  "query": { "regexp": { "field": "dts_task", "regexp": "passcode-num" } },
  "rangeStart": '"$(date -v-1m "+%s")"',
  "rangeEnd": '"$(date "+%s")"'
}'

# transfer
#curl -sS -X POST http://localhost:8008/api/index/tagkv -d '{
#  "nids": ["5252"],
#  "metrics": ["beta-cm-tang-CM_bc_pc_num"],
#  "start": '"$(date -d "3600 second ago" "+%s")"',
#  "end": '"$(date "+%s")"'
#}'
