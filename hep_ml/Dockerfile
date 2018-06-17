# Use CERN's official ROOT docker
FROM rootproject/root-ubuntu16

# User management
USER root
ARG username=physicist
RUN userdel builder
RUN useradd --create-home --home-dir /home/${username} ${username}
ENV HOME /home/${username}
USER ${username}

WORKDIR /data

# Start bash by default
CMD ["bash"]
