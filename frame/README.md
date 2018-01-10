# Varnerized Prusa i3 Clone
## Frame & X-Y Carriage

This frame can accomodate original prusa 250x210 heatbeds (the MK42 or MK43). 
You'll need a build surface of 250x210 to print some of these.

In this folder you'll find:

* The original Prusa MK3v8b.dxf.
* DXfs which extract the frame (and m3 mount holes) into separate DXfs.
* OpenSCAD files which slice the DXFs into layers, suitable for printing -- for use as router templates. :-)
* STLs of each segment of the OpenSCAD templates.

I produced these by:

1. Downloading the prusa original dxf.
2. Opening the DXF in DraftSight.
    * Separating the carriage into a different DXF.
    * Tracing the Spline in the original Prusa frame with a polyline.
5. Setting up OpenSCAD files that create lap-joints of the OpenSCAD sources, and then rendered each section of the dxfs to STL.
