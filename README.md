# Varnerized Prusa i3 3D Printer Clone

I recently got some hands-on time with a Prusa i3 MK2 (the office got one).
I've been keeping an eye on this space for a while now. The concept of additive manufacturing is appealing to me, but I also wanted a bit of 'hands-on' time with smaller devices to see if I could scale it up to shop-built CNC.

After playing with the Prusa at work, I found some guides online for building your own, inspired by their design.
Specifically, [Tom's Dolly Build](https://toms3d.org/2017/02/23/building-cheapest-possible-prusa-i3-mk2/) was highly inspiring.

I'm willing to sacrifice some asthetics for the sake of cost cutting, but I don't want to sacrifice much in the way of performance.

## Goal of the project.

To clone a Prusa i3 with very similar mechanics, using import parts.
My initial budget for the build is $225. I'm currently on track there.


The 'master' branch here will reflect the current (stable, functioning) state of the project, as is. If there's a functioning printer, you'll see the plans and what-not.
The 'development' branch will track be the next iteration of updates / upgrades. Anything else is likely to be a sandbox for testing things. ;-)


## Initial Design (v1.0.0) and trade-offs.

I'm planning to build a wooden frame, from the Prusa i3 MK3 frame plans, except instead of aluminum plate and 3030 extrusions, I'll be using wood.
I've got a 1kg spool of ABS that will be printed on a friends original Prusa MK2s.

For my initial design I'm trying to balance cost, performance, and print quality. In some cases my part selections lean toward cost, in others they lean toward print quality at increased cost. The original Prusa kits are outstanding (and costly) because they consistently lean to performance and quality -- you pay for that. I'm willing to have a slightly more ugly printer for a lower cost.

### Trade-offs compared to a Prusa MK2/s or MK3:

* Heat-Bed - I chose an MK3.
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
* Frame - I'm making mine out of wood.
    * Won't be as svelt as a Prusa from the side, and may warp / twist slightly with seasonal changes. I'll be using thing-laminations of quarter-sawn lumber or cabinet-grade plywood to minimize this.
    * Major reduction of cost here. An MK2 aluminum frame runs ~$70. Laser-cut acrylic and wood are cheaper, but less rigid, and won't be as nice as mine.
    * Basing off the MK3 frame (which uses 3030 extrusions rather than threaded rods) translates more easily to wood.
    * I have a pretty well equipped wood shop, with 40 year old tools that are accurate +- 0.254mm and within a half-degree of cross-cut. I have calipers. I'll be able to correct for skew. :-)

I'll reserve judgement on print-quality results until I have the thing assembled and working. :-)

