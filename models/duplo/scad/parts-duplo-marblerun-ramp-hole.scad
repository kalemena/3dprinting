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

rampHolePiece();

module rampHolePiece() {
   angle = atan(0.5*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);
   difference() {
      duploMarbleRunBase(2,2,5,true);      
      union() {
         translate([0,dr+1, duploHeight/2+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  cylinder( duploRaster*6, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         //translate([-2*dr,2*dr+0, 1.5*duploHeight+0]) rotate([90+angle,0,0])
                  //cube( [duploRaster*4,duploRaster*4,duploRaster*4] );       
      }
   }
}



