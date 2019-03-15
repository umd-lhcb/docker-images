# docker-images
Custom dockers images for UMD LHCb group analyses.


## hep_ml
* On Linux:
```
docker run --rm -it -v <src_path>:/data -v $XAUTHORITY:/home/physicist/.Xauthority -e DISPLAY -e UID=$(id -u) -e GID=$(id -g) --net=host ypsunumd/hep_ml:<tag>
```
* On Windows: Make sure `PuTTY` and `Xming` are installed, and replace `$XAUTHORITY` with a hard-coded `~/.Xauthority`.


## lhcb-stack-cc
* On Linux:
```
docker run --rm -it -v <src_path>:/data -v $XAUTHORITY:/home/physicist/.Xauthority -e DISPLAY -e UID=$(id -u) -e GID=$(id -g) --net=host ypsunumd/lhcb-stack-cc7:<tag>
```

### Build instruction for `Dockefile-DaVinci`
This build file installs specified official DaVinci to the docker image. To
build:
```
docker build --build-arg DAVINCI_VERSON=<version> --build-arg GCC_DEPENDENCY=<dep>  -t ypsunumd/lhcb-stack-cc7:DaVinci-v42r8p1-SL -f Dockerfile-DaVinci-SL .
```

By default, `DAVICI_VERSION=v42r8p1`, and `GCC_DEPENDENCY=x86_64_centos7_gcc62_opt`.

### Build instruction for `Dockerfile-DaVinci-SL`
This build file installed some tools for semileptonic analyses into a copy of
existing DaVinci docker image. This requires to build an image with
`Docker-DaVinci` of the same DaVinci version first.

The build command is mostly similar to
[`Dockerfile-DaVinci` section](#build-instruction-for-dockerfile-davinci), the
only notable difference is that now we have 3 optional arguments.

By default, `DAVINCI_VERSION=v42r8p1`, `ANALYSIS_VERSION=v18r8p1`, and
`GCC_DEPENDENCY=x86_64-centos7-gcc62-opt`.


## centos7-base
This provides a base image for all `lhcb-stack-cc` images. It has all runtime
dependencies installed. This image should not be used by end user.
