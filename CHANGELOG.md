## Changelog

### 1.6.0-20250321
* The box has moved from ilionx/ubuntu2204-minikube to ilionxde/ubuntu2204-minikube
* Updated ilionxde/ubuntu2204 base box to version 1.6.0-20250321
* Updated minikube to version 1.35.0
* Updated cri-dockerd to version 0.3.16
* Updated Docker to version 28.0.1
* Updated kubectl to version 1.32.3
* Installed CNI Plugins version 1.6.2
* Updated Helm to version 3.17.2
* Updated build dependencies: VirtualBox (7.1.6r167084), Packer (1.12.0), Vagrant (2.4.3)
* Converted build and Packer scripts to be compatible with new HashiCorp Cloud Platform (HCP)

### 1.5.0-20240320
* Updated ilionx/ubuntu2204 base box to version 1.5.0-20240320
* Updated to new Kubernetes APT repository
* Updated cri-dockerd to version 0.3.11
* Updated critools to version 1.32.0-1.1
* Updated Docker to version 25.0.5
* Updated kubectl to version 1.28.3
* Installed CNI Plugins version 1.4.1
* Updated Helm to version 3.14.3
* Updated Kubetail to version 1.6.20
* Updated build dependencies: VirtualBox (7.1.6r167084), Packer (1.12.0), Vagrant (2.4.3)
* Converted build and Packer scripts to be compatible with new HashiCorp Cloud Platform (HCP)

### 1.4.0-20231218
* Updated ilionx/ubuntu2204 base box to version 1.4.0-20231218
* Updated minikube to version 1.32.0
* Installed cri-dockerd version 0.3.8
* Updated Docker to version 24.0.7
* Updated kubectl to version 1.28.2
* Installed CNI Plugins version 1.4.0
* Updated Helm to version 3.13.3
* Updated build dependencies: VirtualBox (7.0.12r159484), Packer (1.9.5), Vagrant (2.4.0)

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