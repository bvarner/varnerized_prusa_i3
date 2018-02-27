// This file is licensed under the GPL, as it is based upon the work of  David Trcka, published at  https://www.thingiverse.com/thing:1903200

// Modifications were made to turn his printable replacement nut into a fixed coupling for connecting
// TR8 rods to NEMA 17 motors with 5mm shafts and a .5mm cutout.

// For securing the rods I use M3 set screws. 
// You can use two M3x4 and two M3x6 or M3x8 cap head screws.

use <threads.scad>

skirt = 3; // Height of the skirt to add.
height = 25;    // total height of the coupler
threads = 4;    // 4 for Tr8x8, 2 for Tr8x4
test = false;   // test=true shows screw only

module screw() {
    thrs = 2;
    translate([0,0,-2])
        metric_thread(diameter=8.2, thread_size=thrs, rectangle=2/thrs, pitch=2,
            n_starts=threads, length=(height / 2) + 2, internal=true);
}

module shaft() {
    difference() {
        translate([0, 0, height / 2]) cylinder(h = (height / 2) + skirt + 1, r = 2.5, $fn = 48);
        translate([2, -2.5, height / 2]) cube([1, 5, (height / 2) + skirt + 1]);
    }
}

module coupler_body() {
    difference() {
        union() {
            cylinder (h=height, r= 7, $fn=96);
            if (skirt > 0) {
                translate([0, 0, (height / 4) * 3 + 2.5]) cylinder (h = height - ((height / 4) * 3 + 2.5) + skirt, r1 = 7, r2 = 23 / 2, $fn = 96);
            }
        }
        
        // Champfer the holes
        translate([0,0, -0.5]) cylinder(h=4, r1=5, r2=0, $fn=48);
        translate([0,0,height + skirt - 1]) cylinder(h=1, r1=2.5, r2=3, $fn=48);
        
        // Mark for the flat
        translate([7, 0, -0.75]) rotate([0, 45, 0]) cylinder(r = 1, h = 2, $fn = 4);    }
}

module mount_holes() {
    translate([-8, 0, height / 4]) rotate([0, 90, 0]) metric_thread(diameter=3, pitch = 0.5, length = 16);
    translate([-7, 0, height / 4]) rotate([0, 90, 0]) cylinder(h = 0.75, r1 = 1.75, r2 = 1.2, $fn = 48);
    rotate([0, 0, 180]) translate([-7, 0, height / 4]) rotate([0, 90, 0]) cylinder(h = 0.75, r1 = 1.75, r2 = 1.2, $fn = 48);
    
    translate([-8, 0, (height / 4) * 3]) rotate([0, 90, 0]) metric_thread(diameter=3, pitch = 0.5, length = 16);
    translate([-7, 0, (height / 4) * 3]) rotate([0, 90, 0]) cylinder(h = 0.75, r1 = 1.75, r2 = 1.2, $fn = 48);
    rotate([0, 0, 180]) translate([-7, 0, (height / 4) * 3]) rotate([0, 90, 0]) cylinder(h = 0.75, r1 = 1.75, r2 = 1.2, $fn = 48);
}

translate([0, 0, height + skirt])rotate([180, 0, 0])
if (test) {
    shaft();
    screw();
    mount_holes();
} else {
    difference() {
        coupler_body();
        shaft();
        screw();
        mount_holes();
    }
}
