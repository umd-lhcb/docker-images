#!/bin/sh

# Add a user with correct uid and gid at runtime
mkdir -p /home/physicist

echo "physicist:x:${UID}:${GID}:Physicist,,,:/home/physicist:/bin/zsh" >> \
    /etc/passwd
echo "physicist:x:${UID}:" >> /etc/group

chown ${UID}:${GID} -R /home/physicist

# FIXME: We assume this directory has been created inside the docker image
chown ${UID}:${GID} -R /data

# Open to the persistent working
cd /data
su physicist
