#!/bin/bash
rpmfile=grafana-7.2.0-1.x86_64.rpm

rpm -q grafana >/dev/null
if [ ${?} -ne 0 ]; then
	if [[ ! -f ./${rpmfile} ]]; then
		curl https://dl.grafana.com/oss/release/${rpmfile} --output ${rpmfile}
	fi
	yum install ./${rpmfile}
fi
