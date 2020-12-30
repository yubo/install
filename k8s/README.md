## install

#### system

```
setenforce 0

vi /etc/selinux/config
...

#systemctl disable firewalld
#systemctl stop firewalld


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



yum update  # kernel-3.10.0-1160.11.1.el7
yum install -y docker kubelet kubeadm kubectl kubernetes-cni
systemctl enable docker &&  systemctl start docker
systemctl enable kubelet &&  systemctl start kubelet
init 6

sysctl -w net.bridge.bridge-nf-call-iptables=1
echo "net.bridge.bridge-nf-call-iptables=1" > /etc/sysctl.d/k8s.conf

swapoff -a && sed -i '/ swap / s/^/#/' /etc/fstab
hostnamectl --static set-hostname yubo01
#hostnamectl --static set-hostname yubo02
#hostnamectl --static set-hostname yubo03
```

#### env
```
sudo cat >/etc/docker/daemon.json <<'EOF'
{
	  "registry-mirrors": ["https://stq1lqv0.mirror.aliyuncs.com"]
}
EOF
```


#### init kube
```
# init
# https://github.com/coreos/flannel/blob/master/Documentation/kubernetes.md
kubeadm init --kubernetes-version=v1.20.1 --pod-network-cidr=10.244.0.0/16 

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

kubeadm join 172.20.70.29:6443 --token r972wf.bqblgrz4choludfp \
    --discovery-token-ca-cert-hash sha256:af607c74bca02b98d91ea52195172c83e779ae6d4966e9eaba268108b0a9ecf4
```


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


#### install CNI (flannel)
```
# https://github.com/coreos/flannel/blob/master/Documentation/kube-flannel.yml 
kubectl applay -f ./flannel/kube-flannel.yml
```
