# Varnerized Prusa i3 Clone
## Frame & X-Y Carriage

This frame can accomodate original prusa 250x210 heatbeds (the MK42 or MK43) or smaller heatbeds (MK2 & MK3 and derivatives) more readily available.

In this folder you'll find:

* The original Prusa MK3v8b.dxf.
* A 1:1 PDF printable on A2 paper (MK3V8B.pdf) with the dxf layer 0 rendered in black.
* 1:1 SVGs of the A2 PDF, with the carriage and frame split from one another, and hand-edited path corrections.
* OpenSCAD files of the SVGs exported as OpenSCAD objects. (*-full.scad)
* OpenSCAD files to generate printable templates for cutting / routing the frame and carriage.
* STLs of each segment of the templates, printable on printers that can handle 200x200mm print areas. (or perhaps smaller)

I produced these by:

1. Downloading the prusa original dxf.
2. Opening the DXF in Autocad TrueView.
    * Adjusting the 0 layer to black
    * Plotting to high-res PDF on A2 landscape.
3. Importing that PDF (MK3VB8.pdf) in Inkscape.
    * ungrouping, and splitting out objects
    * Converting objects to paths.
    * Flattening Beziers.
    * Exporting those objects to OpenSCAD using https://www.thingiverse.com/thing:25036 extension.
5. Setting up OpenSCAD files that create lap-joints of the OpenSCAD sources, and then rendered each section of the object to STL.
