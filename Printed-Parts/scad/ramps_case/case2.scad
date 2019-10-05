// A Nice RAMPS 1.4 + Smart Controller interstitial board enclosure
// For mounting to an i3 Frame.

nozzle_diameter = 0.4;
nozzle_radius = nozzle_diameter / 2;

// Start it off low poly.
$fn = 32;

cap_screw_head = 3;
m3_nut_thickness = 3.5;

// Thickness of walls.
wall = 1.26;

// Include a fan or not?
top_fan = false;

 // Thickness of top/bottom printed surfaces:
 bottom = 0.8;
 top = 0.8;
 
// Physical dimensions of the Arduino Mega 2560
// Measured according to max extents, with origin corner being the USB connector.
// NOTE: This does NOT match the orientation of the board from 
//            https://www.flickr.com/photos/johngineer/5484250200/sizes/o/in/photostream/
// However, the measurements _do_ come from that drawing.
arduino = [53.3, 101.6, 1.6];

// x-y coordinates expressed with relation to the origin of the Arduino board.
// Coordinate represents hole O.C.
// Arduino origin is considered the corner with the USB connector, 
//    x -axis short side (width) of the board.
//    y-axis the length of the board.
arduino_mount_locations = [
    [2.6, 15.3],
    [50.8, 14],
// Mega / Uno locations... collide with ventilation holes.
//    [17.8, 66.1],
//    [45.7, 66.1],
// Mega only mounting Locations
    [2.6, 90.2],
    [50.8, 14 + 82.5] // Point measured by hand. Dimensions omitted from drawing.
];

// Padding - and + to the measurements for x, y, z.
arduino_padding = [
    [cap_screw_head + 5, 30], 
    [20, 24],
    [3.5, 40],
];


// i3 frame width
frame_width = 50;
// lower left hole located @ 4.89, 67.8 on the frame.
// mounting holes are [38, 94] OC.
frame_mount_origin = [4.89, 67.8];
// Relative to the origin
frame_mount_locations = [
    [0, 0],
    [38, 0],
    [38, 94],
    [0, 94]
];

// Dimensions of the box, as rotated for printing.
x = wall + arduino_padding[1][0] + arduino[1] + arduino_padding[1][1] + wall;
y = wall + arduino_padding[0][0] + arduino[0] + arduino_padding[0][1] + wall;
z = max(bottom + arduino_padding[2][0] + arduino[2] + arduino_padding[2][1] + top, frame_width);

echo ("calculated x: ", x);
echo ("calculated y: ", y);
echo ("calculated z: ", z);

//%translate([64.5, 19, bottom + arduino_padding[2][0] - 1.5]) rotate([0, 0, 180]) mirror([0, 0, 0]) import("RAMPS1_4.STL");

top_side();
//board_side();

