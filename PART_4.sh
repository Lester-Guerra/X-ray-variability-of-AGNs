#!/bin/sh

export SAS_CCF=`pwd`/ccf.cif
export SAS_ODF=`pwd`/`ls -1 *SUM.SAS`
export Events_List=`pwd`/`ls -1 *ImagingEvts.ds`

src_reg=`sed -n 4p ds9.reg`
bkg_reg=`sed -n 5p ds9.reg`

for region in `sed 1q ../regions` 
do
    if [ -e $region'_gti.fits' ]
    then
        evselect \
            table=EPICclean.fits \
            withfilteredset=Y \
            filteredset=EPICclean_$region.fits \
            destruct=Y keepfilteroutput=T \
            expression='#XMMEA_EP && (PI>150) && gti('$region'_gti.fits,TIME)'

        # Source spectrum
        evselect \
            table=EPICclean_$region.fits \
            withspectrumset=yes \
            spectrumset=PNsource_spectrum_$region.fits \
            energycolumn=PI \
            spectralbinsize=5 \
            withspecranges=yes \
            specchannelmin=0 \
            specchannelmax=20479 \
            expression='(FLAG==0) && (PATTERN<=4) && ((X,Y) IN '$src_reg')'

        # Backround spectrum
        evselect \
            table=EPICclean_$region.fits \
            withspectrumset=yes \
            spectrumset=PNbackground_spectrum_$region.fits \
            energycolumn=PI \
            spectralbinsize=5 \
            withspecranges=yes \
            specchannelmin=0 \
            specchannelmax=20479 \
            expression='(FLAG==0) && (PATTERN<=4) && ((X,Y) IN '$bkg_reg')'

        backscale \
            spectrumset=PNsource_spectrum_$region.fits \
            badpixlocation=EPICclean_$region.fits

        backscale \
            spectrumset=PNbackground_spectrum_$region.fits \
            badpixlocation=EPICclean_$region.fits

        # Generate a redistribution matrix
        rmfgen \
            spectrumset=PNsource_spectrum_$region.fits \
            rmfset=PN_$region.rmf

        # Generate an ancillary file
        arfgen \
            spectrumset=PNsource_spectrum_$region.fits \
            arfset=PN_$region.arf \
            withrmfset=yes \
            rmfset=PN_$region.rmf \
            badpixlocation=EPICclean_$region.fits \
            detmaptype=psf
    fi
done
