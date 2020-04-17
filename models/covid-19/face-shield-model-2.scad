include <face-shield-lib.scad>

$fn=100;
high=6;

module arc() {
    translate([0,-43,0])
        rotate([0,0,180]) {
            scale([1,1.3,1]) rotate_extrude(angle=180, convexity=10) translate([50, 0]) square([3,high]);
            rotate([0,0,180+30]) translate([0,-67,high/2]) rotate([0,0,10]) clip();
            rotate([0,0,180-45]) translate([0,-62,high/2]) rotate([0,0,-13]) clip(); 
        }
}

union() {
    faceShieldBase();
    
    translate([0,10,0]) {
        rotate([0,0,-40]) arc();
        translate([0,0,high]) rotate([0,180,40])  arc();
    }
}