module top_side() {
    difference() {
        union() {
            extruder_cable_holder();
            heatbed_cable_holder();
            
            difference() {
                // Start with the full outer hull shape.
                cube([x, y , z]);
                // nib some corners.
                nib_corners();
                // Cut the main hollow
                translate([wall, wall, 0]) board();
            }
            // Add the reinforcements for the mount.
            frame_mount(nuts = false, reinforce = true);
        }
        
        // remove the bottom.
        translate([wall, wall, 0]) {
            difference() {
                cube([x - 2 * wall - nozzle_diameter, 
                          y - 2 * wall - nozzle_diameter, 
                          bottom + arduino_padding[2][0]]);
                // corner nib off the bottom
                nib_corners(inside = true, inside_straight = true);
            }
        }
        // Mounting holes for frame.
        frame_mount(nuts = true);
        
        // Holes for the cap screws from the bottom.
        cap_screws();
        
        // Remove the extruder and cable holder bits.
        extruder_cable_holder(remove = true);
        heatbed_cable_holder(remove = true);
        
        ventilation_holes();
        
        // Fan mount for a 40mm fan at the top, to draw hot air out, cold in through the bottom.
        translate([wall + 10,  y - 2 * wall - 5 - arduino_padding[1][1] / 2, (z - top - bottom - 40 ) / 2]) {
            rotate([0, -90, 0]) {
                if (top_fan) {
                    translate([0, -40, 0]) {
                        cube([40, 40, 10]);
                        difference() {
                            translate([20, 20, 0]) cylinder(d = 38, h = 10 + wall + 1);
                            translate([20, 20, (10 + wall + 1) / 2]) {
                                rotate([0, 0, 30]) cylinder(d = 24, h = 10 + wall + 1, $fn = 6);
                                rotate([0, 0, 30]) cube([40, 1.5, 10 + wall + 1], center = true);
                                rotate([0, 0, 90]) cube([40, 1.5, 10 + wall + 1], center = true);
                                rotate([0, 0, 150]) cube([40, 1.5, 10 + wall + 1], center = true);
                                translate([-8, -8, 0]) rotate([0, 0, 150]) 
                                    cube([40, 1.5, 10 + wall + 1], center = true);
                                translate([8, 8, 0]) rotate([0, 0, 150]) 
                                    cube([40, 1.5, 10 + wall + 1], center = true);
                                translate([8, -8, 0])
                                    rotate([0, 0, 30]) cube([40, 1.5, 10 + wall + 1], center = true);
                                translate([-8, 8, 0])
                                    rotate([0, 0, 30]) cube([40, 1.5, 10 + wall + 1], center = true);
                                translate([-10, 0, 0])
                                    rotate([0, 0, 90]) cube([40, 1.5, 10 + wall + 1], center = true);
                                translate([10, 0, 0])
                                    rotate([0, 0, 90]) cube([40, 1.5, 10 + wall + 1], center = true);
                            }
                        }
                        translate([4, 4, 0]) cylinder(d = 3, h = 10 + wall + 1);
                        translate([4, 40 - 4, 0]) cylinder(d = 3, h = 10 + wall + 1);
                        translate([40 - 4, 4, 0]) cylinder(d = 3, h = 10 + wall + 1);
                        translate([40 - 4, 40 - 4, 0]) cylinder(d = 3, h = 10 + wall + 1);
                    }
                } else {
                    translate([6, 0, 0]) {
                        // No Top Fan? OK Let's cut some vent holes!
                        for (vx = [-26 : 8 : 0]) {
                            translate([0, vx, 0])
                            hull() {
                                cylinder(d = 4, h = 11 + wall, $fn = 6);
                                translate([31, 0, 0])cylinder(d = 4, h = 11 + wall, $fn = 6);
                            }
                        }
                    }
                }
            }
        }
    }
}

module frame_mount(nuts = true, reinforce = false, through = false) {
    translate([x, 0, 0]) {
        rotate([90, -90, 0]) 
            translate([frame_mount_origin[0], frame_mount_origin[1] - 50, 0]) {
            
                if (nuts) {
                    // X-axis exit hole is ~21mm above the lowest mount
                    translate([0, 27, -7.25 / 2 - wall]) 
                        rotate([0, -90, 0]) 
                            rotate([0, 0, 30]) 
                                cylinder(d = 8, h = 10, $fn = 6);
                }
                
                for (fm = frame_mount_locations) {
                    if (nuts) {
                        translate([fm[0], 
                                        fm[1], 
                                        -cap_screw_head - 0.5 - wall - (arduino_padding[0][0] - m3_nut_thickness)])
                       { 
                            cylinder(d = 3.3, h = 20);
                           
                            rotate([0, 0, 30]) 
                                cylinder(h = m3_nut_thickness * (through ? 2 : 1), d = 6.3 * (through ? 1.15 : 1), $fn = 6);
                            if (!through) {
                                translate([0, 0, -3]) rotate([0, 0, 30]) cylinder(d1 = 8, d2 = 6.3, h = 4, $fn = 6);
                           }
                       }
                    }
                    if (reinforce) {
                        translate([fm[0], fm[1], - wall - arduino_padding[0][0] + cap_screw_head])
                            cylinder(d = 6.25, h = arduino_padding[0][0] - cap_screw_head);
                        translate([0 - frame_mount_origin[0], fm[1] - (8.5 / 2),  -wall - arduino_padding[0][0]])
                            cube([z, 8.5, arduino_padding[0][0]]);
                    }
                };
            }
    }
};    

