
include <duplo-block-lib.scad>

// bearing 608zz
br = 11.15; // bearing radius with tolerance for insertion
bh = 7;     // bearing height
ir = 4.3;  // threaded rod radius + ample tolerance
t = 4; 
e = 0.02; 

slotZ=-0.1;
holeZ=2;
screwD=5.2; // 6mm (+0.2) or 5mm (+0.2)

quality = 50;

duploBearing();
duploPropelers(topHoles=false, bottomSlots=false, nbPropelers=4);

module duploPropelers(topHoles=true, bottomSlots=true, nbPropelers=3) {
  translate([0,0,21]) {
    difference() {
      union() {
        for(rot=[1:nbPropelers]) {
          rotate([0,0,360 - rot * 360/nbPropelers])
          hull() {
            translate([0,0,-0.5]) cylinder(h=2.5, r=ir, $fn = quality*2);
            translate([90,0,0]) cylinder(h=2, r=10, $fn = quality*2);
          }
          if(bottomSlots == true) {
            rotate([0,0,360 - rot * 360/nbPropelers]) translate([8,0,slotZ]) sphere(r=1, $fn = quality*2);
          }
        }
        
        cylinder(h=2, r=br, $fn = quality*2);
        translate([0,0,-2]) cylinder(r=t-e*5, h=bh+1, center=true, $fn = quality*2);
        translate([0,0,-1]) cylinder(r=t+1-e*5, h=1, center=true, $fn = quality*2);
      }
      
      cylinder(r=screwD/2, h=bh*2, center=true, $fn = quality*2);
      
      if(topHoles == true) {
        for(rot=[1:nbPropelers]) {
          rotate([0,0,360 - rot * 360/nbPropelers]) translate([8,0,holeZ]) sphere(r=1.5, $fn = quality*2);
        }
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