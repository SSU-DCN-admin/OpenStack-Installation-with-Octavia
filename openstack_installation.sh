#! /bin/bash

### Make sure only root can run our script
if (( $EUID != 0 )); then
	echo "This script must be run as root"
	echo $EUID
	exit
fi

### Translate sources
sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list


### Make stack user
useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack

### Install Devstack
if [ -f $DEVSTACK_PATH ]; then
	echo "devstack file exist"
else
	echo "devstack file not exist"
        su - stack -c "git clone https://git.openstack.org/openstack-dev/devstack -b stable/wallaby"
fi