module nib_corners(inside = false, inside_straight = false) {
    if (inside) {
        translate([wall, y - wall, z]) rotate([45, 45, -45]) cube([15, 30, 30], center = true);
        if (inside_straight) {
            translate([wall, y - wall, 0]) rotate([45, 0, 135]) cube([15 + wall * 3, 30, 30], center = true);
        } else {
            translate([wall, y - wall,0]) rotate([45, 45, 135]) cube([15, 30, 30], center = true);
        }
    } else {
        translate([0, y, z]) rotate([45, 45, -45]) cube([15, 30, 30], center = true);
        translate([0, y, 0]) rotate([45, 45, 135]) cube([15, 30, 30], center = true);
    }
}

module board_side() {
    difference() {
        union() {
            translate([wall + nozzle_radius, wall + nozzle_radius, 0]) 
                cube([x - (2 * wall) - nozzle_diameter, 
                          y - (2 * wall) - nozzle_diameter, 
                          bottom + arduino_padding[2][0]]);
            // Protrusions for the cable escapements
            translate([0, 15.5 + wall, 0]) cube([20, 9 - nozzle_diameter, 20]);
            translate([86 + 2 * wall, y - wall - nozzle_radius, 0]) cube([30 - nozzle_diameter, wall + nozzle_radius, 15]);
        }

        // corner nibs
        nib_corners(inside = true, inside_straight = true);
        
        translate ([wall, wall, bottom]) {
            difference() {
                translate([nozzle_radius, nozzle_radius, 0]) board(cutout = false);
                
                // reinforcement of the lower wall.
                translate([nozzle_radius, nozzle_radius, 0]) {
                    difference() {
                        cube([x - 2 * wall - nozzle_diameter, y - 2 * wall - nozzle_diameter, arduino_padding[2][0]]);
                        translate([wall, wall, 0])
                            cube([x - 4 * wall - nozzle_diameter, 
                                      y - 4 * wall - nozzle_diameter, 
                                      arduino_padding[2][0] + 1]);
                    }
                }
                
                // lower corner reinforcements
                cube([10, 10, cap_screw_head + 1 - bottom]);
                translate([x - 2 * wall - nozzle_diameter - 10, 0, 0])
                    cube([10, 10, cap_screw_head + 1 - bottom]);
                translate([x - 2 * wall - nozzle_diameter - 10, y - 2 * wall - nozzle_diameter - 10, 0])
                    cube([10, 10, cap_screw_head + 1 - bottom]);
                translate([0, y - 2 * wall - nozzle_diameter - 10 - arduino_padding[1][1] / 3, 0])
                    cube([arduino_padding[1][1] / 3 + 10, 
                              arduino_padding[1][1] / 3 + 10, 
                              cap_screw_head + 1 - bottom]);
                
            }
        }
        
        cap_screws();
        
        frame_mount(nuts = true, through = true);
        
        ventilation_holes();
    }

    // X-axis exit hole is ~21mm above the lowest mount
    difference() {
        union() {
            // Arduino mounting.
            // Move to the arduino board origin.
            translate([x - wall - arduino_padding[1][0], wall + arduino_padding[0][0], 0])
                mirror([1, 0, 0]) {
                    for(location = arduino_mount_locations) {
                        translate([location[1], location[0], 0]) 
                            standoff();
                    }
                }
            
            // Add the portion where the cutout is.
            translate([wall, wall + nozzle_radius, 0])
            translate([arduino_padding[1][1] + arduino[1] + arduino_padding[1][0] - nozzle_radius, 5, 0])
                cube([wall + nozzle_radius, arduino[0] + 10 - nozzle_diameter, arduino_padding[2][0] + arduino[2]]);
            
            translate([x, 0, 0]) 
                rotate([90, -90, 0]) 
                    translate([frame_mount_origin[0], frame_mount_origin[1] - 50, 0]) {
                        difference() {
                            translate([-bottom, 27, -7.25 / 2 - wall]) 
                                rotate([0, -90, 0]) 
                                    rotate([0, 0, 30]) 
                                        difference() {
                                            cylinder(d = 12, h = arduino_padding[2][0], $fn = 6);
                                            cylinder(d = 8, h = arduino_padding[2][0], $fn = 6);
                                        };
                                        translate([-frame_mount_origin[0], 15, -wall - nozzle_radius]) 
                                        cube([8, 20, wall * 2]);
                }; // difference
            }; // translate
        }
        ventilation_holes();
    }
}



