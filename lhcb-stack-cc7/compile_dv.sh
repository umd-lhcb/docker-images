#!/bin/sh

DAVINCI_VERSION=v45r6
PHYS_VERSION=v26r6
ANALYSIS_VERSION=v21r6
TUPLETOOL_SL_VERSION=0.2.1
TRACKER_ONLY_EMU_VERSION=0.1.1

git config --global user.name "Physicist"
git config --global user.email "lhcb@physics.umd.edu"

lb-dev DaVinci/${DAVINCI_VERSION}
cd DaVinciDev_${DAVINCI_VERSION}

git lb-use TupleToolSemiLeptonic https://github.com/umd-lhcb/TupleToolSemiLeptonic.git
git lb-checkout TupleToolSemiLeptonic/${TUPLETOOL_SL_VERSION} Phys/TupleToolSemiLeptonic

git lb-use Phys
git lb-checkout Phys/${PHYS_VERSION} Phys/LoKiPhys
git lb-checkout Phys/${PHYS_VERSION} Phys/DaVinciTypes
git lb-checkout Phys/${PHYS_VERSION} Phys/RelatedInfoTools

git lb-use Analysis
git lb-checkout Phys/Analysis/${ANALYSIS_VERSION} Phys/DecayTreeTupleTrigger

git clone https://github.com/umd-lhcb/TrackerOnlyEmu.git \
    --branch ${TRACKER_ONLY_EMU_VERSION} --depth 1
cp -r ./TrackerOnlyEmu/davinci/* .
rm -rf ./TrackerOnlyEmu

make configure && make
