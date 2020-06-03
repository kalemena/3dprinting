
$fn=80;
use <threads.scad>;

high=15;
rounded=3;

module inlet_cap() {
    difference() {
        
        union() {
            minkowski() {
                cylinder(r=86.5/2-rounded/1.5, h=high-rounded/2);
                sphere(d=2);
            }

            for(rotZ=[0:45:360]) {
                rotate([0,0,rotZ]) translate([86.5/2-6,0,0]) 
                    minkowski() {
                        cylinder(d=15,h=high-rounded/2);
                        sphere(d=2);
                    }
            }
        }
        
        translate([0,0,-0.01]) 
            metric_thread(diameter=86.5-4, pitch=3, length=(high-rounded/2-2), internal=true);
        
        translate([0,0,-10/2]) 
            cube([100,100,10], center=true);
    }
}

inlet_cap();