module ventilation_holes() {
    // If we're going to have a fan in the top, don't open all the vents.
    if (top_fan) {
        intersection() {
            union() {
                vholes();
            }
            union() {
                cube([x, y, 0.2]);
                translate([0, 0, z - 0.2]) cube([x, y, 0.2]);
            }
        }
    } else {
        vholes();
    }
}

module vholes() {
    hd = 4;
    step = 4;
    ay = y - 26 - step * 4; // 13 on both sides, 8 end to end
    
    union() {
        translate([20, 13, -1]) {
            for (hx = [0 : hd + step : x - 32]) {
                vent_row_1(hd, hx, step, ay);
                vent_row_2(hd, hx, step, ay);
                vent_row_3(hd, hx, step, ay);
            }
        }
    }
}

module vent_row_1(hd, hx, step, ay) {
    if (hx > 0 && hx !=  2 * (hd + step) && hx != 12 * (hd + step) && hx != 14 * (hd + step)) {
        hull() {
            translate([hx, 0 / 3 * ay, 0]) rotate([0, 0, 30]) cylinder(d = hd, h = z + 2, $fn = 6);
            translate([hx, 1 / 3 * ay, 0]) rotate([0, 0, 30]) cylinder(d = hd, h = z + 2, $fn = 6);
        }
    }
}

module vent_row_2(hd, hx, step, ay) {
    hull() {
        translate([hx, 1 / 3 * ay + step * 2, 0]) rotate([0, 0, 30]) cylinder(d = hd, h = z + 2, $fn = 6);
        translate([hx, 2 / 3 * ay + step * 2, 0]) rotate([0, 0, 30]) cylinder(d = hd, h = z + 2, $fn = 6);
    }
}

module vent_row_3(hd, hx, step, ay) {
    if (hx > 0 && hx !=  2 * (hd + step) && hx != 12 * (hd + step) && hx != 14 * (hd + step)) {
        hull() {
            translate([hx, 2 / 3 * ay + step * 4, 0]) rotate([0, 0, 30]) cylinder(d = hd, h = z + 2, $fn = 6);
            translate([hx, 3 / 3 * ay + step * 4, 0]) rotate([0, 0, 30]) cylinder(d = hd, h = z + 2, $fn = 6);
        }
    }
}


