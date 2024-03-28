# Varnerized Prusa i3 3D Printer Clone

This is a project to produce a 3d printer based upon the (very excellent) work of Mr. Josef Prusa, and the 3d printing community at large.

After playing with an i3 MK2.5 my office at the time acquired I found some guides online for building your own printer inspired by the Prusa design.
Specifically, [Tom's Dolly Build](https://toms3d.org/2017/02/23/building-cheapest-possible-prusa-i3-mk2/) was highly inspiring.

I'm willing to sacrifice _some_ asthetics, a bit of performance, the 'ease' of pre-integration, and get an education for the sake of cost cutting.
As in the early heady days of the PC industry... building a 'clone' from imported components is cheaper than purchasing the fully assembled and configured machine.

## Goal of the project.

To clone a Prusa i3 with very similar mechanics, using import parts and cheaper, more-modular electronics.
My initial budget for the build is $225. With that budget, I produced a wooden framed i3 clone, using an Arduino & RAMPS board with A4988 stepper drivers, knockoff E3D V6 hotend, and an aluminum heated bed.

I have since upgraded some things considerably, in a price-conscious manner, and well behind the bleeding edge, so that I can source parts inexpensively.

This isn't just an attempt to build a clone and leave it alone. In keeping with the RepRap / Prusa mentality, my desire is to build a device that allows for replicating / designing / implementing more advanced subsequent generations.

## This Repository / Branch Strategy

The 'master' branch here will reflect the current (stable, functioning) state of the project - the machine I'm currently running, or the last state of the machine.
The 'development' branch will track be the next iteration of updates / upgrades.

# 1.3 - Volcano Hotend & Belt Tensioning
Over the years I've had problems with bearings coming loose from the x-axis ends. I held them in place with zip-ties for more than a year.
My pancake stepper with the skelestruder gave me phenomical prints, but I had many problems with stability of the hotend holding temp during high extrusion rates or aggressive part cooling fan use.

In order to print things faster (I'm sick of waiting four hours for a tiny part) and with thicker layers, I have upgraded to a Volcano knock-off hotend -- which the skelestruder supports beautifully.
I've also decided to print my entire hotend assembly in polycarbonate, as I was having multiple parts sag over time and when printing high-temp filaments (like PC or nylon).

I ended up having to upgrade to a slightly larger pancake motor, as I exceeded the torque of the tiny pancake before I exceeded the reasonable flow rate of a 0.6mm CHT volcano nozzle.

A 200g spool of PC is more than enough to print the entire extruder and omega several times over.

Credits to the folks who made these fantastic parts that I'm using:
[X-Axis](https://www.printables.com/model/394668-mk225s-x-axis-revision-with-belt-tensioner)
[Y-Axis Tensioner](https://www.printables.com/model/306303-y-axis-belt-tensioner-v2)

# 1.2 - Skelestruder.
Having some shore 95A flex filament to print, the MK3 extruder design is rubbish. I've had issues with part cooling, part visibility during print, z-axis adjustment, it's been a problem. Futhermore I get a lot of obvious print quality issues with linear advance and the direct drive extruder with 1/16th step division.
The [Skelestruder](https://www.thingiverse.com/thing:2845416) is designed to address all of that, and after having it for a few weeks, it was obvious it's a superior design.

Additionally, a friend of mine supplied me with a Prusa Mini+ filament sensor kit, which I've integrated into my build using 
this [skelestruder sensor cover](https://www.thingiverse.com/thing:4235461).


Initially I printed everything in PETG, without a silicone sock and insulation at the top of the heat block. This caused EcageS to melt a couple times, and deformed some other parts when I attempted to print Nylon at high-temperatures.
To combat this problem, I've reprinted some parts in Polycarbonate. I purchased a 200g trial spool for a reasonable fee.

* Printed Parts
    * Polycarbonate
        * SP_EcageS_r1.stl
        * SP_Omega_r2.stl
        * SP_Pinion16_r1.stl
        * SP_Pinion14_r1.stl
        * [SP_Xclamp_mk2.stl](https://www.thingiverse.com/thing:3699231)
    * PETG
        * SP_Carriage_r1.stl
        * SP_tail_b2.stl
        * SP_EcageB_r1.stl
        * SP_EcageF17_r1.stl
        * SP_Shroud_r1.stl
        * SP_Key_r1.stl
        * Inlet_ptfe_r1b.stl
        * SP_Spider17_r1.stl
        * SP_Wheel_r1.stl
        * SP_Tread56_r1.stl
        * SP_Prack_r1.stl
        * SP_Idler_r1.stl
        * SP_tensioner_b1.stl
        * SP_knob_b2.stl
        * SP_spacer_v1a4.stl
        * IR_Sensorcover_top.stl
        * IR_Sensorcover_outlet.stl
        * IR_Sensorcover_bottom.stl
        * IR_Sensor_Arm.stl
* Purchased Parts
    * [GT2 140-2GT-6](https://www.amazon.com/gp/product/B014QJBVOY/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)
    * [Polyimide (Kapton) tape](https://www.amazon.com/gp/product/B00W3FAFP0/ref=ppx_yo_dt_b_asin_title_o04_s00?ie=UTF8&psc=1)
    * [105zz bearings](https://www.amazon.com/gp/product/B00ZHSTKCE/ref=ppx_yo_dt_b_asin_title_o07_s00?ie=UTF8&psc=1)
    * [5mmx100mm shafts](https://www.amazon.com/gp/product/B01B27MJC6/ref=ppx_yo_dt_b_asin_title_o07_s01?ie=UTF8&psc=1) I cut and shaped these with an angle grinder.
    * [12v 5015 fans](https://www.amazon.com/gp/product/B07LF1V1P1/ref=ppx_yo_dt_b_asin_title_o07_s01?ie=UTF8&psc=1) My original cooling fan died.
    * [Prusa IR filament sensor](https://www.aliexpress.com/item/32976810546.html?spm=a2g0o.productlist.0.0.115d21ee6SdBZw&algo_pvid=dfe3353a-f8a1-4ab3-83c8-9e795aa067fe&algo_exp_id=dfe3353a-f8a1-4ab3-83c8-9e795aa067fe-0)
    * [Heatblock Top Insulation](https://www.amazon.com/gp/product/B075CST527/ref=ppx_yo_dt_b_asin_title_o08_s00?ie=UTF8&psc=1) I used this between the heatbreak and the heatblock.
    * [Heatblock Silicone Sock](https://www.amazon.com/gp/product/B07Q3KHL6R/ref=ppx_yo_dt_b_asin_title_o09_s00?ie=UTF8&psc=1) How did I go so many years without a silicone sock?

# 1.1.1 - Lack Table Enclosure.
Following the [prusaprinters blog post](https://blog.prusaprinters.org/cheap-simple-3d-printer-enclosure/) on building an inexpensive (hah!) enclosure for your printer I recently picked up a couple of Ikea LACK tables.
After getting local quotes for producing the 440x440 and 440x220 acrylic panels, I opted to buy a set from a vendor on Amazon who could beat the locally sourced prices.

* Printed Parts
    * PSU Shroud
        * Compatible with the Prusa Lack table mounting clip (mounting foot geometry is closer to the Prusa part)
        * Added Lack Table PSU retainer. Similar Style as the Prusa version.
        * Text rotates to the upside down orientation on the PSU Shroud if you're rendering the LACK table parts.
    * [Ikea LACK Enclosure Main Parts](https://www.thingiverse.com/thing:2864118)
    * [Frame brace replacing the PSU for the MK3](https://www.thingiverse.com/thing:2859884)
    * [60 degree heatbed cable cover for the MK3](https://www.thingiverse.com/thing:2890592)
    * [608 bearing wheels for the adjustable spool holder](https://www.thingiverse.com/thing:3791583)
    * [Prusa Enclosure Bottom Corner with more cable space](https://www.thingiverse.com/thing:3067172)
    * [IKEA Lack Table Stack Coupler](http://www.thingiverse.com/thing:3488697)
* Purchased Parts
    * #12 AWG Silicone wire. So much better to work with than THHN.
    * XT60H Connectors
    * misc. dupont connectors & hookup wire (from the scrap bin)
    * (3) IRLB3034 N-Channel Mosfets & 10k Ohm 0805 SMT Resistors.
    * 12v RGB LED 5050 Strip (I had leftovers from another home project)
* @Home Fabricated PCB For Controlling RGB LEDs
    * Check the LEDControl directory for full KiCAD project.
    * Perfect for home-based acid etching and SMT hand soldering.
    * I use the 'laser-printer hot-iron transfer' method, and it works quite well.

# 1.1.0 - More MK3 less, MK2.
Total upgrade cost was ~$75 in January 2018.

* Heat-Bed
    * I replaced my aluminum MK3 heat bed with a magnetic MK52, 12V heat bed.
    * It's not as 'flat' as the prusa originals.
    * Cost was ~$36, as opposed to the original one which was ~$8.
    * Spring steel sheet + PEI cost around another $25. At this time, I'd opt for the powder-coated textured spring steel instead.
* Extruder
    * Uses the BondTech style extruder pulleys
    * Improved part cooling
    * 5v Noctua Fan reduces ambient noise considerably
    * I did not add a filament sensor (yet) or a dust-buffer (yet).
* Electronics
    * After having beefed up the ampacity of the RAMPS 1.4a board, and replacing the heatbed mosfet, I decided to try a RAMPS 1.6 board.
    * Much better experience than the RAMPS 1.4a.
    * After 11 months of use, no over-heating issues. No fried mosfets, no fire risk. Much better electronics from that stand point.
    * Heat bed does heat slowly, a consequence of the mosfet choice on this board, from what I understand.
    * I've updated my firmware to Marlin 1.1.9, and "Varnerized" it to match the Prusa Home Screen Asthetic on the LCD.
    * Updated RAMBo cover a bit. I ended up reprinting in PETG and got much better results than with the original PLA. It also hasn't sagged and melted in my hot-box.
* Mechanics
    * Y-Axis bearing holders have been redone, and are now my own design that allows for slight play.
    * I think I've fixed the issues with the y-axis belt holder not contacting the limit switch properly.
    * Updates to the TR8_couplings have resulted in much better Z-axis stability.
    * heatbed cable cover -- based on using ring terminals and heavy gauge speaker wire -- is _very_ large compared to the MK3.

# 1.0.0 - Hybrid MK2s & MK3
The original starting point. 1 Spool of ABS, a few scraps of cabinet grade plywood, access to a working MK2, and about $165 in imported parts.

* Heat-Bed - I chose a 3mm thick aluminum MK3 (Ultimaker clone) 200x200mm.
    * This gives me a slightly smaller build area than an Original Prusa.
    * No 'fully-automatic' skew compensation.
        * The aluminum bed of the MK3 will still work for automatic z-layer leveling.
        * Guided x-y skew measurement and compensation will be required.
    * I did pony up for a sheet of PEI plastic to cover the aluminum bed and improve adhesion. That was worth it.
* Steppers - I used an inexpensive 5-pack of 5mm output shaft steppers that put out ~40n-cm of torque.
    * My Z-Axis motors require couplings to the lead screws.
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

Prusa uses ABS, 20% infill, 3 perimeter (vertical) shells on a 0.4mm nozzle. The rest, well that's up to you. :-)
The three vertical shells are incredibly important. The extra ridigity / support is _really_ necessary, or you're likely to break idler parts.

### BOM

The basic BOM is:

| Part | Quantity |
| ---- | --------:| 
| [extruder-body.stl](Printed-Parts/stl/extruder-body.stl) | 1 |
| [extruder-cover.stl](Printed-Parts/stl/extruder-cover.stl) | 1 |
| [extruder-idler.stl](Printed-Parts/stl/extruder-idler.stl) | 1 |
| [fan_nozzle.stl](Printed-Parts/stl/fan_nozzle.stl) | 1 |
| [LCD-cover-Varnerized-MK3.stl](Printed-Parts/stl/LCD-cover-Varnerized-MK3.stl) | 1 |
| [lcd-supports.stl](Printed-Parts/stl/lcd-supports.stl) | 1 |
| [lcd-knob.stl](Printed-Parts/stl/lcd-knob.stl) | 1 |
| [x-carriage.stl](Printed-Parts/stl/x-carriage.stl) | 1 |
| [x-end-idler.stl](Printed-Parts/stl/x-end-idler.stl) | 1 |
| [x-end-motor.stl](Printed-Parts/stl/x-end-motor.stl) | 1 |
| [y-belt-holder.stl](Printed-Parts/stl/y-belt-holder.stl) | 1 |
| [y-belt-idler.stl](Printed-Parts/stl/y-belt-idler.stl) | 1 |
| [y-holder.stl](Printed-Parts/stl/y-holder.stl) | 4 |
| [y-motor-holder.stl](Printed-Parts/stl/y-motor-holder.stl) | 1 |
| [z-axis-bottom.stl](Printed-Parts/stl/z-axis-bottom.stl) | 1 |
| [z-axis-top.stl](Printed-Parts/stl/z-axis-top.stl) | 1 |

Optionally, I highly recommend you print the spool holder, RAMPS (Rambo) case, psu shroud, etc. or: model your own.

