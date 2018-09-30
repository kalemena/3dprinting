
include <duplo-block-lib.scad>

// bearing 608zz
br = 11.15; // bearing radius with tolerance for insertion
bh = 7;     // bearing height
ir = 4.3;  // threaded rod radius + ample tolerance
t = 4; 
e = 0.02; 

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
    translate([0,0,9.6*2-bh]) cylinder(r=br+e, h=bh+e);
    //translate([0,0,5.6]) cylinder(r=4.3, h=bh+e);
    translate([0,0,11.3]) cylinder(h=2, r1=0, r2=br, center=true);
}