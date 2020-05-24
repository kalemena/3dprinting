$fn=100;

difference() {
    union() {
        cylinder(d=8.5,h=13);
        sphere(d=8.5);
    }
    translate([0,0,13.01-8]) cylinder(d=5-0.3,h=8);
}
