$fn=80;
use <threads.scad>;
use <../water-hose-connector/water-hose-connector.scad>;

// Outlet - Base diameters (thread outer diameter)
OutletExternalDiameter = 88.25;
OutletThreadDiameter = 84.25; 
OutletThreadHeight = 11; 
OutletThreadPitch = 3; // in mm
// Inlet - Base
InletExternalDiameter = 87;
InletThreadDiameter = 83; 
InletThreadHeight = 11; 
InletThreadPitch = 3; // in mm

cornerOffset=4;

// ---------------------------
//inlet_cap();
//outlet_cap();

/*
inlet_adaptor();
translate([0,0,12]) thread_bolt(12,26);
translate([0,0,12+13.3]) waterhose_connector_male();
translate([0,0,12+7]) rotate([0,0,15]) thread_nut(5, 27.5);
*/

//outlet_adaptor();
//translate([0,0,12]) thread_bolt(12, 39);

translate([0,0,12+8]) rotate([0,0,15]) thread_nut(5, 40.5);
/*
// outlet 90°
translate([-25,0,26])
rotate([90,0,0])
rotate_extrude(angle=90, convexity = 10)
    translate([25, 0, 0]) {
        difference() {
            circle(d = 34);
            circle(d = 39-11);
        }
    }
  */  
// ---------------------------

module inlet_cap() {
    cap(InletExternalDiameter, 
        InletThreadDiameter, 
        InletThreadHeight, 
        InletThreadPitch, 
        cornerOffset);
}

module outlet_cap() {
    cap(OutletExternalDiameter, 
        OutletThreadDiameter, 
        OutletThreadHeight, 
        OutletThreadPitch, 
        cornerOffset);
}

module inlet_adaptor() { 
    adaptor(28,
        InletExternalDiameter, 
        InletThreadDiameter, 
        InletThreadHeight, 
        InletThreadPitch, 
        cornerOffset);
}

module outlet_adaptor() {
    adaptor(40,
        OutletExternalDiameter, 
        OutletThreadDiameter, 
        OutletThreadHeight, 
        OutletThreadPitch, 
        cornerOffset);
}

module cap(extDiameter, threadDiam, threadH, threadP, cornerOffset) {
    difference() {
        union() {
            minkowski() {
                cylinder(d=extDiameter-cornerOffset, 
                         h=threadH+2-cornerOffset/2);
                sphere(d=cornerOffset);
            }

            for(rotZ=[0:45:360]) {
                rotate([0,0,rotZ]) translate([threadDiam/2-4,0,0]) 
                    minkowski() {
                        cylinder(d=extDiameter/6,
                                 h=threadH+2-cornerOffset/2);
                        sphere(d=cornerOffset);
                    }
            }
        }
        
        translate([0,0,-0.01]) 
            metric_thread(diameter=threadDiam, 
                          pitch=threadP, 
                          length=threadH, 
                          internal=true);
        
        translate([0,0,-10/2]) 
            cube([100,100,10], center=true);
    }
}

module adaptor(holeDiam, extDiameter, threadDiam, threadH, threadP, cornerOffset) { 
    
    realDiamExt = extDiameter - cornerOffset;
    realThreadH = threadH - cornerOffset/2;
    
    difference() {
        union() {
            minkowski() {
                union() {
                    cylinder(d=realDiamExt, 
                             h=realThreadH+2);
                    
                    translate([0,0,realThreadH+2])
                        cylinder(d1=realDiamExt,
                                 d2=realDiamExt-10,
                                 h=6);
                }
                sphere(d=cornerOffset);
            }
            
            for(rotZ=[0:45:360]) {
                rotate([0,0,rotZ]) translate([realDiamExt/2-3,0,0]) 
                    scale([1,1,1.8])
                        sphere(d=19);
            }
        }
        
        difference() {
            translate([0,0,realThreadH+2-0.02])
                cylinder(d1=realDiamExt-3,
                         d2=realDiamExt-10,
                         h=6);
            
            translate([0,0,16])
                cylinder(d=holeDiam+10,h=50);
            
            for(rotZ=[0:45:180]) {
                rotate([0,0,rotZ])
                    translate([0,0,realThreadH+2+6.5]) 
                        cube([realDiamExt,5,3], center=true);
            }
        }
        
        translate([0,0,-0.01]) 
            metric_thread(diameter=threadDiam, 
                          pitch=threadP, 
                          length=threadH, 
                          internal=true);
        translate([0,0,-20/2]) 
            cube([100,100,20], center=true);
        
        cylinder(d=holeDiam,h=50);
    }
}

module thread_bolt(high, diamThread) {
    difference() {
        union() {
            cylinder(d=diamThread+10,h=2);
            for(rotZ=[0:45:360]) {
                rotate([0,0,rotZ]) translate([(diamThread+15)*0.43,0,0]) 
                    cylinder(d=(diamThread+15)/5,h=2);
            }
            translate([0,0,1.95])
            metric_thread(  diameter=diamThread,
                            pitch=2, 
                            length=high, 
                            internal=false);
        }
        translate([0,0,-0.01])
            cylinder(d1=diamThread-10,d2=diamThread-11,h=high+2);
    }
}

module thread_nut(high, diamThread) {
    difference() {
        union() {
            cylinder(d=diamThread+10,h=high);
            for(rotZ=[0:45:360]) {
                rotate([0,0,rotZ]) translate([(diamThread+15)*0.43,0,0]) 
                    cylinder(d=(diamThread+15)/5,h=high);
            }
        }
            
        metric_thread(  diameter=diamThread,
                        pitch=2, 
                        length=high, 
                        internal=true);        
    }
}

