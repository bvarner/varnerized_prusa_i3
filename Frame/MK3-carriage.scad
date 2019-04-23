// Prusa i3 MK3V8B Carriage routing template.

/* --- Print Settings ---
    Rotate stl outputs in your slicing software to avoid support material.
    All layers: 0.25mm
    Infill: 10% honeycomb
    you may want to compensate for elephant foot.
*/
    
/* --- Use Notes ---
    Once all the parts are printed super-glue and clamp until cured.
    
    Use double-sided (carpet) tape to adhear the assembled frame to the wood when routing.
*/

// Select which sector to print ([1-2], or 0 for the full-size frame)
sector = 2;

// Final thickness of the frame.
// 6mm works, but recommend 8.
thickness = 8;

/* -- About the .dxf --
    I started with the .dxf obtained from the original Prusa github repo.
    I extracted the carriage bits from there using DraftSight.
*/
module layer() {
    
translate([-13, -10, 0])
linear_extrude(thickness, convexity = 10)
    import("MK3v8b-carriage.dxf", convexity = 10, $fn = 100);

}

if (sector == 1 || sector == 0) {
    union() {
        intersection() {
            layer();
            cube([115, 230, thickness / 2]);
        }
        intersection() {
            layer();
            translate([0, 0, thickness / 2])
                cube([150, 230, thickness / 2]);
        }
    }
}

if (sector == 2 || sector == 0) {
    union() {
        intersection() {
            layer();
            translate([115, 0, 0])
                cube([150, 230, thickness / 2]);
        }
        intersection() {
            layer();
            translate([150, 0, thickness / 2])
                cube([150, 230, thickness / 2]);
        }
    }
}
