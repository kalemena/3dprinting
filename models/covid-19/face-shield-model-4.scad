include <face-shield-lib.scad>

$fn=50;
high=4;

module arc() {
    translate([0,-62,0])
        rotate([0,0,180]) {
            rotate_extrude(angle=180, convexity=10) translate([25, 0]) square([3,high]);
            rotate([0,0,180]) translate([0,-30,high/2]) clip(); 
        }
}

union() {
    faceShieldBase();
    
    translate([0,10,0]) {
        rotate([0,0,68])  arc();
        rotate([0,0,-68]) arc();
        rotate([0,0,25])  arc();
        rotate([0,0,-25]) arc();
    }
}
