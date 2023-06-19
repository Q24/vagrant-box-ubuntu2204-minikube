## Changelog

### 1.3.1-20230619
* Updated ilionx/ubuntu2204 base box to version 1.3.1-20230619
* Updated minikube to version 1.30.1
* Installed cri-dockerd version 0.3.3
* Updated Docker to version 24.0.2
* Updated kubectl to version 1.27.3
* Updated Helm to version 3.12.1
* Updated Kubetail to version 1.6.18
* Updated build dependencies: VirtualBox (7.0.8r156879), Packer (1.9.1), Vagrant (2.3.6)
* Added bash autocomplete for the `k` and `kc` aliases for `kubectl`

### 1.3.0-20230320
* Updated ilionx/ubuntu2204 base box to version 1.3.0-20230320
* Updated minikube to version 1.29.0
* Installed cri-dockerd version 0.3.1
* Installed cri-tools version 1.26.0-00
* Updated Docker to version 23.0.1
* Updated kubectl to version 1.26.3
* Updated Helm to version 3.11.2
* Updated build dependencies: VirtualBox (7.0.6r155176), Packer (1.8.6)

### 1.2.0-20221228
* Updated ilionx/ubuntu2204 base box to version 1.2.0-20221228
* Installed cri-dockerd version 0.3.0
* Updated Docker to version 20.10.22
* Updated kubectl to version 1.26.0
* Updated Helm to version 3.10.3
* Updated kubetail to version 1.6.17
* Updated build process to support VirtualBox 7
* Updated build dependencies: VirtualBox (7.0.4r154605), Packer (1.8.5), Vagrant (2.3.4)

### 1.1.1-20221125
* Updated ilionx/ubuntu2204 base box to version 1.1.1-20221124
* Updated minikube to version 1.28.0
* Installed cri-dockerd version 0.2.6
* Installed cri-tools version 1.25.0-00 (required by minikube)
* Updated Docker to version 20.10.21
* Updated kubectl to version 1.25.4
* Updated Helm to version 3.10.2
* Updated build dependencies: VirtualBox (6.1.40r154048), Packer (1.8.4), Vagrant (2.3.3)

### 1.1.0-20220825
* Updated ilionx/ubuntu2204 base box to version 1.1.0-20220825
* Updated minikube to version 1.26.1
* Installed cri-dockerd version 0.2.5 (required by minikube)
* Installed cri-tools version 1.24.2-00 (required by minikube)
* Updated Docker to version 20.10.17
* Updated kubectl to version 1.25.0
* Updated Helm to version 3.9.4
* Updated build dependencies: VirtualBox (6.1.36r152435), Packer (1.8.3), Vagrant (2.3.0)

### 1.0.0-20220510
* First release of this box, based on ilionx/ubuntu2204 version 1.0.0-20220503
* minikube: 1.25.2
* Docker: 20.10.15
* kubectl: 1.24.0
* Helm: 3.8.1
* kubetail: 1.6.15
* kubelogs: 0.0.1