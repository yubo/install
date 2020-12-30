#!/bin/bash
OLDPATH=`pwd`
ROOT=`cd $(dirname $0)/..; pwd`
cd ${ROOT}
function finish {
    cd ${OLDPATH} 
}

docker pull ybbbbasdf/kube-proxy:v1.20.1
docker pull ybbbbasdf/kube-controller-manager:v1.20.1
docker pull ybbbbasdf/kube-apiserver:v1.20.1
docker pull ybbbbasdf/kube-scheduler:v1.20.1
docker pull ybbbbasdf/etcd:3.4.13-0
docker pull ybbbbasdf/coredns:1.7.0
docker pull ybbbbasdf/pause:3.2

docker tag ybbbbasdf/kube-proxy:v1.20.1              k8s.gcr.io/kube-proxy:v1.20.1              
docker tag ybbbbasdf/kube-controller-manager:v1.20.1 k8s.gcr.io/kube-controller-manager:v1.20.1 
docker tag ybbbbasdf/kube-apiserver:v1.20.1          k8s.gcr.io/kube-apiserver:v1.20.1          
docker tag ybbbbasdf/kube-scheduler:v1.20.1          k8s.gcr.io/kube-scheduler:v1.20.1          
docker tag ybbbbasdf/etcd:3.4.13-0                   k8s.gcr.io/etcd:3.4.13-0                   
docker tag ybbbbasdf/coredns:1.7.0                   k8s.gcr.io/coredns:1.7.0                   
docker tag ybbbbasdf/pause:3.2                       k8s.gcr.io/pause:3.2                       


