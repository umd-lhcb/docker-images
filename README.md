# docker-images
Custom dockers images for UMD LHCb group analyses. This is a special branch for
adding semileptonic tools to an old existing image with `DaVinci/v42r8p1`.


## `lhcb-stack-cc7`
* On Linux:
```
docker run --rm -it -v <src_path>:/data -v $XAUTHORITY:/home/physicist/.Xauthority -e DISPLAY -e UID=$(id -u) -e GID=$(id -g) --net=host umdlhcb/lhcb-stack-cc7:<tag>
```

### Build instruction for `Dockefile-DaVinci-SL`
This build file installed some tools for semileptonic analyses into a copy of
existing DaVinci docker image `DaVinci-v42r8p1-20190104`. To build:
```
docker build --build-arg DAVINCI_VERSON=<version> --build-arg GCC_DEPENDENCY=<dep>  -t <tag_name> -f Dockerfile-DaVinci-SL .
```

By default, `DAVINCI_VERSION=v42r8p1`, `ANALYSIS_VERSION=v18r8p1`, and
`GCC_DEPENDENCY=x86_64-centos7-gcc62-opt`.