module extruder_cable_holder(remove = false) {
    translate([0, -6, 51]) mirror([0, 0, 1]) {
        if (!remove) {
            difference() {
                union() {
                    // extruder cable holder
                    translate([0, 6, 0]) difference(){
                        translate([0,0,15]) cube([5,34,20]);
                        translate([1.5,3,14.8]) rotate([0,45,0]) cube([3,34,5]);  
                    }    
                    translate([5,28,28]) rotate([0,90,0]) cylinder(h=5,r1=10,r2=8,$fn=30);  
                    translate([0, 6, 0]) difference() {
                        translate([-1.93,0,28.07]) rotate([0,45,0]) cube([9.8,19,9.8]);  
                        translate([-5,-5,15]) cube([5,34,20]);  
                        translate([10,-5,15]) cube([5,34,20]); 
                    }
                    translate([-6,28,28]) rotate([0,90,0]) cylinder(h=6,r=13.5,$fn=30);  
                    translate([-10,28,28]) rotate([0,90,0]) cylinder(h=4,r1=8.5,r2=13.5,$fn=30);  
                    
                    difference() {
                        translate([-5.5,23.5,16]) rotate([0,45,0]) cube([8,9,8]);  
                        translate([1,0,10]) cube([5,40,20]); 
                    }
                }

                // Parts to remove from the mount.
                translate([1.5,7.1,14.8]) rotate([0,45,0]) cube([3,40,5]); 
                translate([-20,28,28]) rotate([0,90,0]) cylinder( h = 40,r = 5.5,$fn=30); 
                translate([- 30,7,35]) cube([30,40,15]); 
                translate([-15,23.5,30]) cube([30,9,8]); 
                
                translate([-15,12,28]) cube([15,30,8]); 
                translate([-12,16.5,28]) cube([15,23,8]); 
                translate([-3,28,28]) rotate([35,90,0]) cylinder( h = 24,r = 1.8,$fn=30);
                
                //screw holes
                translate([-2.7,19.5,20]) rotate([0,0,90]) cylinder( h = 33,r = 1.6,$fn=30);  
                translate([-2.7,36.5,20]) rotate([0,0,90]) cylinder( h = 33,r = 1.6,$fn=30); 
                
                // nuts with supports
                translate([-5.7,19.5,24.5]) difference (){
                    translate([0,0,-0.25]) rotate([0,0,0]) cube([12,5.7,2.7], center =true) ;
                    translate([-8.6,-5,0.35])  cube([10,15,0.75]);
                    translate([4.6,-5,0.35])  cube([4,15,0.75]);
                    translate([-2.6,-5.6,0.65])  cube([15,4,0.35]);
                    translate([-2.6,1.6,0.65])  cube([15,4,0.35]);
                }    
                translate([-5.7,36.5,24.5]) difference (){
                    translate([0,0,-0.25]) rotate([0,0,0]) cube([12,5.7,2.7], center =true) ;
                    translate([-8.6,-5,0.35])  cube([10,15,0.75]);
                    translate([4.6,-5,0.35])  cube([4,15,0.75]);
                    translate([-2.6,-5.6,0.65])  cube([15,4,0.35]);
                    translate([-2.6,1.6,0.65])  cube([15,4,0.35]);             
                }
            }
        } else {
            translate([-20,28,28]) rotate([0,90,0]) cylinder( h = 40,r = 5.5,$fn=30); 
            translate([-15,12,28]) cube([15,30,8]); 
            translate([-3,28,28]) rotate([35,90,0]) cylinder( h = 24,r = 1.8,$fn=30); 
        }
    } 
}

module heatbed_cable_holder(remove = false) {
    translate([28, wall * 2, 50]) mirror([0, 0, 1]) {
        if (!remove) {
            difference() {
                union() {
                    translate([63,86.0,0.5]) cube([15,5,34.5]); 
                    translate([75,90,28]) rotate([90,0,0]) cylinder(h=6,r1=16.5,r2=11,$fn=30); 
                    translate([75,99,28]) rotate([90,0,0]) cylinder(h=9,r=13,$fn=30); 
                    translate([75,101,28]) rotate([90,0,0]) cylinder(h=2,r1=9,r2=13,$fn=30); 
                    difference(){
                        translate([70.3,88.5,12.7]) rotate([-45,0,0]) cube([9.5,5,10]);
                        translate([70.4,85.5,10])  cube([9.5,5,9]);    
                    }
                };
                translate([61,102,28]) rotate([35,90,0]) cylinder(h=35,r=3.3,$fn=30); 
                // nuts with supports
                translate([67,90.8 -4,24.5]) difference (){
                    translate([0,0,-0.25]) rotate([0,0,90]) cube([10,5.7,2.7], center =true) ;
                    translate([-5.6,-5,0.65])  cube([4,15,0.5]);
                    translate([1.6,-5,0.65])  cube([4,15,0.5]);
                    translate([-5.6,-3.6,0.35])  cube([15,4,0.75]);
                    translate([-5.6,3.6,0.35])  cube([15,4,0.75]);           
                }

                translate([83,98,24.5]) difference (){
                    translate([0,0,-0.25]) rotate([0,0,90]) cube([10,5.7,2.7], center =true) ;
                    translate([-5.6,-5,0.65])  cube([4,15,0.5]);
                    translate([1.6,-5,0.65])  cube([4,15,0.5]);
                    translate([-5.6,-7.6,0.35])  cube([15,4,0.75]);
                    translate([-5.6,-0.4,0.35])  cube([15,4,0.75]);           
                }

                translate([67,88.8,20]) rotate([0,0,0]) cylinder(h=15,r=1.6,$fn=30); 
                translate([83,96,20]) rotate([0,0,0]) cylinder(h=15,r=1.6,$fn=30);
                translate([60,92,28]) rotate([0,0,0]) cube([30,13,14]);  
                translate([60,80,35]) rotate([0,0,0]) cube([30,13,14]);
                translate([72.5,80,30])rotate([0,0,0])  cube([5,13,14]);

                translate([62.5,82,28]) rotate([0,0,0]) cube([25,20,14]);
            }
            translate([55.5,91,27.85]) rotate([90,90,0])
                         cylinder(d = 7.5, h = 6);
            
        } else {
                translate([61,102,28]) rotate([35,90,0]) resize([9.75, 8, -1]) 
                        cylinder(h=35,r=3.3,$fn=30); 
                translate([67,88.8,20]) rotate([0,0,0]) cylinder(h=15,r=1.6,$fn=30); 
                translate([83,96,20]) rotate([0,0,0]) cylinder(h=15,r=1.6,$fn=30);
                translate([60,92,28]) rotate([0,0,0]) cube([30,13,14]);
                translate([62.5,82,28]) rotate([0,0,0]) cube([25,20,7]);
            // The reset button hole.
                translate([55.5,102,27.85]) rotate([90,90,0])
                         cylinder(d = 3, h = 50);
        }
    }
}

