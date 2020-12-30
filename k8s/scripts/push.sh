#!/bin/bash
OLDPATH=`pwd`
ROOT=`cd $(dirname $0)/..; pwd`
cd ${ROOT}
function finish {
    cd ${OLDPATH} 
}

docker tag k8s.gcr.io/kube-proxy:v1.20.1               ybbbbasdf/kube-proxy:v1.20.1
docker tag k8s.gcr.io/kube-controller-manager:v1.20.1  ybbbbasdf/kube-controller-manager:v1.20.1
docker tag k8s.gcr.io/kube-apiserver:v1.20.1           ybbbbasdf/kube-apiserver:v1.20.1
docker tag k8s.gcr.io/kube-scheduler:v1.20.1           ybbbbasdf/kube-scheduler:v1.20.1
docker tag k8s.gcr.io/etcd:3.4.13-0                    ybbbbasdf/etcd:3.4.13-0
docker tag k8s.gcr.io/coredns:1.7.0                    ybbbbasdf/coredns:1.7.0
docker tag k8s.gcr.io/pause:3.2                        ybbbbasdf/pause:3.2
docker tag k8s.gcr.io/ingress-nginx/controller:v0.42.0 ybbbbasdf/ingress-nginx-controller:v0.42.0

docker push ybbbbasdf/kube-proxy:v1.20.1
docker push ybbbbasdf/kube-controller-manager:v1.20.1
docker push ybbbbasdf/kube-apiserver:v1.20.1
docker push ybbbbasdf/kube-scheduler:v1.20.1
docker push ybbbbasdf/etcd:3.4.13-0
docker push ybbbbasdf/coredns:1.7.0
docker push ybbbbasdf/pause:3.2
docker push ybbbbasdf/ingress-nginx-controller:v0.42.0
