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

cornerOffset=3;

// ---------------------------
//rotate([0,0,15]) cube([86.5-4,10,10],center=true);
//inlet_cap();
//inlet_adaptor();

//outlet_cap();
//outlet_adaptor();
//thread_coupler(10);
//translate([0,0,10.3])    
//    waterhose_connector_male();
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
    difference() {
        union() {
            inlet_cap();
            translate([0,0,8]) cylinder(d=40,h=5);
        }
        translate([0,0,1])
        metric_thread(  diameter=26.5,
                        pitch=2, 
                        length=15, 
                        internal=true);
    }
}

module outlet_adaptor() {    
    difference() {
        union() {
            outlet_cap();
            translate([0,0,8]) cylinder(d=40,h=5);
        }
        translate([0,0,1])
        metric_thread(  diameter=26.5,
                        pitch=2, 
                        length=15, 
                        internal=true);
    }
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

module thread_coupler(high) {
    difference() {
        union() {
            cylinder(d=40,h=2);
            for(rotZ=[0:45:360]) {
                rotate([0,0,rotZ]) translate([19,0,0]) 
                    cylinder(d=8,h=2);
            }
            
            translate([0,0,1.95])
            metric_thread(  diameter=26,
                            pitch=2, 
                            length=high, 
                            internal=false);
        }
        cylinder(d=18,h=high+2);
    }
}

