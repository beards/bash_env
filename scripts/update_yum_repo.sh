#!/bin/bash

cd /etc/pki/rpm-gpg
wget http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-5
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*

# epel / remi
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

# rpmforge
cd /root/
mkdir _package
cd /root/_package
wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.3.6-1.el5.rf.i386.rpm
rpm -ivh rpmforge-release-0.3.6-1.el5.rf.i386.rpm
