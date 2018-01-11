# Varnerized Prusa i3 3D Printer Clone

This is a project to produce a 3d printer based upon the (very excellent) work of Mr. Prusa. I'm a huge fan.

I recently got some hands-on time with a Prusa i3 MK2 (the office got one).
After playing with the Prusa at work, I found some guides online for building your own, inspired by their design.
Specifically, [Tom's Dolly Build](https://toms3d.org/2017/02/23/building-cheapest-possible-prusa-i3-mk2/) was highly inspiring.

I'm willing to sacrifice _some_ asthetics, a bit of performance, and the 'ease' of pre-integration for the sake of cost cutting.
As in the early heady days of the PC industry... building a 'clone' from imported components is cheaper than purchasing the fully assembled and configured machine.

## Goal of the project.

To clone a Prusa i3 with very similar mechanics, using import parts and more-modular electronics.
My initial budget for the build is $225.

This isn't just an attempt to build a clone and leave it alone. In keeping with the RepRap / Prusa mentality, my desire is to build a device that allows for replicating / designing / implementing more advanced subsequent generations.

## This Repository / Branch Strategy

The 'master' branch here will reflect the current (stable, functioning) state of the project, if there is one, as is.
The 'development' branch will track be the next iteration of updates / upgrades. 
Other branches are likely to be sandboxes for testing things. ;-)

# 0.1.0 - Hybrid MK2s & MK3

* Heat-Bed - I chose a 3mm thick aluminum MK3 (Ultimaker clone).
    * This gives me a slightly smaller build area than an Original Prusa.
    * No 'fully-automatic' mesh leveling and skew compensation.
        * The aluminum bed of the MK3 will still work for automatic z-layer leveling.
        * Guided x-y skew measurement and compensation will be required.
    * I did pony up for a sheet of PEI plastic to cover the aluminum bed and improve adhesion.
* Steppers - I used an inexpensive 5-pack of 5mm output shaft steppers that put out ~40n-cm of torque.
    * My Z-Axis motors require flex-couplings to the lead screws.
    * I did pony up for T8 ACME lead screws and nuts for the Z-axis. The small cost should be worth the improved ridgidity and accuracy.
* Electronics - Arduino Mega 2650 + RAMPS 1.4a
    * Won't be nearly as nicely packaged as a mini-rambo... until I print my own case design to make it not ugly.
    * Will have to custom-compile firmware from the Marlin project.
    * More flexibility in the long-run with regards to expansion and addition of other sensors.
    * I used a 30Amp, 12v power supply (360 Watt). I was able to get this for $20 from Amazon, which was only slightly more expensive than the best priced 240Watt imported supply. Low quantities of heavy items are expensive to ship.
    * I'm going to just bypass the poly-fuses on the RAMPS board and add properly sized inline fuses. Perhaps someday I'll replace the RAMPs board. Perhaps Not.
* Frame - I'm making mine out of wood.
    * Won't be as svelt as a Prusa from the side, and may warp / twist slightly with seasonal changes. I'll be using thing-laminations of quarter-sawn lumber or cabinet-grade plywood to minimize this.
    * Major reduction of cost here. An MK2 aluminum frame runs ~$70. Laser-cut acrylic and wood are cheaper, but less rigid, and won't be as nice as mine.
    * Basing off the MK3 frame (which uses 3030 extrusions rather than threaded rods) translates more easily to wood.
    * I have a pretty well equipped wood shop, with 40 year old tools that are accurate +- 0.254mm and within a half-degree of cross-cut. I have calipers. I'll be able to correct for skew. :-)

## Printed Parts Lineage / Changes

* Y-Axis (under heatbed carriage) -- Mostly from the MK3. The necessity of an endstop swtich necessitates some changes to the Y-Motor mount. I am expecting to need to modify the rear frame DXF to reflect modifications / changes. I may not have room for the limit switch microswitch. Also, the belt holder for y-frame may need modification.
* X-Axis (gantry above heatbed) -- Completely from the MK2s.
* Z-Axis -- Mostly from the MK3. The T8 leadscrew will likely extend beyond the upper limit of the MK3 frames upper z-ends. I modified the MK3 parts to 'open' the top of the leadscrew holes and the rod holding hole -- ala a MK2/s. I figure this will be easier than cutting a T8 rod.
* Extruder -- Completely from the MK2s. I may look into the cogged dual-feed of the MK3 at some point, but until the Prusa fillament sensor board clones start to appear, there's really no reason to do that.
    * I will need to wait until my induction probe arrives to make sure it's the same physical size as the PINDA and avoid re-printing.
    * Thankfully for the Z-axis I don't need an end-stop limit switch.
* LCD -- Assuming my LCD fits the frame properly, I'll use the Prusa design...

### Print Settings

Prusa uses ABS, 20% infill, 3 perimeter shells. The rest, well that's up to you. :-)


### BOM

| Part | Quantity |
| ---- | --------:| 
| [extruder-body.stl](Printed-Parts/stl/extruder-body.stl) | 1 |
| [extruder-cover.stl](Printed-Parts/stl/extruder-cover.stl) | 1 |
| [extruder-idler.stl](Printed-Parts/stl/extruder-idler.stl) | 1 |
| [fan_nozzle.stl](Printed-Parts/stl/fan_nozzle.stl) | 1 |
| [LCD-cover-Varnerized-MK3.stl](Printed-Parts/stl/LCD-cover-Varnerized-MK3.stl) | 1 |
| [lcd-supports.stl](Printed-Parts/stl/lcd-supports.stl) | 1 |
| [x-carriage.stl](Printed-Parts/stl/x-carriage.stl) | 1 |
| [x-end-idler.stl](Printed-Parts/stl/x-end-idler.stl) | 1 |
| [x-end-motor.stl](Printed-Parts/stl/x-end-motor.stl) | 1 |
| [y-belt-holder.stl](Printed-Parts/stl/y-belt-holder.stl) | 1 |
| [y-belt-idler.stl](Printed-Parts/stl/y-belt-idler.stl) | 1 |
| [y-holder.stl](Printed-Parts/stl/y-holder.stl) | 4 |
| [y-motor-holder.stl](Printed-Parts/stl/y-motor-holder.stl) | 1 |
| [z-axis-bottom.stl](Printed-Parts/stl/z-axis-bottom.stl) | 1 |
| [z-axis-top.stl](Printed-Parts/stl/z-axis-top.stl) | 1 |



