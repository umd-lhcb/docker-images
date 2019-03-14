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


## centos7-base
This provides a base image for all `lhcb-stack-cc` images. It has all runtime
dependencies installed. This image should not be used by end user.
