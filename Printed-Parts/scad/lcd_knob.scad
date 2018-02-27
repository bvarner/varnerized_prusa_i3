// Prusa style LCD Knob, without an STL for importing.
// I printed up the knob from Prusa, then measured everything and re-created it here.

$fn = 128;
difference() {
    union () {
        cylinder(r1=10, r2= 6.5, h = 7.5);
        translate([0, -2.25, 0]) cube([17, 4.5, 7.5]);
    }
    translate([0, 0, 20 - (7.5 - 3)]) sphere(r = 10);
    translate([17, -2.5, 0]) rotate([0, -25, 0]) cube([5, 5, 20]);
    
    intersection() {
        translate([-5.5, 0, 0]) cube([11, 10, 4]);
        cylinder(r = 5.5, h = 4);
    }
    translate([-5.5, -1.25, 0]) cube([11, 1.25, 4]);
    cylinder(r = 3, h = 4);
}

difference() {
    cylinder(r = 4.5, h = 3.8);
    cylinder(r = 3, h = 4);
    translate([-.75, 0, 0])cube([1.5, 5, 3.8]);
}
