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

//translate([0,0,duploHeight*4 - 3]) rotate([($t + 1)  * 90, 0, 0]) windmill(r=120, screwHall=false, guard=true, windmillOffset=8);
translate([0,0,duploHeight*4 - 3]) rotate([($t + 1)  * 90, 0, 0]) windmill(r=60, screwHall=true, guard=false, windmillOffset=0);
windMillRamp();
//windMillBase();

module windmill(r=120, screwHall=true, guard=false, millOffset=0) {
    difference() {
        union() {

            for (r=[0:r:360]) {
                rotate([r,0,0]) translate([0, 0, duploHeight*1.5]) cube([1.5*innerRadius - 1, 3, duploHeight * 3 + millOffset ], center=true);
            }
            difference() {
                rotate([0,90,0]) cylinder( r=duploHeight, h=innerRadius*1.5, $fn=quality , center=true);        
                rotate([0,90,0]) cylinder( r=duploHeight - 3, h=innerRadius*2, $fn=quality , center=true);        

            }

            if(screwHall) {
                rotate([0,90,0]) cylinder( r=5, h=innerRadius*1.5, $fn=quality , center=true);        
            } else {
                rotate([0,90,0]) cylinder( r=1.5, h=innerRadius*2.5 + 1, $fn=quality , center=true);
            }
            
            if (guard) {
                for (i=[1:-2:-1]) {
                    translate([i * innerRadius*1.5/2,0,0])rotate([0, 90, 0])cylinder(r=duploHeight + 5, h=1, $fn=quality, center=true);
                }
            }
        }
        if(screwHall) {
            rotate([0,90,0]) cylinder( r=2, h=innerRadius*2.5, $fn=quality , center=true);
        }
    }
}

module __windMillAxisHolder() {
    for(i=[1:-2:-1]) {
       rotate([0,0, 180 * (i + 1)]) translate([i * (dr+ 2), 0, duploHeight * 2 + 2]) {
           union(){
               translate([i * 3, 0, -duploHeight/2])
                 union(){
                   intersection() {
                     cube([5, 15, duploHeight * 3], center=true);
                     translate([0,0,-duploHeight * 1.5]) rotate([90, 90, 0]) linear_extrude(height=20, center=true)resize([duploHeight * 6, 15/2]) circle(d=duploHeight * 3, $fn=quality * 2);
                   }
                   translate([-i, 0, 0]) cube([2.5, 15, duploHeight * 3], center=true);
                 }
               difference() {
                  cube([6, 15, duploHeight * 4], center=true);           
                  
                  translate([i * 3, 0, -duploHeight/2])cube([5, 15, duploHeight * 3], center=true);

                  translate([0,0, duploHeight*1.5]) rotate([0,90,0]) cylinder( r=2, h=innerRadius, $fn=quality , center=true);
                  if (i == 1) {
                      translate([0,0,duploHeight*2]) cube([7, 4, duploHeight], center=true);
                  }
               }
           }
       }
   }   
}

module windMillBase() {
   angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);
   __millAxisHolder();       
   duploMarbleRunBase(4,2,1,false);      
}

module windMillRamp() {
   angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);
   __windMillAxisHolder();
       
   difference() {
      duploMarbleRunBase(4,4,4,false);      
      union() {
         translate([0,0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  cylinder( duploRaster*7, innerRadius, innerRadius, center=true, $fn = quality*2 );     
         translate([-2*dr,4*dr+0, 3*duploHeight+0]) rotate([90+angle,0,0])
                  cube( [duploRaster*4,duploRaster*4,duploRaster*8] );       
      }
   }

}

