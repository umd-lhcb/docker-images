# Use CERN's official ROOT docker
FROM rootproject/root-ubuntu16

# Run as root, and delete default 'builder'
USER root
RUN userdel builder

# Add the bootstrap script
ADD ./bootstrap.sh /usr/local/bin

# Go to the actual working directory
WORKDIR /data
CMD ["/usr/bin/bootstrap.sh"]
