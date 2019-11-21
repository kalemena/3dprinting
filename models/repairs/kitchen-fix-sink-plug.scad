$fn=100;

difference() {
    union() {
        cylinder(d=8.5,h=12);
        sphere(d=8.5);
    }
    translate([0,0,12.01-6]) cylinder(d=5-0.3,h=6);
}
