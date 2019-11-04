# vim:set ft=dockerfile:

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
RUN yum install -y \
        java-latest-openjdk expect \
        libpng12.i686 mesa-libGL.i686 libXft.i686 \
        glib2.i686 lz4.i686 dbus-libs.i686 motif.i686 \
        sqlite.i686 pulseaudio-libs.i686 qt5-qtbase-gui.i686 && \
    yum clean all && rm -rf /var/cache/yum

ADD ./Libero_SoC_v12.2_lin.bin /tmp
ADD ./libero_autoinstall.exp /tmp

WORKDIR /tmp
RUN ./libero_autoinstall.exp

# We need to patch a setup file to make Libero recognize motif
ADD ./actel_setup_vars /usr/local/microsemi/Libero_SoC_v12.2/Libero/bin

# Remove leftover files
RUN rm -rf /tmp/*


###############################
# Load default configurations #
###############################

RUN yum install -y zsh && \
    yum clean all && rm -rf /var/cache/yum
ADD ./zshrc /home/physicist/.zshrc


#############################
# Bootstrap user permission #
#############################

# Add the bootstrap script
ADD ./bootstrap.sh /usr/local/bin

# Make UID and GID ENV
ENV UID 1000
ENV GID 985

CMD ["/usr/local/bin/bootstrap.sh"]
