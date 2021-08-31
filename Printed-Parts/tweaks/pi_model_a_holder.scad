// TODO: M3 cap head screws?
translate([0, 20, 6.25]) 
translate([0, 71, 0]) rotate([0, -90, 180])
{
    translate([63 / 2, 71 / 2, 0]) import("piaplus-case-no-holes.stl");
    translate([0, 0, 17]) translate([63 / 2, 71 / 2, 4 / 2]) rotate([-90, 0, 90]) import("RPi_3A_Lid.stl");
}