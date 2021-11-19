## install

下载
```
git clone https://github.com/yubo/install.git
cd install

wget https://github.com/yubo/install/releases/download/v0.0.1/etcd.tar.gz
tar xzvf etcd.tar.gz
cd etcd
```

编辑 config/ssltool.yml


```yaml
CN: etcd
key:
  algo: "ecdsa"
  size: 256
names:
  - C: CN
    ST: BJ
    L: BJ
    O: k8s

ca:
  dir: ./certs

etcd:
  dir: ./certs
  clientExpiry: "876000h"
  serverExpiry: "876000h"
  hosts:
    - 127.0.0.1    # 本地访问
    - 10.86.92.17  # etcd集群节点, 远程访问时的地址
```

编辑 config/hosts-etcd

```text
127.0.0.1
10.86.92.17
```

初始化CA证书

```shell
./scripts/reinit-root-ca.sh
```

用CA证书签发公私钥

```shell
./scripts/reinit-etcd-certs.sh
```

#### deploy
拷贝 `install/etcd` 目录到所有节点，分别执行
```
make install
```

#### postcheck
在任一节点执行
```
make test
```

## Resource
  - https://github.com/yubo/gotool/tree/main/ssltool
  - https://github.com/etcd-io/etcd
  - https://etcd.io/docs/v3.5
