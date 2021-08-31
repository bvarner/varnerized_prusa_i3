import("../stl/prusa-y-belt-holder.stl");

translate([24, 0, -9]) {
    cube([18.5, 6, 12]);
    translate([10, 0, 0]) {
        cube([8.5, 11, 12]);
    }
}
