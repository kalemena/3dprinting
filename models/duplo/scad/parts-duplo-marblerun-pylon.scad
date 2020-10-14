// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
// The duplo-marblerun is derived from https://www.thingiverse.com/thing:159219
include <duplo-block-lib.scad>
include <duplo-marblerun.scad>

$fn=80;

innerRadius=14*dr/16;
quality = 50;

pylon(8);

module pylon(h=8) {
    difference() {
        union() {
            duploMarbleRunBase(2,2,1,false);
            
            hull() {
                translate([0,0,duploHeight-5]) cube([1.97*dr,1.97*dr,0.5],center=true);
                translate([0,0,duploHeight]) cylinder(d=2*dr,h=duploHeight, center=true);
            }
            
            translate([0,0,duploHeight*2]) cylinder(d1=dr*2, d2=15, h=duploHeight,center=true);
            translate([0,0,duploHeight*5]) cylinder(d=15, h=duploHeight*6,center=true);
            translate([0,0,duploHeight*8]) cylinder(d1=15, d2=dr*2, h=duploHeight,center=true);
            
            translate([0,0,duploHeight*8])
            hull() {
                translate([0,0,duploHeight]) cylinder(d=2*dr,h=duploHeight, center=true);
                translate([0,0,duploHeight*2]) cube([1.97*dr,1.97*dr,duploHeight],center=true);
            }
            
            translate([0,0,duploHeight*10]) duploMarbleRunBase(2,2,1,true, false);
        }
        
        translate([0,0,duploHeight*6]) cylinder(d=10,h=duploHeight*12,center=true);
    }
}