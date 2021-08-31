use <x-end.scad>
use <x-end-motor.scad>

clearance = 0.2;

module x_end_motor_camera_mount() {
    difference() {
        intersection() {
            union() {
                x_end_motor_base();
                x_end_motor_endstop_base();
            }
            // Translate and place the cut cube for the bottom of the engine mount.
            translate(v=[-1,32 + clearance, 30.25 + clearance]){
                translate(v=[-10,12,10]) cube(size = [60,42,42], center = true);
            }
        }
        
        x_end_motor_shaft_cutout();
        x_end_holes();

        // Position to place
        translate(v=[-1,32,30.25]){
            // Motor mount holes
            translate(v=[20,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
            translate(v=[1,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
        }
    }
}

//x_end_motor();
union () {
    x_end_motor_camera_mount();
    // Extension arm
    translate([-15 - 8.5, 31 + 22 - 30 + clearance, 26.5 + 26.5 - 0.1]) {
        hull() {
            cube([17, 30 - clearance, 0.1]);
            translate([87, 0, 87]) cube([17, 30 - clearance, 0.1]);
        }
        hull() {
            translate([87, 0, 70]) cube([1, 30 - clearance, 17]);
            translate([87 + 70, 15 - (clearance / 2), 70]) 
                rotate([0, 0, 30])
                cylinder(d = 30 - clearance, h = 17, $fn = 6); 
        }
    }
}
