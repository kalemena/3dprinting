
$fn=100;
use <threads.scad>;

module inlet_cap() {
    difference() {
        cylinder(r=86.5/2, h=15);
        translate([0,0,-0.01]) 
            metric_thread(diameter=86.5-4, pitch=3, length=13, internal=true);
    }
}

inlet_cap();
