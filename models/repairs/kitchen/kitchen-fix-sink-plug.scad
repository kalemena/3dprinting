$fn=100;

difference() {
    union() {
        cylinder(d=8.6,h=13);
        sphere(d=8.6);
    }
    translate([0,0,13.01-8]) cylinder(d=5-0.35,h=8);
}
