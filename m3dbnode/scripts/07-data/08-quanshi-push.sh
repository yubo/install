#!/bin/bash

curl -sS -X POST http://localhost:9003/writetagged -d '{
  "namespace": "default",
  "id": "quanshi-1",
  "tags": [{
      "name": "__name__",
      "value": "beta-cm-tang-CM_bc_pc_num"
  },{
      "name": "__endpoint__",
      "value": "__nid__5252__"
  },{
      "name": "__nid__",
      "value": "5252"
  },{
      "name": "dts_task",
      "value": "TempConfId-num"
  }],
  "datapoint": {
    "timestamp": '"$(date "+%s")"',
    "value": 1.1
  }
}
'

curl -sS -X POST http://localhost:9003/writetagged -d '{
  "namespace": "default",
  "id": "quanshi-2",
  "tags": [{
      "name": "__name__",
      "value": "beta-cm-tang-CM_bc_pc_num"
  },{
      "name": "__endpoint__",
      "value": "__nid__5252__"
  },{
      "name": "__nid__",
      "value": "5252"
  },{
      "name": "dts_task",
      "value": "billingcode-num"
  }],
  "datapoint": {
    "timestamp": '"$(date "+%s")"',
    "value": 1.1
  }
}
'

curl -sS -X POST http://localhost:9003/writetagged -d '{
  "namespace": "default",
  "id": "quanshi-3",
  "tags": [{
      "name": "__name__",
      "value": "beta-cm-tang-CM_bc_pc_num"
  },{
      "name": "__endpoint__",
      "value": "__nid__5252__"
  },{
      "name": "__nid__",
      "value": "5252"
  },{
      "name": "dts_task",
      "value": "passcode-num"
  }],
  "datapoint": {
    "timestamp": '"$(date "+%s")"',
    "value": 1.1
  }
}
'
