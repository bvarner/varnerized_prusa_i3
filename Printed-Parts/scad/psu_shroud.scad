cover_height = 70; // mm

bottom_thickness = 2; //mm
wall_thickness = 2.5; //mm

vent_tab_bottom = 13.5; //mm measured bottom edge of PSU to vent hole;
vent_tab_height = 2; //mm measured opening of the vents (Actual was 2.99, but I want some 'room').
vent_tab_width = 15; // mm Can be smaller than the width of the vent on the PSU.
vent_cutout = 1; // 1 = yes, 0 = no.

// PSU dimensions
psu_width = 114; //mm
psu_depth = 50; //mm
psu_height = 215; //mm
psu_steel_thickness = 1.5; //mm measured thickness of the steel on the side by the frame.

psu_vent_from_edge = 16.5; //mm mesured along the width - how far the PSU vent holes start from the edge of the PSU.
psu_vent_from_bottom = 31; // mm measured from the bottom edge of the PSU.
psu_mount_hole_from_bottom = 30; //mm measured from bottom edge of the PSU to bottom of the hole.

// IEC Socket cutout
iec_socket_width = 47.5; //mm
iec_socket_height = 27.75; //mm

iec_socket_lip = 1.6; // mm - The amount of 'overhang' on the front 'lip' of the IEC socket. Used to visually line up the IEC with the cutout for the ventilation.
iec_socket_lip_wall_thickness = 1.5; //mm  wall-thickness required for socket to 'snap' into place.

// How high up the "shelf" that the PSU sits on is from the bottom of the shroud.
shelf_height = 27;

// Support bracket.
module support_bracket() {
    color("purple") {
        intersection() {
            translate([14, 0, 6.25]) cube([5, 17, 20]); 
            translate([14, 0, (19 / 2)+ 6.25]) rotate([180, 0, 0]) rotate([0, 90, 0]) cylinder(h = 6.25, r = 19, $fn = 3);
        }
        
        difference() {
            cube([33, 17, 6.25]);
            
            translate([7,0,0])
            hull() {
                translate([0, 6.5, 0]) cylinder(r = 1.75, h = 6.25, $fn = 48);
                translate([0, 11.5, 0]) cylinder(r = 1.75, h = 6.25, $fn = 48);
            }
            
            translate([26.75, 0, 0])
            hull() {
                translate([0, 6.5, 0]) cylinder(r = 1.75, h = 6.25, $fn = 48);
                translate([0, 11.5, 0]) cylinder(r = 1.75, h = 6.25, $fn = 48);
            }
            translate([0, 13, 0]) rotate([0, 0, 45]) cube([10, 10, 6.25]);
            translate([33, 13, 0]) rotate([0, 0, 45]) cube([10, 10, 6.25]);
        }
    }
}

