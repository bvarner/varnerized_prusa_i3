/**
 * Arduino & RAMPS Enclosure for 
 * Prusa i3 Style Frame Printers.
**/

// Used to calculate slew between mating surfaces in the x/y planes.
printer_nozzle_od = 0.4;

// Used to calculate mount hole diameters.
hotend_cable_cross_section = [10.5, 10.5];
heatbed_cable_cross_section = [9.75, 8];

top = 1;
bottom = 1;
wall = 1.26;

// lower left hole located @ 4.89, 67.8 on the frame (from the table)
frame_mount_origin = [4.89, 67.8];

box_origin = [0, frame_mount_origin[1] - 20, 0];
// Outer Dimensions of the box.
box_dimensions = [90, 150, 50];

difference() {
    // Start with the outer box shell.
    translate(box_origin) {
            difference() {
                    outer_box();
                
                // calculate scales for each axis.
                // scale = target * 100 / current_size
                inner_box_dimensions = [
                    box_dimensions[0] - 2 * wall, // 2 walls
                    box_dimensions[1] - 2 * wall, // 2 walls
                    box_dimensions[2] - top - bottom // top and bottom
                ];
                
                // Create the inner hollow...
                difference() {
                    translate([wall, wall, bottom]) 
                        resize(inner_box_dimensions) 
                            outer_box(); 
                    // Create the struts for reinforcements
                    translate([]) cube([]);
                }
        }
    }
    

    // Draw the frame with the mounting screws / nuts.
    i3Frame(frame_width = box_dimensions[2]);
}

module outer_box() {
    difference() {
        cube([box_dimensions[0], box_dimensions[1], box_dimensions[2]]);
        // corner angles
        translate([box_dimensions[0], box_dimensions[1] / 2, box_dimensions[2] / 2]) {
            for (zy = [0, 1]) {
                mirror([0, zy, 0])
                for (zm = [0, 1]) {
                    mirror([0, 0, zm])
                        translate([0, box_dimensions[1] / 2, -box_dimensions[2] / 2])
                            rotate([45, 45, 45]) 
                                cube([15, 30, 30], center = true);
                }
            }
        }
    }
}    


module i3Frame(thickness = 6, frame_width = 50) {
    // Relative to the origin point.
    frame_mount_locations = [
        [0, 0],
        [38, 0],
        [38, 94],
        [0, 94]
    ];
    
    translate([-thickness, -10, 0])
        cube([thickness, box_dimensions[1] + frame_mount_origin[1] + 20, frame_width]);
    
    // M3 Screw posts
    rotate([0, 270, 0]) translate([0, 0, -wall]){
        translate([frame_mount_origin[0], frame_mount_origin[1], 0]) {
            for (screw_coord = frame_mount_locations) {
                // M3 Hex nut & entry
                translate([screw_coord[0], screw_coord[1], -3.4]) {
                    cylinder(d1 = 7.251 + printer_nozzle_od, 
                                 d2 = 6.01 + printer_nozzle_od, 
                                 h = 1, $fn = 6);
                    translate([0, 0, 1]) 
                        cylinder(d = 6.01 + printer_nozzle_od, h = 2.4, $fn = 6);
                    translate([0, 0, 0])
                        cylinder(d = 3.4 + printer_nozzle_od, h = thickness + 3.4);
                }
            }
        }
        
        translate(box_origin) {
            difference() {
                // Hollow the entire back.
                translate([bottom, wall, 0]) cube([box_dimensions[2] - bottom - top, box_dimensions[1] - wall * 2, wall + 3.4]);
                
                // remove some vertical bands to act as print support
                for (vy = [0 : box_dimensions[1] / 15 : box_dimensions[1]]) {
                    translate([0, vy, 0]) cube([box_dimensions[2], printer_nozzle_od * 3, wall + 0.5]);
                }
                
                // And a few horizontal ones too.
                for (i = [0 : 5]) {
                    vz = box_dimensions[2] / 6 * i;
                    translate([vz, 0, 0]) cube([0.8, box_dimensions[1], wall + 0.5]);
                }
        
                translate([frame_mount_origin[0], 20, 0]) {
                    for (screw_coord = frame_mount_locations) {
                        // M3 Hex nut & entry
                        hull() {
                            translate([screw_coord[0], screw_coord[1], 0]) {
                                cylinder(d = 12 + printer_nozzle_od, 
                                             h = wall + 0.5, $fn = 6);
                                translate([screw_coord[0] == 0 ? 25 : -25, 
                                               screw_coord[1] == 0 ? -20 : box_dimensions[1] - screw_coord[1], 0])
                                cylinder(d = 12 + printer_nozzle_od, h = wall + 0.5);
                                translate([0, screw_coord[1] == 0 ? -20 : box_dimensions[1] - screw_coord[1], 0])
                                cylinder(d = 12 + printer_nozzle_od, h = wall + 0.5);
                            }
                        }
                    }
                }
            }
        }
    }
}
