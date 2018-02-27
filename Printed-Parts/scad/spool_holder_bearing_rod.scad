use <threads.scad>;

// Length of each segment is based on the part receiving it.
// The spool holders have 8mm deep holes.
// The nuts have 6 mm deep holes.
// We'll short the bolt by 0.3mm on each end.
//    7.7 + (width of bearing) + 5.7 = 
//    7.7 + 7 + 5. 7 = 20.4


metric_thread(diameter = 8, pitch = 2, length = 20.4, internal = false);
translate([0, 0, 7.7]) cylinder(r = 4.01, h = 7, $fn = 360);