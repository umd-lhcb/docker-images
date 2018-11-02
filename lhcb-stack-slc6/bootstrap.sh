#!/bin/bash

# Add a user with correct uid and gid at runtime
#mkdir -p /home/physicist

echo "physicist:x:${UID}:${GID}:Physicist,,,:/home/physicist:/usr/bin/zsh" >> \
    /etc/passwd
echo "physicist:x:${GID}:" >> /etc/group

# Fake a passwd entry
echo "physicist::17640:0:99999:7:::" >> /etc/shadow

# Grant the correct permissions
chown ${UID}:${GID} -R /home/physicist

# cd to persistent working directory
cd /data
exec su physicist
