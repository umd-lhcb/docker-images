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


####################
# Add dev packages #
####################

RUN yum install -y \
    CERN-CA-certs \
    make gcc gcc-c++ \
    python-devel xz-devel \
    libSM libX11 libXext libXpm libXft libXaw libxslt libjpeg-turbo \
    xorg-x11-xauth xorg-x11-server-Xvfb \
    curl git which \
    zsh tmux tree \
    && yum clean all && rm -rf /var/cache/yum

# Install pip
WORKDIR /tmp

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
    python get-pip.py && \
    rm /tmp/get-pip.py

# Install 'cmake3' and make it default
RUN yum remove -y cmake && yum install -y cmake3 \
    && yum clean all && rm -rf /var/cache/yum

RUN ln -s /usr/bin/cmake3 /usr/bin/cmake


#####################
# Install LHCb base #
#####################

RUN mkdir -p /opt/lhcb && \
    mkdir -p /tmp/lbinstall-tmp && \
    mkdir -p /tmp/lbinstall-cache
RUN pip install lbinstall
RUN lbinstall --root=/opt/lhcb --tmp_dir=/tmp/lbinstall-tmp --rpmcache=/tmp/lbinstall-cache \
        install LBSCRIPTS CMT COMPAT && \
    # Cleanups
    rm -rf /tmp/* && \
    rm /anaconda-post.log


###############################
# Load default configurations #
###############################

ADD ./zshrc /home/physicist/.zshrc
ADD ./tmux.conf /home/physicist/.tmux.conf


#############################
# Bootstrap user permission #
#############################

# Add the bootstrap script
ADD ./bootstrap.sh /usr/local/bin

# Make UID and GID ENV
ENV UID 1000
ENV GID 985

CMD ["/usr/local/bin/bootstrap.sh"]
