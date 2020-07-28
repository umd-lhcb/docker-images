# docker-images
Custom dockers images for UMD LHCb group analyses. See rules defined in the
`Makefile` for build instructions of these docker images.

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

**Note**: For `DaVinci/v45r4` and newer, there's a lot more error messages when
ntupling. The culprit is [this commit](https://gitlab.cern.ch/rcurrie/LHCb/commit/3ed724bd667d2626f35b7b710864c8fe0131dbb1). This is harmless.
