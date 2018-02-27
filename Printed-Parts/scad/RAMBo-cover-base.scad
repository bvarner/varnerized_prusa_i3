// PRUSA iteration3
// RAMBo base
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// Due to the thickness of a RAMPS stack, and the lack of space for a sandwiched in there.
// I wanted to extend the depth of the case by ~15mm.
// This means that you need to mount the thing offset further back from the frame, or else the X axis motor will ram into the case.

// Ramps Offsets For mounting compared to Rambo.
ramps_offset_y=15;
ramps_offset_x=19.7;

extruder_cable_offset=50; // extruder cable holder offset
heatbed_cable_offset=-40; // heatbed x offset

// Case extension.



// main body
module main_body(){
    // side panel
    cube( [ 118.5 , 92 , 2 ] );  

    // upper panel
    cube( [ 1.5 , 92 , 35 ] );  

    // rear panel
    translate( [ 0 , 90 , 0 ] ) cube( [ 105.5 , 2 , 35 ] ); 
    
    // heatbed ziptie reinforcement
    translate( [ 63+heatbed_cable_offset , 88.5 , 0.5 ] ) cube( [ 6.5 , 2 , 34.5 ] );   

    // upper panel frame reinforcement
    translate( [ 0 , 0 , 1 ] ) cube( [ 5.5 , 7 , 34 ] );  

    // side panel reinforcement
    translate( [ 0 , 0 , 1 ] ) cube( [ 9 , 92 , 3 ] );  
    translate( [ 98 , 0 , 0 ] ) cube( [ 9 , 92 , 4 ] ); 
    
difference()
    {
    // bottom side reinforcement    
    translate( [ 98 , 86 , 0 ] ) cube( [ 7.5 , 6 , 35 ] ); 
    translate( [ 96 , 79 , 0 ] ) rotate([0,0,45]) cube( [ 7.5 , 6 , 36 ] ); 
    }
    translate( [ 0 , 85 , 0 ] ) cube( [ 5.5 , 7 , 35 ] ); 

    // screw mounting block
    translate( [ 54 , 84 , 0 ] ) cube( [ 9.5 , 7 , 35 ] );  

    // frame side panel
    translate( [ 20 , 0 , 0 ] ) cube( [ 80 , 3 , 5 ] );  

    // RAMBo mounting holes

    translate( [ ramps_offset_x+82.55 , ramps_offset_y , 0 ] ) rotate([0,0,90]) cylinder( h = 4, r = 5.5, $fn=6); 
    translate( [ ramps_offset_x+82.55 , ramps_offset_y+48.5 , 0 ] ) rotate([0,0,90]) cylinder( h = 4, r = 5.5, $fn=6); 
    translate( [ ramps_offset_x+7.65 , ramps_offset_y , 0 ] ) cylinder( h = 4, r = 5.5, $fn=6); 
    translate( [ ramps_offset_x , ramps_offset_y+48.5 , 0 ] ) cylinder( h = 4, r = 5.5, $fn=6); 

    // corners reinforcement
    translate( [ 0 , 75 , 1 ] ) cube( [ 13 , 16 , 6 ] );  
    translate( [ 0 , 70.25 , 1 ] ) cube( [ 9 , 11 , 4 ] ); 
    translate( [ 0 , 7.75 , 1 ] ) cube( [ 9 , 11 , 4 ] ); 
    translate( [ 0 , 0 , 1 ] ) cube( [ 13 , 14 , 4 ] ); 

    // frame mounting screw blocks
    //upper
    translate( [ 1 , 0 , 0 ] ) cube( [ 28 , 4 , 10 ] );  
    translate( [ 18.45 , 0 , 0 ] ) cube( [ 3 , 4 , 5.5] ); 
    
    //lower
    translate( [ 98 , 0 , 0 ] ) cube( [ 20.5 , 4 , 10 ] ); 

