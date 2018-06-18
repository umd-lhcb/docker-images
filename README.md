# docker-images: Custom dockers for UMD LHCb group
## hep__ml (all variants)
* On Linux:
```
docker run --rm -it -v <src_path>:/data -e DISPLAY -v $XAUTHORITY:/home/physicist/.Xauthority --net=host <image_name>
```
