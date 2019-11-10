# Use a Archlinux base
FROM archlinux/base:latest

#########################
# System initialization #
#########################

# Generate locale
USER root
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf
ENV LC_ALL "en_US.UTF-8"

# Update, just in case
RUN pacman -Syu --noconfirm

# Install dev tools
RUN pacman -S --noconfirm base-devel

# Set makepkg flags
RUN echo 'MAKEFLAGS="-j6"' >> /etc/makepkg.conf

# Create a builder with sudo permission
RUN useradd -m -u 999 -g 999 builder && \
    echo "builder ALL=(root) NOPASSWD: ALL" > /etc/sudoers.d/builder


#############################
# Install official packages #
#############################

# Install Python libraries we'll be using
RUN pacman -S --noconfirm python python-numpy python-scipy python-pandas python-matplotlib && \
    # QoL improvements
    pacman -S --noconfirm ctags sxiv tig ttf-dejavu openssh wget zsh tmux python-pip \
        neovim xclip python-neovim python-jedi


#######################
# Install vim plugins #
#######################

RUN mkdir -p /home/physicist/.config && \
    mkdir -p /home/physicist/.tmp/vim && \
    cd /home/physicist/.config && \
    git clone https://github.com/ypsun-umd/neovim-config-standalone.git nvim && \
    cd nvim && \
    git submodule update --init --recursive && \
    # We remove all .git repo to save time when chown
    find . -name '.git' | xargs rm -rf


##############
# AUR helper #
##############

USER builder
WORKDIR /home/builder

# Now get yay so that we can build aur packages
RUN curl https://aur.archlinux.org/cgit/aur.git/snapshot/yay-bin.tar.gz --output yay-bin.tar.gz && \
    tar -xzf yay-bin.tar.gz && \
    cd yay-bin && \
    makepkg -ci --noconfirm && \
    rm -rf yay-bin.tar.gz yay-bin

# Install AUR goodies
RUN sudo pacman -Rsn --noconfirm vi && \
    yay -S --noconfirm neovim-drop-in neovim-youcompleteme-core-git


########
# ROOT #
########

# Install ROOT dependencies
RUN yay -S --noconfirm --asdeps \
    cern-vdt cfitsio fftw ftgl gl2ps glew graphviz gsl hicolor-icon-theme \
    intel-tbb libafterimage libiodbc libmariadbclient postgresql-libs sqlite \
    tex-gyre-fonts \
    unixodbc unuran xmlrpc-c \
    cmake \
    blas xrootd

# Now we install root
RUN yay -S --noconfirm root

# Install hep_ml
RUN yay -S --noconfirm python-hep_ml

# Install a python-ROOT file IO interface
RUN yay -S --noconfirm python-uproot


#################################################
# Load default configurations for some programs #
#################################################

USER root

ADD ./zshrc /home/physicist/.zshrc
ADD ./tmux.conf /home/physicist/.tmux.conf


#############################
# Bootstrap user permission #
#############################

# Add the bootstrap script
ADD ./bootstrap.sh /usr/local/bin

# Make UID and GID ENV, also delete 'builder'
ENV UID 1000
ENV GID 985
RUN userdel -r builder && \
    # Clean cache
    pacman -Scc --noconfirm

CMD ["/usr/local/bin/bootstrap.sh"]
