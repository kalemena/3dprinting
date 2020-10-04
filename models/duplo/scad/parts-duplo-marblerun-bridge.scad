// Duplo-compatible marble run extended pieces (C) by Keisuke Oohashi 2017
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.
// 

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
// The duplo-marblerun is derived from https://www.thingiverse.com/thing:159219
include <duplo-block-lib.scad>
include <duplo-marblerun.scad>

$fn=80;

innerRadius=14*dr/16;
quality = 50;

// bridge(8);
// duploMarbleRunBase(2,2,8,true);

pylon(8);

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

module pylon(h=8) {
    difference() {
        union() {
            duploMarbleRunBase(2,2,1,false);
            
            hull() {
                translate([0,0,duploHeight-5]) cube([1.97*dr,1.97*dr,0.5],center=true);
                translate([0,0,duploHeight]) cylinder(d=2*dr,h=duploHeight, center=true);
            }
            
            translate([0,0,duploHeight*2]) cylinder(d1=dr*2, d2=15, h=duploHeight,center=true);
            translate([0,0,duploHeight*5]) cylinder(d=15, h=duploHeight*6,center=true);
            translate([0,0,duploHeight*8]) cylinder(d1=15, d2=dr*2, h=duploHeight,center=true);
            
            translate([0,0,duploHeight*8])
            hull() {
                translate([0,0,duploHeight]) cylinder(d=2*dr,h=duploHeight, center=true);
                translate([0,0,duploHeight*2]) cube([1.97*dr,1.97*dr,duploHeight],center=true);
            }
            
            translate([0,0,duploHeight*10]) duploMarbleRunBase(2,2,1,true, false);
        }
        
        translate([0,0,duploHeight*6]) cylinder(d=10,h=duploHeight*12,center=true);
    }
}