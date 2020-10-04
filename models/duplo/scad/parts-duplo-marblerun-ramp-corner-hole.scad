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

rampCornerHolePiece();
//mirror([1,0,0]) rampCornerHolePiece();

module rampCornerHolePiece() {
   difference() {
      duploMarbleRunBase(2,2,6,true);
      translate([0,0, -duploHeight]) __cornerHoleRamp(20);      
   }
}

module __cornerHoleRamp(steps) {
   translate([-dr,-dr,2])
   for(i=[0:90/steps:90])
   {
      rotate([0,0,i]) translate([dr,0,i/90*2*duploHeight]) {
         // Using the rotate&shearing matrix produces nicer results with less steps.
         multmatrix(m = [ [1, 0, 0, 0], [0, 0, 1, -50/steps], [0, 1, 0.4, 0], [0, 0, 0, 1] ]) 
             union() {
                cylinder(h=50/steps,r=innerRadius, $fn=steps);
                if (i%2==1) {
                    translate([dr/2,-2,0]) cube([2*duploRaster,duploRaster,70/steps+ 1]);
                }
             }
      }
   }
}

