
include <lego-block-lib.scad>

// translate([-2,0,1.5]) import("lego-boost-move-hub-battery-holder-v2.stl");

$fn = 100;

difference() {
     
    // box itself
    union() {
        translate([0,3.5,-1.7]) rotate([0,0,90])
            block(
                width=8,
                length=4,
                height=1/3,
                type="tile",
                brand="lego",
                stud_type="hollow",
                reinforcement="yes",
                stud_notches=(wing_stud_notches=="yes"),
                slope_stud_rows=slope_stud_rows,
                slope_end_height=slope_end_height,
                curve_stud_rows=curve_stud_rows,
                curve_type=curve_type,
                curve_end_height=curve_end_height,
                roadway_width=roadway_width,
                roadway_length=roadway_length,
                roadway_x=roadway_x,
                roadway_y=roadway_y,
                stud_rescale=stud_rescale,
                dual_sided=(dual_sided=="yes"),
                dual_bottom=(dual_bottom=="yes")
            );
        
        // trapèze
        hull() {
            translate([0,-27.15,1]) cube([23.5,2.5,1],center=true);
            translate([0,-27.15,7.5]) cube([16,2.5,1],center=true);
        }
        
        // compartiment
        translate([0,0,0.01+1+33/2]) cube([25.5,52,34],center=true);
        
        // screw +
        translate([0,31.25,2.4]) cylinder(d1=6,d2=4,h=2,center=true);
        
        // fixation
        translate([5.9,18.5,12]) cylinder(d=15,h=22, center=true);
        translate([5.9,18.5,12+16]) cylinder(d1=15,d2=13,h=10, center=true);
        
        translate([-5.9,18.5,12]) cylinder(d=15,h=22, center=true);
        translate([-5.9,18.5,12+16]) cylinder(d1=15,d2=13,h=10, center=true);
        
        translate([5.9,-13,12]) cylinder(d=15,h=22, center=true);
        translate([5.9,-13,12+16]) cylinder(d1=15,d2=13,h=10, center=true);
        
        translate([-5.9,-13,12]) cylinder(d=15,h=22, center=true);
        translate([-5.9,-13,12+16]) cylinder(d1=15,d2=13,h=10, center=true);
        
        translate([0,-19.5,12]) cylinder(d=15,h=22, center=true);
        translate([0,-19.5,12+16]) cylinder(d1=15,d2=13,h=10, center=true);
        
        translate([0,19.5,8+0.1]) cylinder(d=15,h=15, center=true);
        translate([0,19.5,8+10.1]) cylinder(d1=15,d2=13,h=5, center=true);
    }
    
    // inside room
    translate([0,0,0.01+2.5+33/2]) cube([25-3,52-4,33],center=true);
    
    // screw hole
    translate([0,31.25,0]) cylinder(d=2.35,h=15,center=true);
    translate([0,31.25,-0.5]) cylinder(d1=6,d2=4,h=4,center=true);
    
    // visible holes
    translate([0,8,0]) cylinder(d=8,h=15,center=true);
    translate([0,-16,0]) cylinder(d=8,h=15,center=true);
    
    // +/-
    translate([0,25.01,28]) cube([18,4,15],center=true);
    
    // Lipo (cut inside to have more room for Lipo)
    translate([0,-5,27.1]) cube([50,70,15], center=true);
}