    // heatbed filament holder body
    translate( [ 81.6+heatbed_cable_offset, 90.35 , 24 ] ) rotate([0,90,0]) cylinder( h = 18, r = 5, $fn=6); 

    // door closing corner
    translate( [ 102 , 88.5 , 35 ] ) cylinder( h = 3, r1=2.5, r2=1, $fn=30);   

    // doors pin upper
    translate( [ 2 , 85 , 31 ] ) cube( [ 6 , 7 , 4] ); 
    translate( [ 4 , 88.5 , 35 ] ) cylinder( h = 3, r1=2.5, r2=1, $fn=30);   

    // x-axis cables entry hole body
    translate( [ 89 , 2 , 0 ] ) cylinder( h = 5, r = 6, $fn=6);   
}

module ventilation_holes(start = 0, count = 12)
    {
     for ( i = [start : count] ){
         hull(){
              translate([30 + (i*5.5),10.5,-1]) cylinder( h = 10, r = 1.5, $fn=6);;
              translate([30 + (i*5.5),29.5,-1]) cylinder( h = 10, r = 1.5, $fn=6);;
         }
    }
}

module cutouts(){
    // side     
    translate( [ 16+ramps_offset_x , 13 , 1 ] ) cube( [ 58.65 , 68 , 3 ] );  

    // RAMBo M3 screws
    translate( [ ramps_offset_x+82.55 , ramps_offset_y , -1 ] ) cylinder( h = 10, r = 1.9, $fn=30);  
    translate( [ ramps_offset_x+82.55 , ramps_offset_y+48.5, -1 ] ) cylinder( h = 10, r = 1.9, $fn=30);  
    translate( [ ramps_offset_x+7.65 , ramps_offset_y , -1 ] ) cylinder( h = 10, r = 1.9, $fn=30);  
    translate( [ ramps_offset_x , ramps_offset_y+48.5 , -1 ] ) cylinder( h = 10, r = 1.9, $fn=30);     
    
    translate( [ ramps_offset_x+82.55, ramps_offset_y, 6 ] ) cylinder( h = 3, r1 = 1.9, r2=2.4, $fn=30);  
    translate( [ ramps_offset_x+82.55 , ramps_offset_y+48.5 , 6 ] ) cylinder( h = 3, r1 = 1.9, r2=2.4, $fn=30);  
    translate( [ ramps_offset_x+7.65 , ramps_offset_y , 6 ] ) cylinder( h = 3, r1 = 1.9, r2=2.4, $fn=30);  
    translate( [ ramps_offset_x , ramps_offset_y+48.5, 6 ] ) cylinder( h = 3, r1 = 1.9, r2=2.4, $fn=30);     

    translate( [ 2 , 2 , -1 ] )ventilation_holes(start = 1, count = 11);
    translate([2,52,0]) ventilation_holes(start = 1, count = 11);
    translate([2,27,0]) ventilation_holes();
    
    // frame mounting screws
    //upper    
    translate( [ 18.5, -2 , 15.6 ] ) rotate([0,45,0]) cube( [ 15 , 10 , 10] );     
    translate( [ 16.5 , 8 , 5 ] ) rotate([90,0,0]) cylinder( h = 10, r = 1.6, $fn=30);   
    translate( [ 16.5 , 9 , 5 ] ) rotate([90,0,0]) cylinder( h = 5, r = 3, $fn=30);   
    translate( [ 15.15 , -2 , 5 ] ) cube( [ 2.7 , 7 , 10] ); 
    translate( [ 15.1 , -2 , 7 ] ) rotate([0,5,0]) cube( [ 2.8 , 7 , 10] ); 
    translate( [ 15.1 , -2 , 7 ] ) rotate([0,-5,0]) cube( [ 2.8 , 7 , 10] ); 
    
