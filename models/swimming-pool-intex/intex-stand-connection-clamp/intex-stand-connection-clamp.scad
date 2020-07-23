
$fn=100;
use <../water-hose-connector/water-hose-connector.scad>;

// ---------------------------

//clamp();

//rotate([0,45,0])
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
tube_width = 30-1;

module vacuum_connector() {
    difference() {
        cylinder(d=tube_width, h=80);
        translate([0,0,0.01]) cylinder(d=tube_width-6, h=80);
        translate([5,-10,5]) cube([10,20,80]);
    }
}

module vacuum_clamp_connector() {
    hull() {
        translate([0,-17,5]) cube([4,30,10],center=true);
        translate([0,-20,15]) rotate([0,90,0]) cylinder(d=30,h=4,center=true);
    }
}

module vacuum_cleaner() {
    difference() {
        union() {
            translate([0,0,27]) waterhose_connector_male();
            
            hull() {
                translate([0,0,27]) cylinder(d=24,h=1);
                translate([40-5,0,0]) cylinder(d=10,h=4);
                translate([-40+5,0,0]) cylinder(d=10,h=4);
            }
            
            hull() {
                translate([40-5,0,0]) cylinder(d=10,h=4);
                translate([-40+5,0,0]) cylinder(d=10,h=4);
                translate([-15,-28,0]) cylinder(d=10,h=4);
                translate([15,-28,0]) cylinder(d=10,h=4);
            }
            
            translate([15-2,0,0]) vacuum_clamp_connector();
            translate([-15+2,0,0]) vacuum_clamp_connector();
        }
        
        translate([0,-25,20]) rotate([0,90,0]) cylinder(d=7,h=80, center=true);
        
        translate([0,5,2]) rotate([45,0,0]) cube([80,20,10], center=true);
        
        hull() {
            translate([0,0,27.01]) cylinder(d=18,h=1);
            translate([40-5,0,-0.01]) cylinder(d=1,h=5);
            translate([-40+5,0,-0.01]) cylinder(d=1,h=5);
        }
    }
}
