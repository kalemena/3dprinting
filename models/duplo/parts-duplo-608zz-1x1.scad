
include <duplo-block-lib.scad>

// bearing 608zz
br = 11.15; // bearing radius with tolerance for insertion
bh = 7;     // bearing height
ir = 4.3;  // threaded rod radius + ample tolerance
t = 4; 
e = 0.02; 

slotZ=-0.1;
holeZ=1.5;

quality = 20;

duploBearing();
duploPropelers(topHoles=true, bottomSlots=true);
translate([0,0,2.7]) rotate([0,0,90]) duploPropelers(topHoles=false, bottomSlots=true);

module duploPropelers(topHoles=true, bottomSlots=true) {
  translate([0,0,20]) {
    difference() {
      union() {
        hull() {
          translate([0,0,-0.5]) cylinder(h=2.5, r=ir, $fn = quality*2);
          translate([90,0,0]) cylinder(h=2, r=10, $fn = quality*2);
        }
        hull() {
          translate([0,0,-0.5]) cylinder(h=2.5, r=ir, $fn = quality*2);
          translate([-90,0,0]) cylinder(h=2, r=10, $fn = quality*2);
        }
        cylinder(h=2, r=br, $fn = quality*2);
        
        if(bottomSlots == true) {
         translate([8,0,slotZ]) sphere(r=1, $fn = quality*2);
         translate([-8,0,slotZ]) sphere(r=1, $fn = quality*2);
         translate([0,8,slotZ]) sphere(r=1, $fn = quality*2);
         translate([0,-8,slotZ]) sphere(r=1, $fn = quality*2);
        }
      }
      cylinder(r=2.6, h=bh+e, center=true, $fn = quality*2);
      if(topHoles == true) {
          translate([8,0,holeZ]) sphere(r=1, $fn = quality*2);
          translate([-8,0,holeZ]) sphere(r=1, $fn = quality*2);
          translate([0,8,holeZ]) sphere(r=1, $fn = quality*2);
          translate([0,-8,holeZ]) sphere(r=1, $fn = quality*2);
      }      
    }
  }
}

module duploBearing() {
  difference() {
    // cube
    union() {        
        // bottom
        translate([0,0,duploHeight/2]) duplo(2,2,1,false,false);
        
        // top
        effWidth = 2 * duploRaster-gapBetweenBricks;
        translate([-effWidth/2,-effWidth/2,duploHeight]) cube([effWidth, effWidth, 9.6]);
    }
    
    // bearing hole
    translate([0,0,9.6*2-bh]) cylinder(r=br+e, h=bh+e, $fn = quality*2);
    //translate([0,0,5.6]) cylinder(r=4.3, h=bh+e);
    translate([0,0,11.3]) cylinder(h=2, r1=0, r2=br, center=true, $fn = quality*2);
  }
}