    //lower
    translate( [ 110.5 , 9 , 5 ] ) rotate([90,0,0]) cylinder( h = 10, r = 1.6, $fn=30);   
    translate( [ 110.5 , 9 , 5 ] ) rotate([90,0,0]) cylinder( h = 5, r = 3, $fn=30);       
    translate( [ 118.5 , -2 , 6 ] ) rotate([0,-45,0]) cube( [ 5 , 15 , 15] ); 
    translate( [ 94.5 , -2 , 8.5 ] ) rotate([0,45,0]) cube( [ 5 , 8 , 15] ); 
    translate( [ 0 , -2 , -5 ] ) cube( [ 120 , 15 , 5] ); 
    translate( [ 109.15 , -2 , 5 ] ) cube( [ 2.7 , 15 , 10] ); 
    translate( [ 109.3 , -2 , 6.5 ] ) rotate([0,5,0]) cube( [ 2.5 , 15 , 10] ); 
    translate( [ 109.2 , -2 , 6.5 ] ) rotate([0,-5,0]) cube( [ 2.5 , 15 , 10] ); 

    // door closing screw
    translate( [ 58.5 , 88 , -1 ] ) cylinder( h = 43, r = 1.9, $fn=30);  


    // heatbed cable opening hole
    difference()
    {
    translate( [ 75.5+heatbed_cable_offset , 94 , 24 ] ) rotate([90,90,0]) cylinder( h = 5, r = 7, $fn=6); 
    translate( [ 71+heatbed_cable_offset , 80 , 13.5 ] ) cube( [ 8 , 15 , 5] ); 
    }
    translate( [ 73+heatbed_cable_offset , 80 , 20.5 ] ) cube( [ 5 , 15 , 15] ); 

    // heatbed cable ziptie holes
    translate( [ 64+heatbed_cable_offset , 87 , 30 ] ) cube( [ 4 , 10 , 2 ] );   
    translate( [ 64+heatbed_cable_offset , 87 , 16 ] ) cube( [ 4 , 10 , 2 ] );   


    // heatbed filament holder hole
    translate( [ 81+heatbed_cable_offset , 89 , 24 ] ) rotate([0,90,0]) cylinder( h = 15, r = 1.8, $fn=30);   
    translate( [ 81+heatbed_cable_offset , 89 , 24 ] ) rotate([0,90,0]) cylinder( h = 2, r = 2, r2=1.8, $fn=30);   
    translate( [ 70+heatbed_cable_offset , 92 , 15 ] ) cube( [ 30 , 10 , 15] ); 

    // Reset hole
    translate( [ 81, 87, 25.5 ] ) rotate([-90,0,0]) cylinder( h = 10, r = 2, $fn=30); 