difference() {
    union() {
        difference() {
            // Main cubic area of the base.
            color("blue")
            cube([psu_width + wall_thickness, psu_depth + (wall_thickness * 2), cover_height]);
            
            // Create the main hollow for the PSU.
            color("red")
            translate([0, wall_thickness, bottom_thickness])
            cube([psu_width, psu_depth, psu_height]);
            
            if (vent_cutout == 1) {
                // Create the cutout for the PSU vents on the width.
                color("red")
                translate([psu_vent_from_edge, 0, bottom_thickness + shelf_height + psu_vent_from_bottom]) cube([psu_width - (psu_vent_from_edge * 2), wall_thickness, cover_height - (bottom_thickness + shelf_height + psu_vent_from_bottom)]);
                
                // pretty corners
                translate([psu_vent_from_edge, 0, bottom_thickness + shelf_height + psu_vent_from_bottom - (wall_thickness / 2)]) rotate([45, 0, 0])cube([psu_width - (psu_vent_from_edge * 2), wall_thickness * 2, wall_thickness * 2]);
                
                translate([psu_vent_from_edge - 1.5, 0, cover_height]) rotate([0, 45, 0]) cube([5, wall_thickness, 5]);
                translate([psu_width - psu_vent_from_edge - 5.5, 0, cover_height]) rotate([0, 45, 0]) cube([5, wall_thickness, 5]);
            }
            
            // IEC Cutout.
            color("green") {
                translate([psu_width - psu_vent_from_edge - iec_socket_lip - iec_socket_width, 0, bottom_thickness + iec_socket_lip + 2.5])
                cube([iec_socket_width, wall_thickness, iec_socket_height]);
                // Ensure the wall thickness behind the IEC lip is only as thick as specified.
                translate([psu_width - psu_vent_from_edge - (iec_socket_lip  * 2)- iec_socket_width, 
                                   iec_socket_lip_wall_thickness, 
                                   bottom_thickness + 2.5])
                 cube([iec_socket_width + (iec_socket_lip * 2), wall_thickness, iec_socket_height + (iec_socket_lip * 2)]);
            }
        }

        // Add the wall beneath the PSU on the frame-side.
        translate([0, wall_thickness, bottom_thickness]) 
        cube([wall_thickness * 2, psu_depth, shelf_height]);

        // Shelf on the Socket side.
        translate([psu_width - (wall_thickness * 2), wall_thickness, bottom_thickness])
        cube([wall_thickness * 2, psu_depth, shelf_height]);

        // Add the partial wall and vent tab
        color("orange") {
        translate([psu_steel_thickness, wall_thickness, bottom_thickness + shelf_height])
        cube([(wall_thickness * 2) - psu_steel_thickness, (psu_depth / 2) + (vent_tab_width / 2), vent_tab_bottom + (2 * vent_tab_height)]);
        translate([0, wall_thickness + (psu_depth / 2) - (vent_tab_width / 2), bottom_thickness + shelf_height + vent_tab_bottom])
        cube([psu_steel_thickness, vent_tab_width, vent_tab_height]);
            
        } 

        // Vertical Support Columns (mount holes are typically 50mm on center, centered in the PSU, with radius 2)
        color("black") {
            // Supports are 15mm wide: 7.5's derive from that.
            translate([(psu_width / 2) - 25 - 7.5, psu_depth + (wall_thickness * 2), 0])
            cube([15, 3, cover_height]);
            
            translate([(psu_width / 2) + 25 - 7.5, psu_depth + (wall_thickness * 2), 0])
            cube([15, 3, cover_height]);
        }

        translate([(psu_width / 2) + 25 - (33 / 2), psu_depth + (wall_thickness * 2), 0]) support_bracket();
    }

    // Vertical Support rear mount holes & counter sink
    color("black") {
        translate([(psu_width / 2) - 25, psu_depth + (wall_thickness * 2) + 3 - 1.5, bottom_thickness + shelf_height + psu_mount_hole_from_bottom + 2]) rotate([-90, 0, 0]) cylinder(r2 = 3.5, r1 = 2, h = 1.5, $fn = 48);
        translate([(psu_width / 2) - 25, psu_depth + wall_thickness - 1, bottom_thickness + shelf_height + psu_mount_hole_from_bottom + 2]) rotate([-90, 0, 0]) cylinder(r = 2, h = wall_thickness + 5, $fn = 48);
        
        translate([(psu_width / 2) + 25, psu_depth + (wall_thickness * 2) + 3 - 1.5, bottom_thickness + shelf_height + psu_mount_hole_from_bottom + 2]) rotate([-90, 0, 0]) cylinder(r2 = 3.5, r1 = 2, h = 1.5, $fn = 48);
        translate([(psu_width / 2) + 25, psu_depth + wall_thickness - 1, bottom_thickness + shelf_height + psu_mount_hole_from_bottom + 2]) rotate([-90, 0, 0]) cylinder(r = 2, h = wall_thickness + 5, $fn = 48);
    }
    
    // Mount holes on the end away from the frame.
    // 25mm centers 11mm from the 'back' of the PSU.
    translate([psu_width - 1, wall_thickness  + psu_depth - 11, bottom_thickness + shelf_height + 30 + 4]) rotate([0, 90, 0]) cylinder(r = 2, h = 5, $fn = 48);
    translate([psu_width - 1, wall_thickness + psu_depth - 11 -25, bottom_thickness + shelf_height + 30 + 4]) rotate([0, 90, 0]) cylinder(r = 2, h = 5, $fn = 48);
    translate([psu_width + wall_thickness - 1.5, wall_thickness + psu_depth - 11, bottom_thickness + shelf_height + 30 + 4]) rotate([0, 90, 0]) cylinder(r1 = 2, r2 = 3.5, h = 1.5, $fn = 48);
    translate([psu_width + wall_thickness - 1.5, wall_thickness + psu_depth - 11 -25, bottom_thickness + shelf_height + 30 + 4]) rotate([0, 90, 0]) cylinder(r = 2, r2 = 3.5, h = 1.5, $fn = 48);
    
    translate([wall_thickness * 2+ 3, psu_depth + wall_thickness, bottom_thickness + 3])
    {
        hull() {
            translate([0, wall_thickness, 0]) rotate([90, 0, 0]) cylinder(r = 3, h = wall_thickness, $fn = 48);
            translate([12, wall_thickness, 0]) rotate([90, 0, 0]) cylinder(r = 3, h = wall_thickness, $fn = 48);
        }
    }
    
    // Pretty corner on the bottom & top.
    translate([psu_width + wall_thickness - 1.5, 0, 0]) rotate([0, 45, 0]) cube([5, psu_depth + (wall_thickness * 2), 5]);
    translate([psu_width + wall_thickness - 1.5, 0, cover_height]) rotate([0, 45, 0]) cube([5, psu_depth + (wall_thickness * 2), 5]);
    translate([-3.5, 0, 0]) rotate([0, 45, 0]) cube([5, psu_depth + (wall_thickness * 2), 5]);
    // Pretty corner for the back top.
    translate([0, psu_depth + (2 * wall_thickness) + 3, cover_height - 4.5]) rotate([45, 0, 0]) cube([psu_width + wall_thickness, 5, 7]);
    translate([0, 0, cover_height - 1.5]) rotate([45, 0, 0]) cube([psu_width + wall_thickness, 5, 5]);
    
    translate([16,0.25,40]) rotate([90,0,0]) linear_extrude(height = 0.4) 
    { text("Varnerized",font = "helvetica:style=Bold", size=12, center=true, $fn = 360); }
    
    translate([16, 0.25, 8]) rotate([90, 0, 0]) linear_extrude(height = 0.4)
    {text("i3", font = "helvetica:style=Bold", size = 24, center = true, $fn = 360);}
}


