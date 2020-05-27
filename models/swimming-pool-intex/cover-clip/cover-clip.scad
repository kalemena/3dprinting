
$fn=100;

width=20;
thick=3.5;

union() {

    translate([-0.5,9.5,0])
    rotate([0,0,-90]) 
    rotate_extrude(angle = 90, convexity = 20)
        translate([6.5,0]) square([thick,width]);

    translate([6,8.5,0])
        cube([thick,30,20]);
        
    translate([32,38.5,0])
    rotate([0,0,-90+35]) 
    rotate_extrude(angle = 235, convexity = 20)
        translate([45/2,0]) square([thick,width]);
        
    translate([52,12.95,0])
    rotate([0,0,90+35]) 
    rotate_extrude(angle = 110, convexity = 20)
        translate([6.5,0]) square([thick,width]);
}
