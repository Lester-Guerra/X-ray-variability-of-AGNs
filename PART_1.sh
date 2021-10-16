#!/bin/sh

export SAS_ODF=`pwd`/ODF

cifbuild
export SAS_CCF=`pwd`/ccf.cif

odfingest
export SAS_ODF=`pwd`/`ls -1 *SUM.SAS`

epproc
export Events_List=`pwd`/`ls -1 *ImagingEvts.ds`

evselect \
    table=$Events_List \
    withrateset=Y \
    rateset=rateEPIC.fits \
    maketimecolumn=Y \
    timebinsize=100 \
    makeratecolumn=Y \
    expression='#XMMEA_EP && (PI>10000&&PI<12000) && (PATTERN==0)'

printf "Now you should run dsplot table=rateEPIC.fits x=TIME y=RATE.ERROR\n"
