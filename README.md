### So this is how it works

PART 1 extracts a single event (i.e. pattern zero only), high energy light
curve, from the event file to identify intervals of flaring particle background.

You can then plot the lightcurve to determine the right threshold.

PART 2 will remove flaring particle background.
You must edit it to specify the
threshold for the lightcurve.
Yes, it should receive it as an argument (ToDo).

Afterwards you can display the image to choose source and background regions.
The regions (in the forementionded order) should be saved as as ds9.reg

PART 3 extracts lightcurves from that data in the intervals 0.3-2 and 2-10 kEV.

The lightcurves can be plotted as a Hardness-Intensity diagram.
I chose *lcurve* to do the task.
The diagrams are included in qdp format.

The HIDs of every observation are combined into one.
I chose the qdp format because it makes it very easy to combine them.
This diagram will be separated into different regions as it seems convenient.

Inside every observation's directory, the regions are specified using gti files.
A file inside the galaxy's directory called 'regions' contains their names.

PART 4 creates a usable spectrum for every region of an individual observation.
They can be combined using *epicspeccombine* and then manipulated with XSpec.
