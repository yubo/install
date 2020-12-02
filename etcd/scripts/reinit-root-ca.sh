#!/bin/bash
OLDPATH=`pwd`
ROOT=`cd $(dirname $0)/..; pwd`
cd ${ROOT}
function finish {
    cd ${OLDPATH} 
}
trap finish EXIT

./bin/ssltool -c ./config/ssltool.yml ca ${1}
