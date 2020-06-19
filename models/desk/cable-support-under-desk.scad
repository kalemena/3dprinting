// import("cablemanager_underdesk.stl");

$fn=80;

module shapeU() {
    
    difference() {
        union() {
            hull() {
                translate([42.5,0,0]) cylinder(d=10, h=10);
                translate([-42.5,0,0]) cylinder(d=10, h=10);
            }
            
            translate([0,32,0])
            linear_extrude(height = 10) {
                offset(r = 5) square([65,25], center = true);
            }
            
            translate([-20/2,0,0]) cube([20,20,10]);
        }
        
        translate([19,25,-0.005])
        linear_extrude(height = 10.01) {
            offset(r = 5) square([20,30], center = true);
        }
        
        translate([-19,25,-0.005])
        linear_extrude(height = 10.01) {
            offset(r = 5) square([20,30], center = true);
        }
        
        translate([40,10,5]) rotate([90,0,0]) cylinder(d=4,h=20);
        translate([-40,10,5]) rotate([90,0,0]) cylinder(d=4,h=20);
        translate([40,4,5]) rotate([-90,0,0]) cylinder(d1=4,d2=6,h=1.05);
        translate([-40,4,5]) rotate([-90,0,0]) cylinder(d1=4,d2=6,h=1.05);
        translate([-110/2,-10,-0.5]) cube([110,10,11]);
    }

}

shapeU();