module board(cutout = true) {
    difference() {
        cube([x - wall * 2 - nozzle_diameter, y - wall * 2 - nozzle_diameter, z - bottom - top]);
        nib_corners(inside = cutout);

        // Corner support cutouts.
        cube([5, 5, z - top - bottom]);
        translate([x - 2 * wall - (nozzle_diameter) - 5, 0, 0])
            cube([5, 5, z - top - bottom]);
        translate([x - 2 * wall - (nozzle_diameter) - 5, y - 2 * wall - (nozzle_diameter) - 5, 0])
            cube([5, 5, z - top - bottom]);
        translate([0, y - 2 * wall - (nozzle_diameter) - 5 - arduino_padding[1][1] / 2, 0])
            cube([5 + arduino_padding[1][1] / 2, 
                      5 + arduino_padding[1][1] / 2, 
                      z - top - bottom]);
    }
    if (cutout) {
        // big gaping hole at the bottom.
        translate([arduino_padding[1][1] + arduino[1] + arduino_padding[1][0] - 5, 
                        5, 
                        -1])
            cube([20, arduino[0] + 10, arduino_padding[2][0] + arduino[2] + (arduino_padding[2][1] * 0.75) + 1]);
            // Protrusions for the cable escapements
            translate([-5, 15.5, 0]) cube([20, 9 - nozzle_diameter, 20]);
            translate([86 + wall, y - 2 * wall - nozzle_diameter, 0]) cube([30 - nozzle_diameter, wall + nozzle_diameter + 1, 15]);
    }
}

module standoff(height = bottom + arduino_padding[2][0]) {
    difference() {
        cylinder(d= 5.5 - nozzle_diameter, h = height);
        cylinder(d = 2.5 + nozzle_radius, h = height);
    }
}

module cap_screw(square = true) {
    cylinder(d = 5.5 + nozzle_diameter, h = cap_screw_head);
    if (square) {
        translate([-(5.5 + nozzle_diameter) / 2, -(5.5 + nozzle_diameter) / 2, 0])
            cube([(5.5 + nozzle_diameter) / 2, (5.5 + nozzle_diameter) / 2, cap_screw_head]);
    }
    translate([0, 0, cap_screw_head]) cylinder(d = 2.5 + nozzle_radius, h = z - 4 * (bottom + top));
}

module cap_screws(square = true) {
    translate([wall + 2.5, wall + 2.5, 0]) cap_screw(square);
// Traditional four-cornered box, this would be it.
//    translate([wall + 2.5, y - (wall + 2.5), 0]) rotate([0,0,270]) cap_screw(square);
// Since we're doing a strangely nibbed corner... 
    translate([wall + 2.5 + arduino_padding[1][1] / 2, y - (wall + 2.5) - arduino_padding[1][1] / 2, 0]) 
        cap_screw(false); 
    translate([x - (wall + 2.5), y - (wall + 2.5), 0]) rotate([0,0,180]) cap_screw(square);
    translate([x - (wall + 2.5), wall + 2.5, 0]) rotate([0,0,90]) cap_screw(square);
}
