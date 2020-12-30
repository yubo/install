#!/bin/sh
OLDPATH=`pwd`
ROOT=`cd $(dirname $0)/..; pwd`
cd ${ROOT}
function finish {
    cd ${OLDPATH} 
}


docker load --input images/kube-proxy.tar
docker load --input images/kube-controller-manager.tar
docker load --input images/kube-apiserver.tar
docker load --input images/kube-scheduler.tar
docker load --input images/etcd.tar
docker load --input images/coredns.tar
docker load --input images/pause.tar

