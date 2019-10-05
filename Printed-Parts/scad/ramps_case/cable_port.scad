// Parametric Cable Port & Clamp
// Inspired by the Prusa cable clips on the MK3, but better.

// cable cross-section, in mm. Use a single number for a round cable.
cable_cross_section = [11, 9];
entry_angle = 30;

champfer = 2;
clip_height = 15;

wall_thickness = 2;
inset = 2;

// to determine the outer diameter of the main cylinder....
// ((clip_height + champfer) * tan(entry_angle)) +
// cable_cross_section[0] * tan(90 - entry_angle)

cylinder(d = max(cable_cross_section), 
             h = 2 * (champfer + inset + wall_thickness + clip_height + champfer),
             center = true);
             
cable(cable_cross_section, entry_angle);

module cable(cable_cross_section, entry_angle) {
    rotate([0, entry_angle, 0])
//        resize([cable_cross_section[0], cable_cross_section[1], 0])
            cylinder(d = max(cable_cross_section),
                         h = 3 * (champfer + inset + wall_thickness + clip_height + champfer),
                         center = true);
}


    