include <face-shield-lib.scad>

$fn=50;
high=4;

module arc() {
    translate([0,-22,0])
        rotate([0,0,180-25]) {
            rotate_extrude(angle=230, convexity=10) translate([71.5, 0]) square([3,high]);
        }
        
    translate([0,30,0])
        rotate([0,0,-100-40]) {
            rotate_extrude(angle=100, convexity=10) translate([125, 0]) square([3,high]);
            rotate([0,0,100+40+48]) translate([0,-130,high/2]) clip();
            rotate([0,0,100+40-48]) translate([0,-130,high/2]) clip();
            rotate([0,0,100+40+20]) translate([0,-130,high/2]) clip();
            rotate([0,0,100+40-20]) translate([0,-130,high/2]) clip();
        }
}

union() {
    faceShieldBase();
    
    translate([0,10,0]) {
        rotate([0,0,0])  arc();
    }
}

