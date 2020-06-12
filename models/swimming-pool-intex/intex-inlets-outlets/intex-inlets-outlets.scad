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
//inlet_adaptor();

//plug_hose();
translate([0,0,7]) rotate([0,0,15]) 
    thread_coupler_female(5);

//outlet_cap();
//outlet_adaptor();
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

module inlet_adaptor() { 
    adaptor(InletExternalDiameter, 
        InletThreadDiameter, 
        InletThreadHeight, 
        InletThreadPitch, 
        cornerOffset);
}

module outlet_adaptor() {
    adaptor(OutletExternalDiameter, 
        OutletThreadDiameter, 
        OutletThreadHeight, 
        OutletThreadPitch, 
        cornerOffset);
}

module adaptor(extDiameter, threadDiam, threadH, threadP, cornerOffset) { 
    
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
                cylinder(d1=realDiamExt,
                         d2=realDiamExt-10-2,
                         h=6);
            
            translate([0,0,15])
                cylinder(d=40,h=50);
            
            for(rotZ=[0:45:180]) {
                rotate([0,0,rotZ])
                    translate([0,0,realThreadH+2+6.5]) 
                        cube([realDiamExt,5,5], center=true);
            }
        }
        
        translate([0,0,-0.01]) 
            metric_thread(diameter=threadDiam, 
                          pitch=threadP, 
                          length=threadH, 
                          internal=true);
        translate([0,0,-20/2]) 
            cube([100,100,20], center=true);
        
        cylinder(d=28,h=50);
    }
}

module plug_hose() {
    thread_coupler_male(10);
    translate([0,0,10.3])    
        waterhose_connector_male();
}

module thread_coupler_male(high) {
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

module thread_coupler_female(high) {
    difference() {
        union() {
            cylinder(d=40,h=high);
            for(rotZ=[0:45:360]) {
                rotate([0,0,rotZ]) translate([19,0,0]) 
                    cylinder(d=8,h=high);
            }
        }
            
        metric_thread(  diameter=27.5,
                        pitch=2, 
                        length=high, 
                        internal=true);        
    }
}

