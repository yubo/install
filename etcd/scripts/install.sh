#!/bin/bash -x
OLDPATH=`pwd`
ROOT=`cd $(dirname $0)/..; pwd`
cd ${ROOT}
function finish {
    cd ${OLDPATH} 
}

systemctl stop etcd.service

dataPath=/opt/data/etcd
prefix=/opt/etcd

mkdir -p ${dataPath}
mkdir -p ${prefix}/{bin,certs}

cp -a ./bin/etcd* ${prefix}/bin
cp -af ./certs/*.pem ${prefix}/certs/

# gen systemd/etcd.service
num=1
arr=()

for line in `cat config/hosts-etcd`; do
	if [ "$line" = "127.0.0.1" ]; then
		continue
	fi
	arr[${#arr[*]}]="node${num}=https://${line}:2380"
	let num++
done
endpoints=`echo "${arr[@]}" | tr ' ' ','`

sed "s#var_endpoints#${endpoints}#g" systemd/etcd.service.tpl > systemd/etcd.service

cp -f systemd/etcd.service /usr/lib/systemd/system/

ip=$(/usr/sbin/ifconfig `/usr/sbin/route|grep '^default'|awk '{print $NF}'`|grep inet|awk '{print $2}'|head -n 1)
sed -i "s/0.0.0.0/${ip}/g" /usr/lib/systemd/system/etcd.service

num=1
for line in `cat config/hosts-etcd`; do
	if [ "$line" = "127.0.0.1" ]; then
		continue
	fi
	if [ "$ip" = "$line" ]; then
		sed -i "s/var_node/node${num}/g" /usr/lib/systemd/system/etcd.service
		return
	fi
	let num++
done

systemctl daemon-reload
systemctl enable etcd.service
systemctl start etcd.service

cat /usr/lib/systemd/system/etcd.service