    // nut traps HEX
    translate( [ ramps_offset_x+82.55 , ramps_offset_y, -1 ] ){
    cylinder( h = 3.5, r = 3.2, $fn=6);  
    rotate([0,0,0]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    rotate([0,0,60]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    rotate([0,0,120]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    }

    translate( [ ramps_offset_x+82.55 , ramps_offset_y+48.5 , -1 ] ){
    cylinder( h = 3.5, r = 3.2, $fn=6);  
    rotate([0,0,0]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    rotate([0,0,60]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    rotate([0,0,120]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    }

    translate( [ ramps_offset_x+7.65 , ramps_offset_y  , -1 ] ){
    cylinder( h = 3.5, r = 3.2, $fn=6);  
    rotate([0,0,0]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    rotate([0,0,60]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    rotate([0,0,120]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    }
    
    translate( [ ramps_offset_x , ramps_offset_y+48.5 , -1 ] ){
    cylinder( h = 3.5, r = 3.2, $fn=6);  
    rotate([0,0,0]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    rotate([0,0,60]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    rotate([0,0,120]) resize([0,2,0]) cylinder( h = 3.5, r = 3.5, $fn=6);  
    }

    translate( [ ramps_offset_x+82.55 , ramps_offset_y , -1 ] ) cylinder( h = 1.5, r1 = 5, r2=3.2, $fn=6);  
    translate( [ ramps_offset_x+82.55 , ramps_offset_y+48.5, -1 ] ) cylinder( h = 1.5, r1 = 5, r2=3.2, $fn=6);  
    translate( [ ramps_offset_x+7.65 , ramps_offset_y , -1 ] ) cylinder( h = 1.5, r1 = 5, r2=3.2, $fn=6);  
    translate( [ ramps_offset_x , ramps_offset_y+48.5 , -1 ] ) cylinder( h = 1.5, r1 = 5, r2=3.2, $fn=6);  
    translate( [ 58.5 , 88 , -1 ] ) cylinder( h = 4, r = 3.2, $fn=30);   

    // door closing corners
    translate( [ 8 , 80 , 28 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 10] ); 
    translate( [ 106 , 81 , 4 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 40] ); 

    // inner edges cutout
    translate( [ 54 , 79.5 , 2 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 50] ); 
    translate( [ 70 , 82.5 , 2 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 50] ); 
    translate( [ 6 , 80 , 7 ] ) rotate([0,0,45]) cube( [ 5 , 5 , 24] ); 
    translate( [ 5.5 , 4 , 7 ] ) rotate([0,0,45]) cube( [ 3 , 5 , 29] ); 

    // x axis cable hole
    translate( [ 89 , 2 , -1 ] ) cylinder( h = 10, r = 4, $fn=6);   
    translate( [ 80 , -5 , -1 ] ) cube( [ 15, 5, 10] ); 

    // large corner coutout
    translate( [ -27 , 80 , -54 ] ) rotate([50,0,45]) cube( [ 50, 50, 50] ); 
    translate( [ 137.5 , 60 , -10 ] ) rotate([0,0,45]) cube( [ 50, 50, 50] ); 
}


// extruder cable holder
module ext_cable_holder()
{
difference()
{
    // body
    union(){
        rotate([90,0,0]) translate([-8, 26, -28-extruder_cable_offset]) rotate([0,90,0]) cylinder( h = 4, r1 = 8, r2=11, $fn=6);    
        rotate([90,0,0]) translate([-4, 26, -28-extruder_cable_offset]) rotate([0,90,0]) cylinder( h = 4, r1 = 11, r2=11, $fn=6);    
        rotate([90,0,0]) translate( [ 1.5 , 26, -28-extruder_cable_offset ] ) rotate([0,90,0]) cylinder( h = 10, r1 = 13, r2=7.5, $fn=6);
        translate( [-4, 28+extruder_cable_offset, 16.5 ] ) rotate([0,45,0]) cube( [ 6 , 5.5 , 7 ] );          
    }
    
    // upper cut
    translate( [ -15 , 13+extruder_cable_offset , 15] ) cube( [ 15 , 15 , 25 ] );  
    // lower cut
    translate( [ 1.5 , 26+extruder_cable_offset , 10] ) cube( [ 15 , 15 , 26 ] );  
 
    // ziptie holder
    difference(){
        rotate([90,0,0]) translate([-4, 26, -28-extruder_cable_offset]) rotate([0,90,0]) cylinder( h = 3.5, r = 8.5,  $fn=30);    
        rotate([90,0,0]) translate([-5, 26, -28-extruder_cable_offset]) rotate([0,90,0]) cylinder( h = 5.5, r = 6.2,  $fn=30);    
        }
}
}


module rambo_cover()
{
    ext_cable_holder();   
 
   difference(){
    main_body();
    cutouts();
    }
}

difference(){
    union(){
        // extruder cable filament holder body
        translate( [ 4.5 , 25.5+extruder_cable_offset , 26 ] ) rotate([0,90,0]) cylinder( h = 7, r = 3.5, $fn=6);  
        translate( [ 4.5 , 22.5+extruder_cable_offset , 22.5] ) cube( [ 7 , 3 , 7 ] );   
        translate( [ 4.5 , 23.5+extruder_cable_offset , 20.8] ) cube( [ 7 , 2.5 , 7 ] );   
        translate( [ 4.5 , 24.7+extruder_cable_offset , 26 ] ) rotate([0,90,0]) cylinder( h = 7, r = 3, $fn=30);   
        }
    // extruder filament inner hole
    translate( [ -5 , 25+extruder_cable_offset , 26 ] ) rotate([0,90,0]) cylinder( h = 20, r = 1.75, $fn=30);   
    translate( [ 4, 25+extruder_cable_offset , 26 ] ) rotate([0,90,0]) cylinder( h =3, r1 = 1.9, r2=1.75, $fn=30);   
}


// doors pin upper
translate( [ 2 , 85 , 31 ] ) cube( [ 6 , 7 , 4] ); 
translate( [ 4 , 88.5 , 35 ] ) cylinder( h = 3, r1=2.5, r2=1, $fn=30);  


difference(){

rambo_cover();
    
    // upper extruder cable opening
    translate( [ -5 , 28+extruder_cable_offset , 26 ] ) rotate([0,90,-15]) cylinder( h = 20, r = 1.4, $fn=30);  
    
    // main hole
    translate( [ -10 , 28+extruder_cable_offset , 26 ] ) rotate([0,90,0]) cylinder( h = 24, r = 5.5, $fn=30);   
    // cable opening slot
    translate( [ -15 , 26.5+extruder_cable_offset , 30 ] ) cube( [ 30 , 3 , 10 ] ); 
    
    // flatten on door side 
    translate( [ -15 , 20+extruder_cable_offset, 35 ] ) cube( [ 30 , 20 , 20 ] );  

    // opening slot cuts
    translate( [ -1.5 , 26+extruder_cable_offset , 33] ) rotate([45,0,45]) cube( [ 3 , 3 , 3 ] );  
    translate( [ 1 , 28+extruder_cable_offset , 33] ) rotate([45,0,45]) cube( [ 3 , 3 , 3 ] );  

    // screw body edge
    translate( [ 65 ,74.2 , 2] ) rotate([0,0,45]) cube( [ 10 , 10 , 50 ] );     
    
    // lightening slots
    translate( [ 98 ,22 , 2] ) cube( [ 5 , 34 , 5 ] );   
    translate( [ 98 ,71 , 2] ) cube( [ 5 , 13 , 5 ] );     
    translate( [ 3 ,20 , 2] ) cube( [ 4.5, 49 , 5 ] );     

    // bottom holes print supports
    translate( [ ramps_offset_x+82.55 , ramps_offset_y  ,0] ){
    translate( [ 0 , 0 , 1.75 ] ) cube([3.2,5.6,2], center=true);
    translate( [ 0 , 0 , 2 ] ) cube([3.2,3.8,2], center=true);
    }
    
    translate( [ ramps_offset_x+82.55 , ramps_offset_y+48.5 ,0] ){
    translate( [ 0 , 0 , 1.75 ] ) cube([3.2,5.6,2], center=true);
    translate( [ 0 , 0 , 2 ] ) cube([3.2,3.8,2], center=true);
    }

    translate( [ ramps_offset_x+7.65 , ramps_offset_y ,0] ){
    translate( [ 0 , 0 , 1.75 ] ) cube([3.2,5.6,2], center=true);
    translate( [ 0 , 0 , 2 ] ) cube([3.2,3.8,2], center=true);
    }

    translate( [ ramps_offset_x , ramps_offset_y+48.5 ,0] ){
    translate( [ 0 , 0 , 1.75 ] ) cube([3.2,5.6,2], center=true);
    translate( [ 0 , 0 , 2 ] ) cube([3.2,3.8,2], center=true);
    }

    translate( [ 58.5 , 88 ,0] ){
       intersection(){cylinder(r=3.2, h=10, $fn=30);
    translate( [ 0 , 0 , 2.5 ] ) cube([3.8,8,2], center=true);}
    translate( [ 0 , 0 , 3 ] ) cube([3.8,3.8,2], center=true);
    }


}

