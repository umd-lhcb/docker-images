#!/bin/sh

. /opt/lhcb/LbLogin.sh
. /opt/lhcb/lcg/releases/ROOT/6.18.04-c767d/x86_64-centos7-gcc8-opt/bin/thisroot.sh

export CMTCONFIG=x86_64-centos7-gcc8-opt

export PATH=/opt/lhcb/lcg/releases/gcc/8.3.0/x86_64-centos7/bin:${PATH}
export LD_LIBRARY_PATH=/opt/lhcb/lcg/releases/gcc/8.3.0/x86_64-centos7/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/opt/lhcb/lcg/releases/gcc/8.3.0/x86_64-centos7/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/opt/lhcb/lcg/releases/Boost/1.70.0-eebf1/x86_64-centos7-gcc8-opt/lib:${LD_LIBRARY_PATH}

export CC=/opt/lhcb/lcg/releases/gcc/8.3.0/x86_64-centos7/bin/gcc
export CXX=/opt/lhcb/lcg/releases/gcc/8.3.0/x86_64-centos7/bin/g++
export CMAKE_PREFIX_PATH=/opt/lhcb/lcg/releases/Boost/1.70.0-eebf1/x86_64-centos7-gcc8-opt:${CMAKE_PREFIX_PATH}
export CMAKE_PREFIX_PATH=/opt/lhcb/lcg/releases/HepMC/2.06.10-1a364/x86_64-centos7-gcc8-opt:${CMAKE_PREFIX_PATH}
