#!/bin/sh

OS=x86_64-centos7
PLATFORM=${OS}-gcc8-opt

export CMTCONFIG=x86_64-centos7-gcc8-opt

. /opt/lhcb/LbLogin.sh
. /opt/lhcb/lcg/releases/ROOT/6.18.04-c767d/${PLATFORM}/bin/thisroot.sh

export PATH=/opt/lhcb/lcg/releases/gcc/8.3.0/${OS}/bin:${PATH}
export LD_LIBRARY_PATH=/opt/lhcb/lcg/releases/gcc/8.3.0/${OS}/lib64:${LD_LIBRARY_PATH}

export CC=/opt/lhcb/lcg/releases/gcc/8.3.0/${OS}/bin/gcc
export CXX=/opt/lhcb/lcg/releases/gcc/8.3.0/${OS}/bin/g++
export CMAKE_PREFIX_PATH=/opt/lhcb/lcg/releases/Boost/1.70.0-eebf1/${PLATFORM}:${CMAKE_PREFIX_PATH}
export CMAKE_PREFIX_PATH=/opt/lhcb/lcg/releases/HepMC/2.06.10-1a364/${PLATFORM}:${CMAKE_PREFIX_PATH}
