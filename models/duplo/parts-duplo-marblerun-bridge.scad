// Duplo-compatible marble run extended pieces (C) by Keisuke Oohashi 2017
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.
// 

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
// The duplo-marblerun is derived from https://www.thingiverse.com/thing:159219
include <duplo-marblerun.scad>

innerRadius=14*dr/16;
quality = 50;

bridge(4);

module bridge(h=6) {
   union() {
        translate([1.5*dr,0,0]) duploMarbleRunBase(1,2,h,true);
        translate([-1.5*dr,0,0]) duploMarbleRunBase(1,2,h,true);
        cube([2*dr+2,2*dr,10], center=true);
        // duploMarbleRunBase(2,2,h,true);
   }
}

