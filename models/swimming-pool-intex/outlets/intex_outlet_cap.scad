
$fn=100;
use <threads.scad>;

// Base internal diameter (thread outer diameter)
ThreadDiameter = 84.25; 
ThreadHeight = 11; 
// Thread pitch in mm
ThreadPitch = 3;

// Base external diameter
ExternalDiameter = 88.25;

Rounded=3;

module outlet_cap() {
    difference() {
        
        union() {
            minkowski() {
                cylinder(d=ExternalDiameter-Rounded/2, h=ThreadHeight+2-Rounded/2);
                sphere(d=2);
            }
                        
            for(rotZ=[0:45:360]) {
                rotate([0,0,rotZ]) translate([ExternalDiameter/2-5,0,0]) 
                    minkowski() {
                        cylinder(d=15,h=ThreadHeight+2-Rounded/2);
                        sphere(d=2);
                    }
            }
        }
        
        translate([0,0,-0.01]) 
            metric_thread(  diameter=ThreadDiameter, 
                            pitch=ThreadPitch, 
                            length=ThreadHeight, 
                            internal=true);
        
        translate([0,0,-10/2]) 
            cube([100,100,10], center=true);
    }
}

//rotate([0,0,15]) cube([86.5-4,10,10],center=true);
outlet_cap();