#!/bin/bash
yum install python3-devel libffi-devel gcc openssl-devel libselinux-python3 -y
update-alternatives --install /usr/bin/unversioned-python python /usr/bin/python3.6 1
update-alternatives --set python /usr/bin/python3
pip3 install ansible==2.9.7
git clone https://github.com/openstack/kolla -b stable/train
git clone https://github.com/openstack/kolla-ansible -b stable/train
pip3 install ./kolla
pip3 install ./kolla-ansible
mkdir -p /etc/kolla
chown $USER:$USER /etc/kolla
cp -r kolla-ansible/etc/kolla/* /etc/kolla
cp kolla-ansible/ansible/inventory/* .
yum install epel-release -y
yum repolist
yum install ansible -y
yum install nfs-utils -y
