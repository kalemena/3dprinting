// Duplo-compatible marble run pieces (C) by Daniel Schwering 2017
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
// The duplo-marblerun base is derived from https://www.thingiverse.com/thing:159219
include <duplo-block-lib.scad>
include <duplo-marblerun.scad>

quality = 50; // quality: low/fast (e.g. 10) for design, high/slow (e.g. 50) for final rendering 
wall=2;
inset=1;
//13 = 16-wall-inset
innerRadius=13*dr/16;
outerRadius=15*dr/16;
center=innerRadius+6.25-duploHeight;

translate([0,80,6*duploHeight/2]) duplo(2,2,6,false,false);
cosinusSlopedRampPiece(3,4);

module cosinusSlopedRampPiece(height=4, length=4)
{
    translate([0,0,duploHeight])
    union(){
        cosinusSlopedRamp(quality,height, length);      
        halfpipe();
        translate([0,(length+2)*dr,height*duploHeight*2])
            scale([1,2,1]) halfpipe();
        translate([0,(length+1)*dr,height*duploHeight*2])
            difference(){
                duplo(2,2,2,false,false);
                translate([0,2+dr,0])scale([1,2,1])pipe();
            }
        difference() {
            duplo(2,2,2,false,false);
            union(){
                cosinusSlopedFull(quality,height, length);
                translate([0,1,0])pipe();
               }
           }
    }
}

// internal
module cosinusSlopedRamp(steps, height, length) // nr of steps: e.g. coarse=10, fine=90
{
   translate([0,0,(1+height)*duploHeight-inset])
    difference(){
   for(i=[0:180/steps:180])
   {
      translate([0,+i/180*dr*length,-cos(i)*duploHeight*height]) 
      multmatrix(m = [[1, 0, 0, 0], [0, 1, 0, 0], [0, sin(i)*0.5*height, 1, 0], [0, 0, 0, 1]]) 
       union(){
         translate([-dr,0,-1]) cube([2*dr,(length+0.1)*dr/steps,2]);
         rotate([-90,0,0]) cylinder(h=(length+0.1)*dr/steps,r=innerRadius+2, $fn=steps);
       }
   }
   translate([0,-0.005,0]) scale([1,1.01,1])
   for(i=[0:180/steps:180])
   {
      translate([0,+i/180*dr*length,-cos(i)*duploHeight*height+1]) 
      multmatrix(m = [[1, 0, 0, 0], [0, 1, 0, 0], [0, sin(i)*0.5*height, 1, 0], [0, 0, 0, 1]]) 
       union(){
         translate([-dr,0,0]) cube([2*dr,(length+0.1)*dr/steps,2*dr]);
         rotate([-90,0,0]) cylinder(h=(length+0.1)*dr/steps,r=innerRadius, $fn=steps);
       }
      
   }
   }
}

// internal
module cosinusSlopedFull(steps, height, length) // nr of steps: e.g. coarse=10, fine=90
{
   translate([0,-0.005,0]) scale([1,1.01,1])
   translate([0,0,(1+height)*duploHeight-inset])
   for(i=[0:180/steps:180])
   {
      translate([0,+i/180*dr*length,-cos(i)*duploHeight*height+2]) 
      multmatrix(m = [[1, 0, 0, 0], [0, 1, 0, 0], [0, sin(i)*0.5*height, 1, 0], [0, 0, 0, 1]]) 
         rotate([-90,0,0]) cylinder(h=(length+0.1)*dr/steps,r=innerRadius+2, $fn=steps);
   }
}

// internal
module halfpipe(steps){
    difference(){
        difference(){
            translate([0,0,center]) rotate([90,0,0]) cylinder(h=dr,r=outerRadius, $fn=steps);
            translate([0,dr/2,center]) rotate([90,0,0]) cylinder(h=2*dr,r=innerRadius,$fn=steps);
        }
        translate([-1.5*dr,-1.5*dr,duploHeight]) cube([3*dr,2*dr,2*dr]);
    }
}

// internal
module pipe(steps){
    translate([0,-1,center]) rotate([90,0,0]) cylinder(h=dr+1,r=outerRadius, $fn=steps);
}