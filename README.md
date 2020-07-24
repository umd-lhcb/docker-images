# docker-images
Custom dockers images for UMD LHCb group analyses.


## `hep_ml`

* On Linux:
```
docker run --rm -it -v <src_path>:/data -v $XAUTHORITY:/home/physicist/.Xauthority -e DISPLAY -e UID=$(id -u) -e GID=$(id -g) --net=host umdlhcb/hep_ml:<tag>
```
* On Windows: Make sure `PuTTY` and `Xming` are installed, and replace `$XAUTHORITY` with a hard-coded `~/.Xauthority`.


## `lhcb-stack-cc7`

* On Linux:
```
docker run --rm -it -v <src_path>:/data -v $XAUTHORITY:/home/physicist/.Xauthority -e DISPLAY -e UID=$(id -u) -e GID=$(id -g) --net=host umdlhcb/lhcb-stack-cc7:<tag>
```

### Build instruction for `Dockerfile-DaVinci`
See rules defined in the `Makefile`.
