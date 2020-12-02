#! /bin/bash
OLDPATH=`pwd`
ROOT=`cd $(dirname $0)/..; pwd`
cd ${ROOT}
function finish {
    cd ${OLDPATH} 
}
trap finish EXIT

./bin/ssltool -c ./config/ssltool.yml etcd ${1} || exit 

OUTPUT=${ROOT}/certs
type openssl >/dev/null 2>&1 && {
    cat ${OUTPUT}/client.pem | openssl x509 -noout -text
    cat ${OUTPUT}/server.pem | openssl x509 -noout -text
    cat ${OUTPUT}/peer.pem | openssl x509 -noout -text

    echo "check etcd server hosts"
    cat ${OUTPUT}/server.pem | openssl x509 -noout -text |\
        grep 'X509v3 Subject Alternative Name' -A 1 | \
        tail -n 1 | \
        sed 's/[,]/\n/g' | \
        tr -d ' ' | \
        awk -F':' '{print $2}' | \
        diff -ruN config/hosts-etcd -

    echo "check etcd peer hosts"
    cat ${OUTPUT}/peer.pem | openssl x509 -noout -text |\
        grep 'X509v3 Subject Alternative Name' -A 1 | \
        tail -n 1 | \
        sed 's/[,]/\n/g' | \
        tr -d ' ' | \
        awk -F':' '{print $2}' | \
        diff -ruN config/hosts-etcd -
}




