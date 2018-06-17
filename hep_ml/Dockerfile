# Use CERN's official ROOT docker
FROM rootproject/root-ubuntu16

# Run as root, and delete default 'builder'
USER root
RUN userdel builder

#ARG username=physicist
#RUN useradd --create-home --home-dir /home/${username} ${username}
#ENV HOME /home/${username}
#USER ${username}

RUN export uid=1000 gid=100 && \
			   mkdir -p /home/developer && \
			   echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
			   echo "developer:x:${uid}:" >> /etc/group && \
			   chown ${uid}:${gid} -R /home/developer


#WORKDIR /data

USER developer
ENV HOME /home/developer

# Start bash by default
CMD ["bash"]
