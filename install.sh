#!/bin/sh

#start on a fresh Centos 7 install: http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso

#install packages
yum install -y epel-release
yum install -y docker wget git ansible
yum install -y python-cryptography pyOpenSSL.x86_64

#clone git projects
cd ~
git clone https://github.com/openshift/openshift-ansible
git clone https://github.com/santiagoangel/openshift-cluster-centos7

apply hosts

