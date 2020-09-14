$fn=80;

/**
 This is a simple ring which helps bridging 2 poles of 3.2m and 3.8m each.
 Result is near 7m
 */

module ring() {
    difference() {
        cylinder(d=30, h=10);
        cylinder(d=25.6, h=15.01);
    }
}

module ringTop() {
    difference() {
        union() {
            cylinder(d=32, h=3);
            cylinder(d=30, h=10);
        }
        cylinder(d=25.6, h=15.01);
    }
}

module supportCable() {
    union() {
        difference() {
            cylinder(d=38, h=10);
            cylinder(d=32, h=10.01);
            translate([-35,-35,0]) rotate([0,0,45]) cube([50,50,10.01]);
        }
        
        translate([30,0,0]) {
            difference() {
                cylinder(d=18, h=10);
                cylinder(d=12, h=10.01);
                translate([35,-35,0]) rotate([0,0,45]) cube([50,50,10.01]);
            }
        }
                
        difference() {
            union() {
                translate([21,10,0]) cylinder(d=30, h=10);
                translate([21,-10,0]) cylinder(d=30, h=10);
            }
            translate([20,8,0]) cylinder(d=10, h=10.01);
            translate([20,-8,0]) cylinder(d=10, h=10.01);
            cylinder(d=36, h=10.01);
            translate([30,0,0]) cylinder(d=16, h=10.01);
            translate([0,5,0]) cube([50,25,10.01]);
            translate([0,-5-25,0]) cube([50,25,10.01]);
        }
    }
}

supportCable();