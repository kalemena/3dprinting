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
wireRadius=3/2;
wireTX=7;
wireTZ=-2;
clipTX=1.45;

// straightPieceWires(2);
// ramp2PieceWires();
wireClip();

module wireClip() {
 difference() {  
   union() {
     translate([wireTX+clipTX,-clipTX,0]) cylinder(4,r=wireRadius*1.2,$fn = quality*2);
     translate([-wireTX-clipTX,-clipTX,0]) cylinder(4,r=wireRadius*1.2,$fn = quality*2);
     translate([wireTX,0,0]) cylinder(4,r=wireRadius*1.8,$fn = quality*2);
     translate([-wireTX,0,0]) cylinder(4,r=wireRadius*1.8,$fn = quality*2);
     
     difference() {  
       translate([0,5,0]) cylinder(2,r=innerRadius*0.7,$fn = quality*2);
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

module straightPieceWires(length=2)
{
  difference() {
    union() {  
      duploMarbleRunBase(2,length,2,false);
        
      // wire holes
      translate([wireTX,0,0])  
        translate([0,dr,wireTZ]) rotate([90,0,0]) cylinder(dr*2,wireRadius*1.5,wireRadius*1.5,$fn = quality*2);
      translate([-wireTX,0,0])
        translate([0,dr,wireTZ]) rotate([90,0,0]) cylinder(dr*2,wireRadius*1.5,wireRadius*1.5,$fn = quality*2);  
    }
    
    translate([0,dr * length+1, duploHeight+2]) rotate([90,0,0])
      cylinder( duploRaster*2 * length, innerRadius, innerRadius,$fn = quality*2 );
    
    // wire holes 
    translate([wireTX,0,0])  
      translate([0,dr,wireTZ]) rotate([90,0,0]) cylinder(dr*2,wireRadius,wireRadius,$fn = quality*2);
    translate([-wireTX,0,0])
      translate([0,dr,wireTZ]) rotate([90,0,0]) cylinder(dr*2,wireRadius,wireRadius,$fn = quality*2);
  } 
}

module ramp2PieceWires()
{
   angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);
   difference() {
       
      union() {
        duploMarbleRunBase(2,2,4,false);
        // wire holes
        translate([wireTX,0,0]) translate([0,dr-1,wireTZ]) rotate([90+angle,0,0]) cylinder(dr*2-2,wireRadius*1.5,wireRadius*1.5,$fn = quality*2);
        translate([-wireTX,0,0]) translate([0,dr-1,wireTZ]) rotate([90+angle,0,0]) cylinder(dr*2-2,wireRadius*1.5,wireRadius*1.5,$fn = quality*2);  
      }
      union() {
         translate([0,dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  cylinder( duploRaster*6, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,2*dr+0, 1.5*duploHeight+0]) rotate([90+angle,0,0])
                  cube( [duploRaster*4,duploRaster*4,duploRaster*4] );       
      }
      // wire holes 
      translate([wireTX,0,0])  
        translate([0,dr+1,wireTZ]) rotate([90+angle,0,0]) cylinder(dr*2+4,wireRadius,wireRadius,$fn = quality*2);
      translate([-wireTX,0,0])
        translate([0,dr+1,wireTZ]) rotate([90+angle,0,0]) cylinder(dr*2+4,wireRadius,wireRadius,$fn = quality*2);
   }
}
