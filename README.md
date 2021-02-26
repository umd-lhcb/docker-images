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


## Tips for LHCb software version discovery
Most of LHCb software version can be discovered on `lxplus` with:
```
lb-run -l <software_name>
```

For example, `<software_name>` can be `DaVinci`.

To list LHCb software that can be `lbinstall`-ed:
```
lbinstall query > src/lbinstall_available_packages.txt --root=$HOME/build/lbinstall
```
