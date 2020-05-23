include <face-shield-lib.scad>

$fn=60;
high=5;

module arc() {
    translate([0,-58,0])
        rotate([0,0,180]) {
            rotate_extrude(angle=180, convexity=10) translate([30, 0]) square([3,high]);
            rotate([0,0,180]) translate([0,-36,high/2]) clip(); 
        }
}

union() {
    faceShieldBase();
    
    translate([0,10,0]) {
        rotate([0,0,72])  arc();
        rotate([0,0,-72]) arc();
        rotate([0,0,25])  arc();
        rotate([0,0,-25]) arc();
    }
}
