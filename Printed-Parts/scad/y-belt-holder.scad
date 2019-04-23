// PRUSA iteration4
// Y belt holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// Measured distance between my limit swtich mount and the carriage when the bearing "bottomed out" against the back.
y_endstop_compensation = 18.5;

module y_belt_holder()
{

    difference()
    {
        // base block
        union()
        {
            translate([-7,-24 - y_endstop_compensation,44.5]) cube([14,48 + y_endstop_compensation,8]);
            translate([-5,-15,29]) cube([12,30,17]);
            if (y_endstop_compensation > 0) {
                translate([-5, -24 - y_endstop_compensation, 41]) cube([12, y_endstop_compensation, 4.5]);
            }
        }

        // belt entry 
        translate([-7.5,-16,39.9]) rotate([0,45,0]) cube([3,32,3]);
        translate([-7.5,-16,34.9]) rotate([0,45,0]) cube([3,32,3]);
        
        // lower belt slot
        translate([-8.5,-16,34.2]) cube([11.5,32,0.75]);
        translate([-8.5,-16,35.4]) rotate([0,5,0]) cube([11.5,32,0.2]);
        translate([-8.5,-16,33.6]) rotate([0,-5,0]) cube([11.5,32,0.2]);
        for (_step =[-16:2:16])
        {
            translate([-8.5,_step,33]) cube([11.5,1,1.5]);
        }
        
        // upper belt slot
        translate([-8.5,-16,39.2]) cube([11.5,32,0.75]);
        translate([-8.5,-16,40.4]) rotate([0,5,0]) cube([11.5,32,0.2]);
        translate([-8.5,-16,38.6]) rotate([0,-5,0]) cube([11.5,32,0.2]);
        for (_step =[-17:2:16])
        {
            translate([-8.5,_step,38.2]) cube([11.5,1,1.5]);
        }
        
        // nice edges
        translate([-8,-20,21.8]) rotate([45,0,0]) cube([16,10,10]);
        translate([-8,20,21.8]) rotate([45,0,0]) cube([16,10,10]);

        if (y_endstop_compensation > 0) {
            translate([-8,-30 - y_endstop_compensation,34]) rotate([45,0,0]) cube([16,10,10]);
            translate([-8,-30 - y_endstop_compensation,37]) rotate([45,0,0]) cube([3,10,10]);
        } else {
            translate([-8,-30 - y_endstop_compensation,37]) rotate([45,0,0]) cube([16,10,10]);
        }
        translate([-8,30,37]) rotate([45,0,0]) cube([16,10,10]);
        translate([-12.2,-30 - y_endstop_compensation,44.4]) rotate([0,45,0]) cube([5,60 + y_endstop_compensation,5]);
        
        // mounting screw holes
        translate([0,-19.50,40]) cylinder( h=30, r=1.65, $fn=30 );
        translate([0,19.50,40]) cylinder( h=30, r=1.65, $fn=30 );
        translate([0,-19.25,40]) cylinder( h=30, r=1.65, $fn=30 );
        translate([0,19.25,40]) cylinder( h=30, r=1.65, $fn=30 );
        translate([0,-19.0,40]) cylinder( h=30, r=1.65, $fn=30 );
        translate([0,19.0,40]) cylinder( h=30, r=1.65, $fn=30 );
        
        translate([0,-19.5,43.5]) cylinder( h=7, r=3.1, $fn=30 );
        translate([0,19.5,43.5]) cylinder( h=7, r=3.1, $fn=30 );
        translate([0,-19.25,43.5]) cylinder( h=7, r=3.1, $fn=30 );
        translate([0,19.25,43.5]) cylinder( h=7, r=3.1, $fn=30 );
        translate([0,-19.0,43.5]) cylinder( h=7, r=3.1, $fn=30 );
        translate([0,19.0,43.5]) cylinder( h=7, r=3.1, $fn=30 );
        
        // If there's an endstop switch, we need to make sure we have clearance for the motor mount but contact with the switch, since we can't 'stall' against it.
        // Also, this is with a break-away tab, so that we can print with bridging, and it'll work without support.
        if (y_endstop_compensation > 0) {
            translate([4.5, -24 - y_endstop_compensation, 40]) {
                // 3 segments with 0.4 mm dividers and an initial 0.4mm offset
                segment = (y_endstop_compensation - (0.4 * 3)) / 3;
                for (f = [0.4 : segment + 0.4 : y_endstop_compensation]) {
                    translate([0, f, 0]) 
                        cube([3, segment, 20]);
                }
            }
        }
    }
}

difference()
{
    translate([-40,0,7]) rotate([0,90,0]) 
    y_belt_holder();
    //version   
    translate([8.5,3.5,0.5]) rotate([0,180,90]) linear_extrude(height = 0.6) 
    { text("R1.5",font = "helvetica:style=Bold", size=4, center=true); }
}
    
