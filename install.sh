#!/bin/sh

#start on a fresh Centos 7 install: http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso
#then:
#yum install -y wget; wget https://raw.githubusercontent.com/santiagoangel/openshift-cluster-centos7/master/install.sh; sh install.sh


#install packages
yum install -y epel-release
yum install -y docker git ansible
yum install -y python-cryptography pyOpenSSL.x86_64

#clone git projects
cd ~
git clone https://github.com/openshift/openshift-ansible
git clone https://github.com/santiagoangel/openshift-cluster-centos7

#apply hosts

rm -Rf /etc/hosts
cp openshift-cluster-centos7/hosts /etc/hosts

#ssh keys
ssh-keygen -t rsa
ssh-copy-id root@cloud.successfulsoftware.io

#ansible run

ansible-playbook -i ./openshift-cluster-centos7/inventory-registry-all.erb ./openshift-ansible/playbooks/byo/config.yml -vvv


