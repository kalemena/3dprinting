// Duplo-compatible marble run pieces (C) by Joachim Eibl 2013
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.

// Version 2 (added longRampPiece and cosinusSlopedRampPiece)
// Turn, Half Ramp, Cones added by Thomas Rauscher

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
include <duplo-block-lib.scad>
include <duplo-marblerun.scad>

quality = 20; // quality: low/fast (e.g. 10) for design, high/slow (e.g. 50) for final rendering 
innerRadius=14*dr/16;

// wires
wireRadius=2;
wireTX=7;
wireTZ=-2;
clipTX=1.45;

//straightPieceWires(2);
ramp(2,4, true);
// wireClip();

module wireClip() {
 difference() {  
   union() {
     translate([wireTX+clipTX,-clipTX,0]) cylinder(4,r=wireRadius*1.2,$fn = quality*2);
     translate([-wireTX-clipTX,-clipTX,0]) cylinder(4,r=wireRadius*1.2,$fn = quality*2);
     translate([wireTX,0,0]) cylinder(4,r=wireRadius*1.8,$fn = quality*2);
     translate([-wireTX,0,0]) cylinder(4,r=wireRadius*1.8,$fn = quality*2);
     
     difference() {  
       translate([0,5,0]) cylinder(d=1.8,r=innerRadius*0.7,$fn = quality*2);
       translate([-20,-0.5,0]) cube([40,40,10]);
     }
   }
   translate([wireTX+clipTX,-clipTX,0]) cylinder(4,wireRadius*0.6,wireRadius*0.6,$fn = quality*2);
   translate([-wireTX-clipTX,-clipTX,0]) cylinder(4,wireRadius*0.6,wireRadius*0.6,$fn = quality*2);
   translate([wireTX,0,0]) cylinder(4,r=wireRadius*0.95,$fn = quality*2);
   translate([-wireTX,0,0]) cylinder(4,r=wireRadius*0.95,$fn = quality*2);
   translate([0,4.4,0]) cylinder(4,r=innerRadius*0.5,$fn = quality*2);
   translate([0,6.4,0]) cylinder(4,r=innerRadius*0.6,$fn = quality*2);
 }
}

module ramp(length=2, height=4, wires=false) {
   angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);
   
   difference() {
      duploMarbleRunBase(2,length,height,false,false);      
      union() {
         translate([0,((4-length)/2)*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  cylinder( duploRaster*6, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,length*dr+0, (length/2) * 1.5*duploHeight+0]) rotate([90+angle,0,0])
                  cube( [duploRaster*4,duploRaster*4,duploRaster*2*length] );
         
          if(wires) {
             translate([wireTX,((4-length)/2)*dr, duploHeight-10]) rotate([90+angle+8,0,0]) scale([1,vscale,1])
                cylinder(h=duploRaster+5, d=wireRadius, $fn = quality*2);
             translate([-wireTX,((4-length)/2)*dr, duploHeight-10]) rotate([90+angle+8,0,0]) scale([1,vscale,1])
                cylinder(duploRaster+5, d=wireRadius, $fn = quality*2);
             translate([wireTX,-((4-length)/2)*dr-1, duploHeight-20]) rotate([90,0,180]) scale([1,vscale,1])
                cylinder(duploRaster, d=wireRadius, $fn = quality*2);
             translate([-wireTX,-((4-length)/2)*dr-1, duploHeight-20]) rotate([90,0,180]) scale([1,vscale,1])
                cylinder(duploRaster, d=wireRadius, $fn = quality*2);
         }
      }
   }
}

