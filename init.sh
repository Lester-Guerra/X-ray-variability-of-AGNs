# NOT PORTABLE! It is made to initialise Heasoft on my machine only.
# I still have to add a way to check that it hasn't been run before.
#!/bin/sh
export HEADAS=$HOME/src/heasoft-6.28/x86_64-pc-linux-gnu-libc2.33
export LHEASOFT=$HEADAS
export FTOOLS=$HEADAS
export LD_LIBRARY_PATH=$HEADAS/lib
export PATH=$HEADAS/bin:$PATH
export LHEAPERL="/usr/bin/perl"
export PERLLIB=$LD_LIBRARY_PATH/perl
export PERL5LIB=$LD_LIBRARY_PATH/perl
export PFCLOBBER="1"
export PFILES="$HOME/pfiles;$HEADAS/syspfiles"
export FTOOLSINPUT="stdin"
export FTOOLSOUTPUT="stdout"
export LHEA_DATA=$HEADAS/refdata
export LHEA_HELP=$HEADAS/help
export EXT="lnx"
export PGPLOT_FONT=$LD_LIBRARY_PATH/grfont.dat
export PGPLOT_RGB=$LD_LIBRARY_PATH/rgb.txt
export PGPLOT_DIR=$HEADAS/lib
export POW_LIBRARY=$PGPLOT_DIR=$HEADAS/pow
export PYTHONPATH=$PGPLOT_DIR/python:$HEADAS/lib
export LYNX_CFG=$HEADAS/lib
export XRDEFAULTS=$HEADAS/xrdefaults
export TCLRL_LIBDIR=$HEADAS/lib
export XANADU=$HOME/src/heasoft-6.28
export XANBIN=$HEADAS
export CALDB=$HOME/caldb
export CALDBCONFIG=$CALDB/software/tools/caldb.config
export CALDBALIAS=$CALDB/software/tools/alias_config.fits
export SAS_PERL=/usr/bin/perl
export SAS_PREV_PATH=$PATH
export SAS_PREV_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export SAS_DIR=$HOME/src/SAS/xmmsas_20210317_1624
export PYTHONPATH=$SAS_DIR/lib/python:$PYTHONPATH
export SAS_PATH=$SAS_DIR

binpath=${SAS_DIR}/bin:${SAS_DIR}/bin/devel
libpath=${SAS_DIR}/lib   
perlpath=${SAS_DIR}/lib/perl5
pythonpath=${SAS_DIR}/lib/python

export PATH=${SAS_DIR}/binextra:${binpath}:${PATH}
export LIBRARY_PATH=$SAS_DIR/libsys:$SAS_DIR/libextra:$libpath

PERL5LIB=$perlpath:$PERL5LIB

export PERL5LIB=$PERL5LIB:$PERLLIB
export PYTHONPATH=$pythonpath:$PYTHONPATH
export SAS_IMAGEVIEWER=ds9
export SAS_BROWSER="surf"
export PGPLOT_FONT=$SAS_DIR/libextra/grfont.dat
export SAS_VERBOSITY=4
export SAS_SUPPRESS_WARNING=1
export SAS_CCFPATH=$HOME/CCF
export PATH=$PATH:$HOME/src/SAOImageDS9/bin:
