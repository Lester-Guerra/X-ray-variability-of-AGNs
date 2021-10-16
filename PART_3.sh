#!/bin/sh

export SAS_CCF=`pwd`/ccf.cif
export SAS_ODF=`pwd`/`ls -1 *SUM.SAS`
export Events_List=`pwd`/`ls -1 *ImagingEvts.ds`

# Read the region file for source and background
src_reg=`sed -n 4p ds9.reg`
bck_reg=`sed -n 5p ds9.reg`

# Source lightcurves
evselect \
    table=$Events_List \
    energycolumn=PI \
    expression='#XMMEA_EP&&(PATTERN<=4) && ((X,Y) IN '$src_reg')
                && (PI in [300:2000])' \
    withrateset=yes \
    rateset="PN_source_lightcurve_raw_0.3-2.lc" \
    timebinsize=1000 \
    maketimecolumn=yes \
    makeratecolumn=yes

evselect \
    table=$Events_List \
    energycolumn=PI \
    expression='#XMMEA_EP&&(PATTERN<=4) && ((X,Y) IN '$src_reg')
                && (PI in [2000:10000])' \
    withrateset=yes \
    rateset="PN_source_lightcurve_raw_2-10.lc" \
    timebinsize=1000 \
    maketimecolumn=yes \
    makeratecolumn=yes

# Backround lightcurves
evselect \
    table=$Events_List \
    energycolumn=PI \
    expression='#XMMEA_EP&&(PATTERN<=4) && ((X,Y) IN '$bck_reg')
                && (PI in [300:2000])' \
    withrateset=yes \
    rateset="PN_light_curve_background_raw_0.3-2.lc" \
    timebinsize=1000 \
    maketimecolumn=yes \
    makeratecolumn=yes

evselect \
    table=$Events_List \
    energycolumn=PI \
    expression='#XMMEA_EP&&(PATTERN<=4) && ((X,Y) IN '$bck_reg')
                && (PI in [2000:10000])' \
    withrateset=yes \
    rateset="PN_light_curve_background_raw_2-10.lc" \
    timebinsize=1000 \
    maketimecolumn=yes \
    makeratecolumn=yes

# Lightcurves corrected
epiclccorr \
    srctslist=PN_source_lightcurve_raw_0.3-2.lc \
    eventlist=$Events_List \
    outset=PN_lccorr_0.3-2.lc \
    bkgtslist=PN_light_curve_background_raw_0.3-2.lc \
    withbkgset=yes \
    applyabsolutecorrections=yes

epiclccorr \
    srctslist=PN_source_lightcurve_raw_2-10.lc \
    eventlist=$Events_List \
    outset=PN_lccorr_2-10.lc \
    bkgtslist=PN_light_curve_background_raw_2-10.lc \
    withbkgset=yes \
    applyabsolutecorrections=yes
