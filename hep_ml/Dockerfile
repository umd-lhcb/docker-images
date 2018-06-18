# Use CERN's official ROOT docker
FROM rootproject/root-ubuntu16

# Run as root, and delete default 'builder'
USER root
RUN userdel builder

# Add the bootstrap script
ADD ./bootstrap.sh /usr/local/bin

# Make UID and GID ENV
ENV UID 1000
ENV GID 985

# Update ubuntu
RUN apt-get update && apt-get -qq -y upgrade

# Install pip
RUN apt-get -qq -y install python-pip

# Go to the actual working directory
WORKDIR /data
CMD ["/usr/local/bin/bootstrap.sh"]
