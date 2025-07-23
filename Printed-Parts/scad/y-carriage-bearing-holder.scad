// Y - carriage bearing holder.

nozzle_diameter = 0.4;

// The Y-carriage has a 10mm opening that the bearing seats into.
bearing_ID = 8;
bearing_OD = 15;
bearing_length = 24;
bearing_radius = bearing_OD / 2;

// Mounting Dimensions on the y-carriage.
// Holes are 20mm OC, for M3.
mount_opening_width = 10;
mount_hole_centers = 20;
mount_hole_od = 3;

// If an upper opening is needed, this will carve open the top.
upper_opening_increase = 0;
strap_width = 10;
strap_hole_diameter = 3.2; // Make 2.5 for tappable hole.
strap_hole_head = 5.75; // Make 2.5 for tappable hole.
strap_wiggle = 5;
strap_wiggle_flat = 1.5;

// Calculated properties
bearing_inset = bearing_radius - sqrt(pow(bearing_radius, 2) - pow((mount_opening_width / 2), 2));
mount_width = mount_hole_centers + mount_hole_od * 2;
mount_height = (bearing_OD - bearing_ID) / 2 - bearing_inset - 0.75;


$fn = 64;

rotate([0, 90, 0]) difference() {
    hull() {
        translate([-strap_width / 2, 0, 0]) cube([strap_width, mount_width, bearing_radius - bearing_inset + 4]);
        translate([0, mount_width / 2, bearing_radius - bearing_inset]) 
            rotate([0, 90, 0]) cylinder(d = bearing_OD + 2, h = strap_width, center = true);
    }

    // Cut the bottom off.
    translate([-bearing_length, 0, - bearing_inset - 1]) 
        cube([bearing_length * 2, mount_width, bearing_inset + 1]);

    // mounting holes (tap to M3)
    translate([0, mount_hole_od, -3]) {
#        cylinder(d = strap_hole_diameter, h = bearing_OD - 3);
#        translate([0, 0, bearing_OD - 3]) cylinder(d = strap_hole_head, h = 3);
    }
    translate([0, 20, 0]) {
        translate([0, mount_hole_od, -3]) {
            cylinder(d = strap_hole_diameter, h = bearing_OD - 3);
            translate([0, 0, bearing_OD - 3]) cylinder(d = strap_hole_head, h = 3);
        }
    }

    // bearing body
    translate([0, mount_width / 2, bearing_radius - bearing_inset]) rotate([0, 90, 0]) {
        cylinder(d = bearing_OD,  h = bearing_length, center = true);
        // Allow horizontal wiggle.
        if (strap_wiggle != 0) {
            for (zm = [0, 1]) {
                mirror([0, 0, zm])
                intersection() {
                    translate([0, 0, strap_wiggle_flat / 2]) 
                        cylinder(d = bearing_OD + 2, h = bearing_length / 2);
                    translate([0, 0, strap_wiggle_flat / 2]) {
                        union() {
                            rotate([strap_wiggle / 2, 0, 0]) cylinder(d = bearing_OD,  h = bearing_length, center = true);
                            rotate([-strap_wiggle / 2, 0, 0])cylinder(d = bearing_OD,  h = bearing_length, center = true);
                        }
                    }
                }
            }
        }
        
        if (upper_opening_increase > 0) {
            translate([bearing_radius / 2, 0, 0]) 
                cube([bearing_radius, bearing_OD - upper_opening_increase, bearing_length], center = true);
        }
    }

    // Shaft (for visualization)
    translate([0, mount_width / 2, bearing_radius - bearing_inset]) rotate([0, 90, 0]) 
        cylinder(d = bearing_ID, h = 2 * bearing_length, center = true);
}
