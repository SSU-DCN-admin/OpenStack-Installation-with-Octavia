# OpenStack-Installation-with-Octavia
openstack installation with octavia to use Loadbalancer


```
useradd -s /bin/bash -d /opt/stack -m stack
echo “stack ALL=(ALL) NOPASSWD: ALL” | sudo tee /etc/sudoers.d/stack
sudo su -stack
```

```
git clone https://git.openstack.org/openstack-dev/devstack -b stable/wallaby
cd devstack
```

local.conf작성

```
./stack.sh
```

eno1 -> no ip address interface
```
sudo ovs-vsctl add-port br-ex eno1
```
