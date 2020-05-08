
include <duplo-block-lib.scad>

$fn = 50;

difference() {
duplo(2,4,2,true,false);
translate([-25,-14,2]) 
  rotate([90,0,45]) 
    cylinder(r=2, h=40);
  
translate([15.5,-29,-5]) 
  rotate([90,0,90]) 
    linear_extrude(height = 2) text("Damien", size = 12);
}
