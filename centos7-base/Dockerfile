# vim:set ft=dockerfile:

# Use official centos7 image, CERN's is way too big
FROM centos:7

# Use CERN's official centos7
#FROM gitlab-registry.cern.ch/lhcb-docker/os-base/centos7-hepos:latest

#################
# Update system #
#################

# add CERN CentOS yum repo
ADD http://linux.web.cern.ch/linux/centos7/CentOS-CERN.repo /etc/yum.repos.d/CentOS-CERN.repo
ADD http://linuxsoft.cern.ch/cern/centos/7/os/x86_64/RPM-GPG-KEY-cern /tmp/RPM-GPG-KEY-cern

RUN rpm --import /tmp/RPM-GPG-KEY-cern && \
    rm /tmp/RPM-GPG-KEY-cern

# Enable EPEL repo
RUN yum install -y epel-release

RUN yum update -y && \
    yum clean all && rm -rf /var/cache/yum


####################
# Add dev packages #
####################

RUN yum install -y \
    CERN-CA-certs \
    python-pip make cmake3 gcc gcc-c++ git \
    zsh tmux \
    && yum clean all && rm -rf /var/cache/yum

# Update pip
RUN pip install --upgrade pip setuptools


#####################
# Install LHCb base #
#####################

RUN mkdir -p /opt/lhcb

RUN pip install lbinstall

RUN lbinstall --root=/opt/lhcb install LBSCRIPT CMT COMPAT


###############################
# Load default configurations #
###############################

ADD ./zshrc /home/physicist/.zshrc
ADD ./tmux.conf /home/physicist/.tmux.conf

# Make sure 'cmake' is linked to 'cmake3'
RUN ln -s /usr/bin/cmake3 /usr/bin/cmake
