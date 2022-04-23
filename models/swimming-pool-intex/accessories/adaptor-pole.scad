$fn=80;

/**
 This is a simple ring which helps bridge instruments to the pole.
 */

module ring() {
    difference() {
        union() {
            cylinder(d=32, h=3);
            cylinder(d=30, h=45);
        }
        cylinder(d=25.6, h=50.01);
        translate([0,0,22]) rotate([90,0,0]) cylinder(d=6, h=50, center=true);
    }
}

ring();
