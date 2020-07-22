
$fn=100;
use <../water-hose-connector/water-hose-connector.scad>;

// ---------------------------

//clamp();

vacuum_cleaner();

// ---------------------------

module clamp_side() {
    union() {
        hull() {
            translate([0,0,0]) cylinder(d=5,h=8);
            translate([3,0,0]) cylinder(d=6,h=8);
        }
        
        hull() {
            translate([0,3/2,0]) cylinder(d=2,h=8);
            translate([35,10,0]) cylinder(d=3,h=8);
        }
        
        translate([35,10,0]) {
            hull() {
                cylinder(d=3,h=8);
                translate([10,0,0]) cylinder(d=3,h=8);
            }
        }
        
        translate([35+5,13,3.35]) {
            hull() {
                rotate([90,0,0]) cylinder(d=6.5,h=5, center=true);
                translate([0,3.5,0]) sphere(d=6.5);
            }
        }
        
        hull() {
            translate([0,0,6]) cylinder(d=10,h=2);
            translate([0,0,2]) cylinder(d=2,h=2);
        }
    }
}

module clamp() {
    difference() {
        union() {
            clamp_side();
            mirror([0,1,0]) clamp_side();
        }
        translate([0,0,15]) sphere(d=16);
    }
}

// ---------------------------

module vacuum_cleaner() {
    union() {
        translate([0,0,25]) 
            waterhose_connector_male();
        difference() {
            hull() {
                translate([0,0,25])
                    cylinder(d=24,h=1);
                cube([10,80,5], center=true);
            }
            
            translate([0,0,-0.01])
            hull() {
                translate([0,0,25])
                    cylinder(d=20,h=1);
                cube([5,76,5], center=true);
            }
        }
        
    }
    
}
