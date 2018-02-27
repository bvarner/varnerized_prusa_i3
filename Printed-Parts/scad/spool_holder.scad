use <threads.scad>;

module bolt() {
    render() metric_thread(diameter = 8.1, pitch = 2, length = 34, internal = true);
}

difference() {
    union() {
        difference() {
            union() {
                // Upper horizontal member.
                translate([0, 57.5, 0]) cube([155, 25, 30]);
                
                // spacers.
                translate([20, 70, -0.5]) cylinder(r = 5.5, h = 31);
                translate([140, 70, -0.5]) cylinder(r = 5.5, h = 31);
                
                // Lower triangle portion.
                difference() {
                    cube([150, 60, 30]);
                    translate([30, 0, -5]) rotate([0, 0, -60]) cube([200, 200, 40]);
                }
            }
            
            // Holes for the threaded rods.
            translate([20, 70, -2.5]) bolt();
            translate([140, 70, -2.5]) bolt();
            
            // Champfer the nut holes. Or else.
            translate([20, 70, -0.75]) cylinder(r1 = 4.75, r2 = 3, h = 1, $fn = 360);
            translate([140, 70, -0.75]) cylinder(r1 = 4.75, r2 = 3, h = 1, $fn = 360);
            translate([20, 70, 29.75]) cylinder(r1 = 3, r2 = 4.75, h = 1, $fn = 360);
            translate([140, 70, 29.75]) cylinder(r1 = 3, r2 = 4.75, h = 1, $fn = 360);
        }
            
        // Add back in a portion for where we won't want threaded holes.
        translate([0, 60, 8]) cube([150, 20, 14]);
    }
            
    // Cutout for the frame.
    translate([5, 5, -5]) cube([18, 40, 40]);
    intersection() {
        translate([0, 10, -5]) rotate([0, 0, -20]) cube([18, 50, 40]);
        translate([23, 25, -5]) cylinder(r = 20, h = 40, $fn = 360);
    }
    translate([0, 0, -5]) cube([18, 40, 40]);
    
    // Cutouts for material savings.
    translate([77.5, 133, -5]) rotate([0, 0, 30]) cylinder(r = 75, h = 40, $fn = 6);
    translate([55, 44, -5]) rotate([0, 0, 30]) cylinder(r = 12.5, h = 40, $fn = 6);
    translate([80, 40, 0]) rotate([0, 0, 30]) difference() {
        cube([60, 7.5, 40]);
        translate([0, 0, -1]) rotate([0, 0, 60]) cube([20, 20, 44]);
        translate([50, 0, -1]) rotate([0, 0, -30]) cube([20, 20, 44]);
    }

    // Pretty Corners
    translate([0, 70, -5]) rotate([0, 0, 60]) cube([40, 40, 40]);
    translate([155, 70, -5]) rotate([0, 0, 30]) cube([40, 40, 40]);
    translate([155, 70, -5]) rotate([0, 0, -120]) cube([40, 40, 40]);
    translate([18, 3.5, -5]) rotate([0, 0, 45]) cube([5, 5, 40]);
    translate([1.75, 35, -5]) rotate([0, 0, 60]) cube([5, 5, 40]);
    
    // Cut the part in half. requires post-processing of the exported STL to split the parts for printing. Use Slic3r, and split the part. :-)
    translate([-5, -5, 10]) cube([160, 100, 10]);
}






