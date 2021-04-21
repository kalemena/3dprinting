
include <duplo-block-lib.scad>

// translate([-2,0,1.5]) import("lego-boost-move-hub-battery-holder-v2.stl");

$fn = 50;

difference() {
     
    // box itself
    union() {
        translate([0,3.5,1]) cube([32,63.8,1], center=true);
        translate([0,3.5,-0.5]) scale([0.5,0.5,0.5]) duplo(4,8,0.45,false,false);
        //translate([0,0,2]) cube([32,63,1],center=true);       
        
        hull() {
            translate([0,-27.15,1]) cube([23.5,2.5,1],center=true);
            translate([0,-27.15,7.5]) cube([16,2.5,1],center=true);
        }
        
        translate([0,0,1+33/2]) cube([25,52,34],center=true);
        translate([0,31.25,2]) cylinder(d1=2.35+2,d2=2.35+1,h=2,center=true);
        
        // fixation
        translate([5.9,18.5,12]) cylinder(d=15,h=22, center=true);
        translate([5.9,18.5,12+16]) cylinder(d1=15,d2=13,h=10, center=true);
        
        translate([-5.9,18.5,12]) cylinder(d=15,h=22, center=true);
        translate([-5.9,18.5,12+16]) cylinder(d1=15,d2=13,h=10, center=true);
        
        translate([5.9,-13,12]) cylinder(d=15,h=22, center=true);
        translate([5.9,-13,12+16]) cylinder(d1=15,d2=13,h=10, center=true);
        
        translate([-5.9,-13,12]) cylinder(d=15,h=22, center=true);
        translate([-5.9,-13,12+16]) cylinder(d1=15,d2=13,h=10, center=true);
    }
    
    // inside room
    translate([0,0,0.01+2+33/2]) cube([25-2,52-3,34],center=true);
    
    // screw
    translate([0,31.25,0]) cylinder(d=2.35,h=15,center=true);
    
    // visible holes
    translate([0,8,0]) cylinder(d=8,h=15,center=true);
    translate([0,-16,0]) cylinder(d=8,h=15,center=true);
    
    // +/-
    translate([0,25.01,28]) cube([18,2,15],center=true);
}