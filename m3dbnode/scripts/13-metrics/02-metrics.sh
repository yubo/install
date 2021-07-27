#!/bin/bash
curl -Ss -XGET http://localhost:9004/metrics | grep -E "(database_tick_active_series|database_tick_index_num_docs)" | grep -v '^#'
