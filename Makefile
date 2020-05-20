#################
# Configuration #
#################

CLION_VERSION ?= 2020.1
DAVINCI_VERSION ?= v45r3
GCC_DEPENDENCY ?= x86_64_centos7_gcc8_opt


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
	@printf "CLION_VERSION: %s\n" $(CLION_VERSION)
	@printf "DAVINCI_VERSION: %s\n" $(DAVINCI_VERSION)
	@printf "GCC_DEPENDENCY: %s\n" $(GCC_DEPENDENCY)


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


##################
# lhcb-stack-cc7 #
##################

.PHONY: lhcb-stack-cc7-DaVinci

lhcb-stack-cc7-DaVinci:
	docker build \
	    --tag umdlhcb/lhcb-stack-cc7:DaVinci-$(DAVINCI_VERSION)-$(date) \
		--build-arg DAVINCI_VERSION=$(DAVINCI_VERSION) \
		--build-arg GCC_DEPENDENCY=$(GCC_DEPENDENCY) \
	    -f $(makefile_dir)/lhcb-stack-cc7/Dockerfile-DaVinci $(makefile_dir)/lhcb-stack-cc7
	docker tag umdlhcb/lhcb-stack-cc7:DaVinci-$(DAVINCI_VERSION)-$(date) umdlhcb/lhcb-stack-cc7:DaVinci-$(DAVINCI_VERSION)
