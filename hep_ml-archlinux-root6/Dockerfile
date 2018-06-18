# Use a Archlinux base
FROM archimg/base-devel

# Update first
RUN pacman -Syu --noconfirm

# Create a builder with sudo permission
RUN pacman -S sudo --noconfirm
RUN useradd -m -u 999 -g 999 builder
RUN echo "builder ALL=(root) NOPASSWD: ALL" > /etc/sudoers.d/builder

USER builder
WORKDIR /home/builder

# Now get yay so that we can build aur packages
RUN sudo pacman -S go git
RUN curl https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz --output yay.tar.gz
RUN tar -xzf yay.tar.gz
RUN cd yay && makepkg
RUN sudo pacman -U --noconfirm ./*.xz


## Run as root, and delete default 'builder'
#USER root
#RUN userdel -r builder

## Add the bootstrap script
#ADD ./bootstrap.sh /usr/local/bin

## Make UID and GID ENV
#ENV UID 1000
#ENV GID 985

## Update ubuntu
#RUN apt-get update && apt-get -qq -y upgrade

## Install pip
#RUN apt-get -qq -y install python-pip

## Go to the actual working directory
#WORKDIR /data
#CMD ["/usr/local/bin/bootstrap.sh"]
CMD ["/bin/bash"]
