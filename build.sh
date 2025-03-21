#!/usr/bin/env bash
# Fail on any error
set -e

# Set version info
export BOX_VERSION_BASE="1.5.0"

# Set versions requested of main components (These will be used in Packer and passed to Ansible downstream)
# The apt package versions can be determined with "apt-get madison <package name>", use the exact version number!
export BOX_BASE="ilionx/ubuntu2204"
export BOX_BASE_VERSION="1.5.0-20240320"
export MINIKUBE_VERSION="1.32.0"
export CRIDOCKERD_VERSION="0.3.11"
export CRITOOLS_VERSION="1.28.0-1.1"
export DOCKER_VERSION="5:25.0.5-1~ubuntu.22.04~jammy"
export KUBE_REPO_VERSION="1.28"
export KUBECTL_VERSION="1.28.3-1.1"
export CNI_PLUGINS_VERSION="1.4.1"
export HELM_VERSION="3.14.3"
export KUBETAIL_VERSION="1.6.20"
export KUBELOGS_VERSION="0.0.1"

# Set versions of supported tools, if they don't match, a warning will be shown on screen
export VIRTUALBOX_VERSION="7.0.14r161095"
export PACKER_VERSION="1.10.2-dev"
export VAGRANT_VERSION="2.4.1"

# Set the Vagrant cloud user and box name (make sure you have admin permissions to, or are the owner of this repository)
export VAGRANT_CLOUD_BOX_USER="ilionxde"
export VAGRANT_CLOUD_BOX_NAME="ubuntu2204-minikube"

# ############################################################################################## #
# Below this point there should be no need to edit anything, unless you know what you are doing! #
# ############################################################################################## #

echo "Testing if all required tools are installed, please wait..."

# Check if all required tools are installed
if ( ! ( vboxmanage --version >/dev/null 2>&1 && packer version >/dev/null 2>&1 && vagrant version >/dev/null 2>&1 ) )
then
    echo "ERROR: One of the required tools (VirtualBox, Vagrant, and Packer) is not installed. Cannot continue."
    exit 1
fi

# Check the tool versions
INSTALLED_VIRTUALBOX_VERSION=$(vboxmanage --version)
INSTALLED_PACKER_VERSION=$(packer --version)
INSTALLED_VAGRANT_VERSION=$(vagrant --version | awk '{print $2}')

if [[ "$INSTALLED_VIRTUALBOX_VERSION" != "$VIRTUALBOX_VERSION" || "$INSTALLED_PACKER_VERSION" != "$PACKER_VERSION" || "$INSTALLED_VAGRANT_VERSION" != "$VAGRANT_VERSION" ]]
then
    echo "WARNING: One of the tool versions does not match the tested versions. Your mileage may vary..."
    echo " * Using VirtualBox version ${INSTALLED_VIRTUALBOX_VERSION} (tested with version ${VIRTUALBOX_VERSION})"
    echo " * Using Packer version ${INSTALLED_PACKER_VERSION} (tested with version ${PACKER_VERSION})"
    echo " * Using Vagrant version ${INSTALLED_VAGRANT_VERSION} (tested with version ${VAGRANT_VERSION})"
    echo ""
    echo -n "To break, press Ctrl-C now, otherwise press Enter to continue"
    read -r
fi

echo "All required tools found. Continuing."

# Check if a build.env file is present, and if so: source it
if [ -f build.env ]
then
    source build.env
fi

# Check if the variables HCP_CLIENT_ID and HCP_CLIENT_SECRET have been set, if not ask for them
if [ -z "$DEFAULT_HCP_CLIENT_ID" ] || [ -z "$DEFAULT_HCP_CLIENT_SECRET" ]
then
    # Ask user for vagrant cloud token
    echo -n "What is your HCP Service Principal Client ID? "
    read -r user
    echo ""
    export HCP_CLIENT_ID=${user}

    # Ask user for vagrant cloud token
    echo -n "What is your HCP Service Principal Client Secret? "
    read -rs token
    echo ""
    export HCP_CLIENT_SECRET=${token}
else
    export HCP_CLIENT_ID=$DEFAULT_HCP_CLIENT_ID
    export HCP_CLIENT_SECRET=$DEFAULT_HCP_CLIENT_SECRET

    echo "Your HCP Client ID and Secret have been sourced from file build.env"
fi

# Export dynamic versioning info
BOX_VERSION=${BOX_VERSION_BASE}-$(date +'%Y%m%d')
export BOX_VERSION
commit=$(git --no-pager log -n 1 --format="%H")
BOX_VERSION_DESCRIPTION="
## Description
This box is based on the ${BOX_BASE} box version ${BOX_BASE_VERSION}. I try to keep the builds up to date with the latest version of this box.
When the box boots it contains a running minikube, ready to deploy kubenetes manifests, and kubectl is pre configured for the vagrant user.
Helm is installed to allow the immediate deployment of charts.

The box defaults to 2 CPU and 4GB of RAM, it is not advised to limit this.

---

## Versions included in this release
Based on box [${BOX_BASE}](https://app.vagrantup.com/ilionx/boxes/ubuntu2204) version ${BOX_BASE_VERSION}
* Latest OS updates installed at build time
* minikube ${MINIKUBE_VERSION}
* docker ${DOCKER_VERSION}
* kubectl ${KUBECTL_VERSION}
* helm ${HELM_VERSION}
* kubetail ${KUBETAIL_VERSION}

---

$(cat CHANGELOG.md)

---

## Source info
[View source on Github](https://github.com/Q24/vagrant-box-ubuntu2204-minikube)

Built on commit: \`${commit}\`
"

export BOX_VERSION_DESCRIPTION
echo "${BOX_VERSION_DESCRIPTION}"

# Install necessary packer plugins
echo "Installing packer plugins: virtualbox, ansible, and vagrant"
packer plugins install github.com/hashicorp/virtualbox
packer plugins install github.com/hashicorp/ansible
packer plugins install github.com/hashicorp/vagrant

# Validate build config
echo "Validating build json files"
packer validate packer.json

# Run the actual build
echo "Building box version ${BOX_VERSION}"
packer build -force -on-error=cleanup packer.json

# Tag git commit for this build
git tag -a "${BOX_VERSION}" -m "Version ${BOX_VERSION} built."
