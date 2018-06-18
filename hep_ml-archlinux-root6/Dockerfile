# Use a Archlinux base
FROM archimg/base-devel

# Update first
RUN pacman -Syu --noconfirm

# Set makepkg flags
RUN echo 'MAKEFLAGS="-j6"' >> /etc/makepkg.conf

# Create a builder with sudo permission
RUN pacman -S sudo --noconfirm
RUN useradd -m -u 999 -g 999 builder && \
    echo "builder ALL=(root) NOPASSWD: ALL" > /etc/sudoers.d/builder

USER builder
WORKDIR /home/builder

# Now get yay so that we can build aur packages
RUN sudo pacman -S --noconfirm go git
RUN curl https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz --output yay.tar.gz && \
    tar -xzf yay.tar.gz && \
    cd yay && makepkg -ci --noconfirm && \
    rm -rf yay.tar.gz yay

# Install Python & company
RUN sudo pacman -S --noconfirm python python-numpy python-scipy python-pandas

# Now we install root
RUN yay -S --noconfirm root

# Install hep_ml and root_numpy
RUN yay -S --noconfirm python-hep_ml python-root_numpy

# QoL improvements
RUN sudo pacman -Rsn --noconfirm vi && \
    sudo pacman -S --noconfirm wget zsh tmux neovim python-neovim python-jedi python-pip python-matplotlib && \
    yay -S --noconfirm neovim-drop-in neovim-youcompleteme-core-git
USER root
RUN mkdir -p /home/physicist/.config && \
    mkdir -p /home/physicist/.tmp/vim && \
    cd /home/physicist/.config && \
    git clone https://github.com/ypsun-umd/neovim-config-standalone.git nvim && \
    cd nvim && \
    git submodule update --init --recursive && \
    # We remove all .git repo to save time when chown
    find . -name '.git' | xargs rm -rf
ADD ./zshrc /home/physicist/.zshrc
ADD ./tmux.conf /home/physicist/.tmux.conf

# Add the bootstrap script
ADD ./bootstrap.sh /usr/local/bin

# Make UID and GID ENV, also delete 'builder'
ENV UID 1000
ENV GID 985
RUN userdel -r builder

# Bootstrap user permission
CMD ["/usr/local/bin/bootstrap.sh"]
