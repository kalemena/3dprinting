// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
// The duplo-marblerun is derived from https://www.thingiverse.com/thing:159219
include <duplo-block-lib.scad>
include <duplo-marblerun.scad>

$fn=80;

innerRadius=14*dr/16;
quality = 50;

bridge(8);
//duploMarbleRunBase(2,2,8,true);

module bridge(h=8) {
   union() {
       translate([1.5*dr,0,8*duploHeight/2]) scale([1.1,1,1]) straightPiece();
       translate([1.5*dr,0,32]) cube([2*dr+2,2*dr,7], center=true);
       translate([1.5*dr,0,h*duploHeight/2]) {
        translate([1.5*dr,0,0]) duploMarbleRunBase(1,2,h,true);
        translate([-1.5*dr,0,0]) duploMarbleRunBase(1,2,h,true);
        // cube([2*dr+2,2*dr,10], center=true);
        // duploMarbleRunBase(2,2,h,true);
       }
   }
}
