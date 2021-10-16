#!/bin/sh
# The threshold for the background must be changed if necessary.
# So far 0.11 is appropiate for all observations. But this script will be
# modified in the near future to accept a stored value.

export SAS_CCF=`pwd`/ccf.cif
export SAS_ODF=`pwd`/`ls -1 *SUM.SAS`
export Events_List=`pwd`/`ls -1 *ImagingEvts.ds`

tabgtigen \
    table=rateEPIC.fits \
    expression='RATE<=0.11' \
    gtiset=EPICgti.fits

evselect \
    table=$Events_List \
    withfilteredset=Y \
    filteredset=EPICclean.fits \
    destruct=Y keepfilteroutput=T \
    expression='#XMMEA_EP && gti(EPICgti.fits,TIME) && (PI>150)'

evselect \
    table=$Events_List \
    imagebinning=binSize \
    imageset=PNimage.fits \
    withimageset=yes \
    xcolumn=X \
    ycolumn=Y \
    ximagebinsize=80 \
    yimagebinsize=80

printf "Next, run imgdisplay withimagefile=true imagefile=PNimage.fits\n"
