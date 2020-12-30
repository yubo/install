#!/bin/bash
OLDPATH=`pwd`
ROOT=`cd $(dirname $0)/..; pwd`
cd ${ROOT}
function finish {
    cd ${OLDPATH} 
}

mkdir -p images
docker save -o images/kube-proxy.tar k8s.gcr.io/kube-proxy:v1.20.1
docker save -o images/kube-controller-manager.tar k8s.gcr.io/kube-controller-manager:v1.20.1
docker save -o images/kube-apiserver.tar k8s.gcr.io/kube-apiserver:v1.20.1
docker save -o images/kube-scheduler.tar k8s.gcr.io/kube-scheduler:v1.20.1
docker save -o images/etcd.tar k8s.gcr.io/etcd:3.4.13-0
docker save -o images/coredns.tar k8s.gcr.io/coredns:1.7.0
docker save -o images/pause.tar k8s.gcr.io/pause:3.2

