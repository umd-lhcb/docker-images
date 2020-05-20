#################
# Configuration #
#################

CLION_VERSION ?= 2020.1

PANDOC_VERSION ?= edge

ifeq ($(PANDOC_VERSION),edge)
PANDOC_COMMIT          ?= master
else
PANDOC_COMMIT          ?= $(PANDOC_VERSION)
endif


###########
# Helpers #
###########

# Used to specify the build context path for Docker.
makefile_dir := $(dir $(realpath Makefile))

# Provide a standardized date format, which could be used for tagging
date := $(shell date "+%Y%m%d")

# Keep this target first so that `make` with no arguments will print this rather
# than potentially engaging in expensive builds.
.PHONY: show-args
show-args:
	@printf "PANDOC_VERSION (i.e. image version tag): %s\n" $(PANDOC_VERSION)
	@printf "pandoc_commit=%s\n" $(PANDOC_COMMIT)


################
# centos7-base #
################

.PHONY: centos7-base-latest centos7-base-clion

centos7-base-latest:
	docker build \
	    --tag umdlhcb/centos7-base:$(date) \
	    -f $(makefile_dir)/centos7-base/Dockerfile-base $(makefile_dir)/centos7-base
	docker tag umdlhcb/centos7-base:$(date) umdlhcb/centos7-base:latest

centos7-base-clion:
	docker build \
	    --tag umdlhcb/centos7-base:clion-$(date) \
		--build-arg CLION_VERSION=$(CLION_VERSION) \
	    -f $(makefile_dir)/centos7-base/Dockerfile-clion $(makefile_dir)/centos7-base
	docker tag umdlhcb/centos7-base:clion-$(date) umdlhcb/centos7-base:clion
