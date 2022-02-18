## install

#### system

```
setenforce 0

vi /etc/selinux/config
...

#systemctl disable firewalld
#systemctl stop firewalld


swapoff -a && sed -i '/ swap / s/^/#/' /etc/fstab

```

#### install

```
cat >/etc/yum.repos.d/kubernetes.repo <<'EOF'
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

# docker-ce
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

yum update  # kernel-3.10.0-1160.11.1.el7
yum install -y kubelet kubeadm kubectl kubernetes-cni
systemctl enable docker &&  systemctl start docker
systemctl enable kubelet &&  systemctl start kubelet
init 6

sysctl -w net.bridge.bridge-nf-call-iptables=1
echo "net.bridge.bridge-nf-call-iptables=1" > /etc/sysctl.d/k8s.conf

swapoff -a && sed -i '/ swap / s/^/#/' /etc/fstab
```

#### init master node
```
# init
# https://github.com/coreos/flannel/blob/master/Documentation/kubernetes.md
kubeadm init --kubernetes-version=v1.23.3 --pod-network-cidr=10.244.0.0/16 

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 172.20.70.29:6443 --token f8f8ce.n4j31g06b3m5j74o \
        --discovery-token-ca-cert-hash sha256:91a6b6f79daf076155f3b89838ae29c41cdc02f30c458a21139a436fe9667916
```

#### install CNI (flannel)
```
# https://github.com/coreos/flannel/blob/master/Documentation/kube-flannel.yml 
kubectl apply -f ./flannel/kube-flannel.yml

# or 
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
```

#### join nodes
```
kubeadm join 172.20.70.29:6443 --token f8f8ce.n4j31g06b3m5j74o \
        --discovery-token-ca-cert-hash sha256:91a6b6f79daf076155f3b89838ae29c41cdc02f30c458a21139a436fe9667916
```

## ops

#### set kube.conf
```
# kube.conf
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

```

#### reset kube
```
# backup
kubectl -n kube-system get cm kubeadm-config -o yaml
kubeadm reset
```

#### install nginx-ingress
```
# https://github.com/kubernetes/ingress-nginx/tree/master/charts/ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm fetch ingress-nginx/ingress-nginx
tar xzvf ingress-nginx-3.18.0.tgz
cd ingress-nginx
helm install my-release .
```

#### install helm repo
```
# add https://github.com/helm/charts as stable repo
helm repo add stable https://charts.helm.sh/stable
helm fetch stable/nfs-client-provisioner
```
