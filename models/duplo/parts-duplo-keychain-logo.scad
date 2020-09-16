
include <duplo-block-lib.scad>

$fn = 50;

difference() {
duplo(2,5,2,true,false);
translate([-25,-21,2]) 
  rotate([90,0,45]) 
    cylinder(r=2, h=40);
  
translate([15.5,-32,-5]) 
  rotate([90,0,90]) 
    linear_extrude(height = 2) text("Genesys", size = 12);
}
