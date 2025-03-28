# vagrant-box-ubuntu2204-minikube
## Description
This project contains everything needed to build the ubuntu2204-minikube vagrant box. The box is build using Vagrant's packer tool. Currently only a box for the VirtualBox provider is built.

The box resulting is based on a clean Ubuntu 22.04 minimal installation. I try to keep the builds up to date with the latest version of this box. Several tools are included in the box:
* Ansible
* Minikube
* Docker
* Helm
* Kubectl
* Kubetail

Built boxes can be found on [HashiCorp Cloud Platform](https://portal.cloud.hashicorp.com/vagrant/discover/ilionxde/ubuntu2204-minikube)

## Prerequisites
To be able to build the box yourself, you'll need at least following tools installed:

* [Virtualbox](https://www.virtualbox.org/) (tested with version 7.1.6 - not backwards compatible with version 6)
* [Packer](https://www.packer.io/) (tested with version 1.12.0)
* [Vagrant](https://www.vagrantup.com/) (tested with version 2.4.3)

The build wil be uploaded to HashiCorp Cloud Platform, so you'll need an account and corresponding token there. On top of that, the box has to be pre-created for the upload to succeed.

## Usage
1. Make sure you have a HashiCorp Cloud Platform account with a service principal, and a Cliend ID and Client Secret for said principal. You need to have "admin" access to the [HashiCorp Cloud Platform box](https://portal.cloud.hashicorp.com/vagrant/discover/ilionxde/ubuntu2204-minikube), or you need to be the owner of the box for the upload to work automatically. You can enter the Client ID and Client Secret when requested by the `build.sh` script (but you will need to do this every time when creating a new build), or you can create a file `build.env` in the root of this repository where you set the variables as follows:

```
DEFAULT_HCP_CLIENT_ID="your.client.id"
DEFAULT_HCP_CLIENT_SECRET="your.client.secret"
```

2. The script will update box `ilionxde/ubuntu2204-minikube`. This name is hardcoded in the scripts. If you wish to create a box in your own account, change the following two environment variables in `build.sh`:

```
export VAGRANT_CLOUD_BOX_USER="ilionxde"
export VAGRANT_CLOUD_BOX_NAME="ubuntu2204-minikube"
```

3. Make your changes, and commit them in your local git repository.
4. From this project's root directory run the build.sh bash script:
```
./build.sh
```
5. The packer Vagrant builder will create and package your new box in a file named `build/package.box`.
6. Vagrant registry post-processor will create a new version and upload the box to the HCP.
7. If the box build succeeded, the script will automatically create a tag in your local git repository. If you are happy with the results, push to GitHub, and create a GitHub release based on the tag.
8. Finally, log into your HCP and release the box to make it available for everybody, and publish the GitHub release.
9. Get yourself a celebratory beer!

## Using the base box
You can use the base box like any other base box. The easiest way is to use the Vagrant `init` command:

```
vagrant init ilionxde/ubuntu2204-minikube
```

This will create a barebones `Vagrantfile` which you can customise to your liking. The box itself is provisioned with Ansible, so if you wish to use Ansible in your provisioning process, you do not need to install Ansible again, as this is already part of the base box.

Configure your `Vagrantfile` as follows to re-use the pre-installed Ansible (if you don't want to use Ansible to do your provisioning, you can skip this):

```
# Provision using Ansible, using the pre-installed Ansible in the base box
config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.install = false
    ansible.compatibility_mode = "2.0"
    ansible.become = true # This can be true or false, whether or not you need to do stuff as root
end
```

If you wish to do provisioning on every box boot, you can use Ansible for that too:

```
# Provision using Ansible on every boot, using the pre-installed Ansible in the base box
config.vm.provision 'ansible', run: 'always', type: :ansible_local do |ansible|
    ansible.playbook = "on-boot-playbook.yml"
    ansible.install = false
    ansible.compatibility_mode = "2.0"
    ansible.become = true # This can be true or false, whether or not you need to do stuff as root
end
```

## Changelog
You can find the changelog [here](CHANGELOG.md).

## License
This code is licensed under the [Apache 2.0 license](LICENSE).