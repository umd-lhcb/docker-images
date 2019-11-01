# vim:set ft=dockerfile:

# Use official centos7 image, CERN's is way too big
FROM centos:centos7


#################
# Update system #
#################

RUN yum update -y && \
    yum clean all && rm -rf /var/cache/yum


##################
# Install Libero #
##################

# Enable EPEL repo
RUN yum install -y epel-release && \
    yum clean all && rm -rf /var/cache/yum

# Install dependencies
RUN yum install -y java-latest-openjdk expect && \
    yum clean all && rm -rf /var/cache/yum

ADD ./Libero_SoC_v12.2_lin.bin /tmp
ADD ./libero_autoinstall.exp

WORKDIR /tmp
RUN ./libero_autoinstall.exp
