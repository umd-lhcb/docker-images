# Use CERN's official centos7
FROM gitlab-registry.cern.ch/lhcb-docker/os-base/centos7-hepos:latest

#################
# Update system #
#################

# add CERN CentOS yum repo
ADD http://linux.web.cern.ch/linux/centos7/CentOS-CERN.repo /etc/yum.repos.d/CentOS-CERN.repo
ADD http://linuxsoft.cern.ch/cern/centos/7/os/x86_64/RPM-GPG-KEY-cern /tmp/RPM-GPG-KEY-cern

RUN /usr/bin/rpm --import /tmp/RPM-GPG-KEY-cern && \
    /bin/rm /tmp/RPM-GPG-KEY-cern

RUN yum update -y && \
    yum clean all && rm -rf /var/cache/yum


####################
# Add dev packages #
####################

RUN yum install -y \
    rpm-build openssl-devel libXpm-devel procmail git nano cups-libs cups \
    poppler arc poppler-data poppler-utils libfontenc openjpeg-libs portreserve \
    expat-devel glib2-devel afs_tools hepix perl perl-version perl-Net-SSLeay \
    perl-GSSAPI perl-MailTools psutils netpbm strace libevent-doc libevent \
    libevent-devel distcc xorg-x11-xauth glibc-static libXp-devel libXi-devel \
    libXmu-devel libSM-devel libICE-devel libXrender-devel imake \
    xorg-x11-util-macros libjpeg-turbo-devel libXaw libXaw-devel fontconfig-devel \
    xorg-x11-server-Xvfb emacs texlive-latex subversion createrepo symlinks libxslt \
    ccache vim motif-devel CERN-CA-certs lcms lcms-libs castor-devel castor-lib \
    castor-rfio-client libevent-headers cern-lxdistcc-hosts libgssglue \
    openmotif-devel glibc-devel.x86_64 openmotif-devel mesa-libGLU-devel sudo \
    gcb make libxslt-devel gcc-c++ libgit2-devel libfipscheck.so.1 bzip2 \
    numactl-devel \
    zip python-pip python-devel \
    xz-devel lcov \
    zsh \
    && yum clean all && rm -rf /var/cache/yum

# Update pip
RUN pip install --upgrade pip setuptools


##################################
# Install LHCb package installer #
##################################

RUN mkdir -p /opt/lhcb

RUN pip install lbinstall

RUN lbinstall --root=/opt/lhcb install LBSCRIPT CMT COMPAT
RUN lbinstall --root=/opt/lhcb install DAVINCI_v42r6p1_x86_64_centos7_gcc62_opt

CMD ["/bin/zsh"]
