/* 
 * A Varnerized Arduino / RAMPS Case
 */
height = 145;
 wall_thickness = 1.25;

translate([wall_thickness + 1, 4, height - 125]) rotate([0, -90, 270]) translate([61, 48.5, 0])  import("RAMPS1_4.STL");

difference() {
    // main_body
    cube([70, 50, height]);
    
    // main hollow and rear cut.
    translate([wall_thickness, wall_thickness, wall_thickness]) 
        cube([70, 50 - 2 * wall_thickness, height - 2 * wall_thickness]);
    
    // bottom opening.
    translate([wall_thickness + 2, wall_thickness + 5, -wall_thickness])
        cube([70, 30, wall_thickness * 3]);
        
}