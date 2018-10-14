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

zigZagLongRampPiece();

module zigZagLongRampPiece() {
   angle = atan(0.25*duploHeight/duploRaster);
   vscale = cos(angle);//0.9578; // cos(angle);

   translate([dr,1.5 * dr + 3,dr -11]) rotate([90+angle, -angle, 30]) cube([dr+15, 8, 3], center=true);
   translate([-dr - 1, 0 ,dr -15]) rotate([90, -angle, 90+60]) cube([dr+15, 8, 3], center=true);
   translate([dr, -dr * 1.7 ,-4]) rotate([90+angle, -angle, 30]) cube([dr+15, 8, 3], center=true);
   difference() {
      duploMarbleRunBase(4,6,4,false);      
      union() {

        //translate([0, -6*duploHeight-.8, 0.6 ]) rotate([90 + angle - 5,0,0])linear_extrude(height = 17, center = true, scale=[0.1,1], $fn=100, slices=30)  scale([3,1,1]) square([innerRadius + 5, innerRadius], center=true);


         //translate([0, -6*duploHeight - 3, 5 ]) rotate([90 + angle,0,0])linear_extrude(height = 2*dr, center = true, scale=[1/3,1], $fn=100, slices=30)  scale([2,1,1]) circle(d=1.5*dr);
         translate([0,-3, 4*duploHeight - dr/2 - 0.8])  rotate([90+angle,0,0])
            translate([0, 0, 0]) cube( [duploRaster*3.5 + 4,duploRaster*4 + 0.5 ,duploRaster*5.5 + 3 ] , center=true);
         translate([dr,0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  translate([0, 0, -50]) cylinder( duploRaster*3, innerRadius, innerRadius,, center=true, $fn = quality*2 );     

         translate([-dr, 0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  translate([0, 0, 50]) cylinder( duploRaster*3, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,4*dr+0, 2*duploHeight]) rotate([90+angle,0,0])
                  translate([0, 0, -10]) cube( [duploRaster*6,duploRaster*4,duploRaster*10] );       
      }
   }
}
