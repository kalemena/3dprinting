$fn=50;

union() {
    difference() {
        hull() {
            translate([0,5,0]) cylinder(d=100,h=5);
            translate([0,70,0]) cylinder(d=10,h=5);
        }
        hull() {
            translate([0,4,-0.05]) cylinder(d=95,h=5.1);
            translate([0,68,-0.05]) cylinder(d=10,h=5.1);
        }
        translate([0,70,0]) cube([5,20,20], center=true);
    }

    difference() {
        hull() {
            translate([0,-10,0]) cylinder(d=120,h=5);
            translate([0,70,0]) cylinder(d=10,h=5);
        }
        hull() {
            translate([0,-10,-0.05]) cylinder(d=116,h=5.1);
            translate([0,66,-0.05]) cylinder(d=10,h=5.1);
        }
        translate([0,70,0]) cube([5,20,20], center=true);
    }
}