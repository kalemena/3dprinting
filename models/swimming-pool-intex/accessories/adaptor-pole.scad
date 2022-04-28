$fn=80;

/**
 This is a simple ring which helps bridge instruments to the pole.
 */

module ring() {
    difference() {
        union() {
            cylinder(d=31.8, h=3);
            cylinder(d=30, h=45);
        }
        cylinder(d=26, h=100, center=true);
        translate([0,0,15]) rotate([90,0,0]) cylinder(d=7, h=50, center=true);
    }
}

ring();
