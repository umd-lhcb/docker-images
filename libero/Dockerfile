# vim:set ft=dockerfile:

# Use official centos7 image, CERN's is way too big
FROM centos:centos7

# Use CERN's official centos7
#FROM gitlab-registry.cern.ch/lhcb-docker/os-base/centos7-hepos:latest

#################
# Update system #
#################

RUN yum update -y && \
    yum clean all && rm -rf /var/cache/yum


##################
# Install Libero #
##################

# Install dependencies
RUN yum install java-latest-openjdk && \
    yum clean all && rm -rf /var/cache/yum

ADD ./Libero_SoC_v12.2_lin.bin /tmp
RUN chmod +x /tmp/Libero_SoC_v12.2_lin.bin && \
    ./tmp/Libero_SoC_v12.2_lin.bin LAX_VM /usr/lib/jvm/jre-openjdk/bin/java
