#!/bin/sh

DAVINCI_VERSION=v45r4
TUPLETOOL_SL_VERSION=0.2.1

# Check out TupleToolSemiLeptonic
. /usr/local/bin/envset.sh
git config --global user.name "Physicist"
git config --global user.email "lhcb@physics.umd.edu"

lb-dev DaVinci/${DAVINCI_VERSION}
cd DaVinciDev_${DAVINCI_VERSION}

git lb-use TupleToolSemiLeptonic https://github.com/umd-lhcb/TupleToolSemiLeptonic.git
git lb-checkout TupleToolSemiLeptonic/${TUPLETOOL_SL_VERSION} Phys/TupleToolSemiLeptonic

# Compile TupleToolApplyIsolation
make configure && make
