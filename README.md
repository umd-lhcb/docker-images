# docker-images: Custom dockers for UMD LHCb group
## hep_ml
* On Linux:
```
docker run --rm -it -v <src_path>:/data -v $XAUTHORITY:/home/physicist/.Xauthority -e DISPLAY -e UID=$(id -u) -e GID=$(id -g) --net=host ypsunumd/hep_ml
```
* On Windows: Make sure `PuTTY` and `Xming` are installed, and replace `$XAUTHORITY` with a hard-coded `~/.Xauthority`.


## lhcb-stack-cc
* On Linux:
```
docker run --rm -it -v <src_path>:/data -e UID=$(id -u) -e GID=$(id -g) --net=host ypsunumd/lhcb-stack-cc:<tag>
```
