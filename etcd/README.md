## install

#### certs
```
# 编辑 config/ssltool.yml
# 编辑 config/hosts-etcd

./scripts/reinit-root-ca.sh
./scripts/reinit-etcd-certs.sh
```

#### deploy
拷贝目录到所有节点，分别执行
```
make install
```

#### postcheck
在任一节点执行
```
make test
```
