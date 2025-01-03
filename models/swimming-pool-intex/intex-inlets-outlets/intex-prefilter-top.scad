$fn=40;
use <threads.scad>;

// Nob
NobD = 30;
NobH = 12;

// Thread
NobThreadDiameter = 15.4; 
NobThreadHeight = 30-NobH; 
NobThreadPitch = 2; // in mm

cornerOffset = 3;

union() {
    translate([0,0,cornerOffset/2])
    union() {
        minkowski() {
            cylinder(d=NobD-cornerOffset,h=NobH-cornerOffset);
            sphere(d=cornerOffset);
        }
        for(rotZ=[0:60:360]) {
            rotate([0,0,rotZ])
            minkowski() {
                translate([NobD/2,0,0]) cylinder(d=8-cornerOffset, h=NobH-cornerOffset);
                sphere(d=cornerOffset);
            }
        }
    }
    
    cylinder(d=24,h=15);
    translate([0,0,NobH+2.5]) cylinder(d1=21,d2=15,h=2.5);
    translate([0,0,NobH])
        metric_thread(diameter=NobThreadDiameter, 
                        pitch=NobThreadPitch, 
                        length=NobThreadHeight, 
                        internal=true);
}
