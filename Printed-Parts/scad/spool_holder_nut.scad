use <threads.scad>;

translate([0, 0, 6.5]) rotate([0, 180, 0])
difference() {
    union () {
        cylinder(r = 14, h = 6.5, $fn = 360);
        translate([0, 0, -0.5]) cylinder(r = 6, h = 7, $fn = 360);
    }
    translate([0, 0, -0.55]) cylinder(r1 = 4.75, r2 = 3, h = 1, $fn = 360);
    translate([0, 0, -2]) metric_thread(diameter = 8 + 0.3, pitch = 2, length = 8, internal = true);
    
    // Grips.
    for(angle = [0 : 10 : 360]) {
        rotate([0, 0, angle]) translate([14.5, 0, -1]) cylinder(r = 1, h = 8, $fn = 64);
    }
}
