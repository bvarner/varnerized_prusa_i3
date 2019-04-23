// A customizable lead-screw coupling for NEMA 17 motors.
// This file assumes you'll be using M3 screws (preferably set screws, right?)
// Most everything else is customizable.
nozzle_diameter = 0.4; // Your printer nozzle diameter. Used to calculate slew on critical clearances.

set_screw_length = 4;

lead_screw_diameter = 8.2; // OD of the lead-screw.
lead_screw_thread_size = 2; // Thread size of the lead-screw (2 for a TR8x8 or TR8x4)
lead_screw_thread_rect = 1; // Set to 1 for rectangular threads for TR8x8.
lead_screw_threads = 4; // 4 for TR8x8, 2 for TR8x4
lead_screw_end_length = 14; // How much of the coupling should be dedicated to lead-screw insertion.

coupling_diameter = lead_screw_diameter + (set_screw_length * 2);

motor_shaft_length = 24 - 0.5; // How long is your motor shaft? Most NEMA 17s with 5mm shafts are ~24mm.
motor_shaft_diameter = 5; // OD of motor shaft.
motor_shaft_flat = 0; // Depth of cut for the flat, or 0. Commonly 0.5 on most motors.

skirt_diameter = 23; // Diameter of a skirt to add to the bottom portion. Useful on z-axis motors.
thread_screw_holes = false; // If you cannot tap the set screw holes yourself, you can try printing threaded holes.


use <threads.scad>;

$fn = 90;
difference() {
    union() {
        cylinder(d = coupling_diameter, h = motor_shaft_length + lead_screw_end_length);
        if (skirt_diameter > coupling_diameter) {
            cylinder(d1 = skirt_diameter, d2 = coupling_diameter, h = motor_shaft_length - lead_screw_end_length);
        }
    };
    
    // Internal cutout parts
    union() {
        translate([0, 0, -2]) {
            difference() {
                cylinder(d = motor_shaft_diameter + nozzle_diameter, h = motor_shaft_length + 2);
                if (motor_shaft_flat > 0) {
                    translate([((motor_shaft_diameter + nozzle_diameter) / 2) - motor_shaft_flat,
                                    -motor_shaft_diameter / 2,
                                    -1])
                    cube([motor_shaft_flat + 1, motor_shaft_diameter, motor_shaft_length + 4]);
                }
            }
        }
        translate([0, 0, -1]) cylinder(d1 = motor_shaft_diameter + nozzle_diameter + 2, 
                                                    d2 = motor_shaft_diameter + nozzle_diameter, h = 2);
        
        translate([0, 0, motor_shaft_length]) {
            metric_thread(diameter = lead_screw_diameter, thread_size = lead_screw_thread_size, rectangle = lead_screw_thread_rect, 
                                   pitch = 2, n_starts = lead_screw_threads, 
                                   length = lead_screw_end_length + 2, internal = true);
            translate([0, 0, lead_screw_end_length  - 1]) cylinder(d1 = lead_screw_diameter - lead_screw_thread_size, d2 = lead_screw_diameter + nozzle_diameter, h = 1.2);
        }
        // Motor shaft set screws
        translate([0, 0, motor_shaft_length - .5 * lead_screw_end_length]) set_screw();
        // Threaded rod set screws
        translate([0, 0, motor_shaft_length  + .5 * lead_screw_end_length]) set_screw();
    }
}

module set_screw() {
    rotate([0, 90, 0]) {
        if (thread_screw_holes) {
            translate([0, 0, -1 - coupling_diameter / 2])
                metric_thread(diameter = 4, pitch = 0.7, length = coupling_diameter + 2);
        } else {
            cylinder(d = 3.3, h = coupling_diameter + 2, center = true);
        }
        // champfers
        for (zm = [0, 1]) {
            mirror([0, 0, zm]) translate([0, 0, (coupling_diameter + nozzle_diameter) / 2 - .75]) 
                cylinder(d1 = 3.3, d2 = 5.5, h = 1);
        }
    }
};