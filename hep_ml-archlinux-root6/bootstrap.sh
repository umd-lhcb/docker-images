#!/bin/sh

# Add a user with correct uid and gid at runtime
#mkdir -p /home/physicist

echo "physicist:x:${UID}:${GID}:Physicist,,,:/home/physicist:/bin/bash" >> \
    /etc/passwd
echo "physicist:x:${GID}:" >> /etc/group

# Fake a passwd entry
echo "physicist::17640:0:99999:7:::" >> /etc/shadow

chown ${UID}:${GID} -R /home/physicist

# Open to the persistent working
cd /data
su physicist -c zsh
