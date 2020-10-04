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

//verticalHolePiece(height=4);
verticalHoleStartPiece();
//verticalHoleEndPiece();

module verticalHolePiece(height=4) {
   difference() {
      duploMarbleRunBase(2,2, height,true);
      cylinder(r=innerRadius, h=duploHeight * (height+1), center=true, $fn = quality * 2);
   }

}

module verticalHoleStartPiece(top=true) {
    
   difference() {
      duploMarbleRunBase(2,2,4,true);
      difference() {
        rotate([0, 90, 0]) translate([dr,-dr,0])rotate_extrude(convexity = 10, $fn = quality * 2) translate([dr, 0, 0]) circle(r = innerRadius, $fn = quality*2);
        translate([0, 0, -dr * 1.5]) duplo(2,6,2,false, true, true);
          
      }
      translate([0, 0, -dr - 7]) cylinder(r=innerRadius, h=duploHeight * 2, center=true, $fn = quality * 2);
   }
}

module verticalHoleEndPiece() {
   difference() {
      duploMarbleRunBase(2,2,4,true);
      difference() {
        rotate([0, 90, 0]) translate([-dr - 2,-dr,0])rotate_extrude(convexity = 10, $fn = quality * 2) translate([dr, 0, 0]) circle(r = innerRadius, $fn = quality*2);
        translate([0, 0, dr * 2 - 4]) duplo(2,6,2,false, true, true);
      }
      translate([0, 0, dr * 1.7])  cylinder(r=innerRadius, h=duploHeight * 2, center=true, $fn = quality * 2);
   }
}
