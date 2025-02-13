
$fn=100;
use <../water-hose-connector/water-hose-connector.scad>;

// ---------------------------

//clamp();
//vacuum_to_pole();

vacuum_cleaner_32mm();
//vacuum_cleaner_square();

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
pole_width = 30-1;
floor_width = 100;

module vacuum_to_pole() {
    difference() {
        union() {
            cylinder(d=pole_width, h=100);
            hull() {
                translate([0,0,102]) cylinder(d1=pole_width, d2=pole_width-6, h=5, center=true);
                
                translate([-3,15+2,113]) rotate([90,0,0]) cylinder(d=20, h=4, center=true);
                translate([-3,15+2,126]) rotate([90,0,0]) cylinder(d=20, h=4, center=true);
                
                translate([-3,-15-2,113]) rotate([90,0,0]) cylinder(d=20, h=4, center=true);
                translate([-3,-15-2,126]) rotate([90,0,0]) cylinder(d=20, h=4, center=true);
            }
        }
        
        translate([0,0,85]) rotate([90,0,0]) cylinder(d=7, h=80, center=true);
        translate([-3,0,85+41]) rotate([90,0,0]) cylinder(d=7, h=80, center=true);        
        translate([0,0,124]) cube([30,30,30], center=true);
        
        translate([0,0,5]) cylinder(d=pole_width-6, h=90);
        translate([5,-10,5]) cube([10,20,90]);
    }
}

module vacuum_cleaner_square() {
    
    difference() {
        
        union() {
            minkowski() {
                cube([70,70,5],center=true);
                sphere(d=5);
            }
            
            // clip water hose
            translate([-10,0,4]) waterhose_connector_male();
            
            hull() {
                translate([16,15-2,3]) cube([26,6,5], center=true);
                minkowski() {
                    translate([18,15-2,18]) rotate([90,0,0]) cylinder(d=20,h=4, center=true);
                    sphere(d=2);
                }
            }
            
            hull() {
                translate([16,-15+2,3]) cube([26,6,5], center=true);
                minkowski() {
                    translate([18,-15+2,18]) rotate([90,0,0]) cylinder(d=20,h=4, center=true);
                    sphere(d=2);
                }
            }
        }
        
        translate([-10,0,0]) cylinder(d=13, h=17, center=true);
        
        translate([18.5,0,20]) rotate([90,0,0]) cylinder(d=7, h=60, center=true);
        
        for(posX=[-28:14:+28]) {
            translate([posX,0,-5])
            rotate([90,0,0]) 
                cylinder(d1=10, d2=10, h=100, center=true);
            
            translate([0,posX,-5])
            rotate([0,90,0]) 
                cylinder(d1=10, d2=10, h=100, center=true);
        }
        
        /*for(posX=[0:180/7:+360]) {
            translate([-10,0,-3]) rotate([92,0,posX]) translate([0,0,30]) cylinder(d1=5, d2=12, h=60, center=true);
        }*/
    }
}

module vacuum_clamp_connector() {
    hull() {
        translate([0,-27,5]) cube([4,36,10],center=true);
        translate([0,-20,15]) rotate([0,90,0]) 
            minkowski() {
                cylinder(d=27,h=3,center=true);
                sphere(d=2);
            }
    }
}

module vacuum_cleaner() {
    difference() {
        union() {
            // clip water hose
            translate([0,0,27]) waterhose_connector_male();
            
            // water hose to floor
            hull() {
                translate([0,0,27]) cylinder(d=24,h=1);
                translate([floor_width/2-5,0,0]) cylinder(d=15,h=4);
                translate([-floor_width/2+5,0,0]) cylinder(d=15,h=4);
            }
            
            // base floor
            hull() {
                translate([floor_width/2-5,0,0]) cylinder(d=15,h=4);
                translate([-floor_width/2+5,0,0]) cylinder(d=15,h=4);
                translate([-15,-38,0]) cylinder(d=15,h=4);
                translate([15 ,-38,0]) cylinder(d=15,h=4);
            }
            
            // pole clip
            translate([15-2.5,0,0])   vacuum_clamp_connector();
            translate([-15+2.5,0,0])  vacuum_clamp_connector();
            
            //translate([0,-20,20]) cube([30,30,10], center=true);
        }
        
        // pole clip hole
        translate([0,-25,16]) rotate([0,90,0]) cylinder(d=7,h=80, center=true);
        
        // hole to water hose
        hull() {
            translate([0,0,27.01]) cylinder(d=15.5,h=1);
            translate([floor_width/2-5-4,0,4]) cylinder(d=4,h=5);
            translate([-floor_width/2+5+4,0,4]) cylinder(d=4,h=5);
        }
        
        // angle 45° to floor
        for(posX=[-36:12:+36]) {
            translate([posX,5,2]) rotate([45,0,0]) cube([10,30,10], center=true);
        }
    }
}

module vacuum_cleaner_32mm() {
    difference() {
        union() {
            // clip water hose
            // translate([0,0,27]) waterhose_connector_male();
            translate([0,0,27]) cylinder(d1=33,d2=31.5,h=30);
            
            // water hose to floor
            hull() {
                translate([0,0,27]) cylinder(d=33,h=1);
                translate([floor_width/2-5,0,0]) cylinder(d=15,h=5);
                translate([-floor_width/2+5,0,0]) cylinder(d=15,h=5);
            }
            
            // base floor
            hull() {
                translate([floor_width/2-5,0,0]) cylinder(d=15,h=4);
                translate([-floor_width/2+5,0,0]) cylinder(d=15,h=4);
                translate([-15,-43,0]) cylinder(d=15,h=4);
                translate([ 15,-43,0]) cylinder(d=15,h=4);
            }
            
            // pole clip
            translate([15-2.5,-5,0])   vacuum_clamp_connector();
            translate([-15+2.5,-5,0])  vacuum_clamp_connector();
            
            //translate([0,-20,20]) cube([30,30,10], center=true);
        }
        
        // pole clip hole
        translate([0,-30,16]) rotate([0,90,0]) cylinder(d=7,h=80, center=true);
        
        // top hole
        translate([0,0,27]) cylinder(d=32-6,h=40.001);
        
        // hole to water hose
        hull() {
            translate([0,0,27.01]) cylinder(d=22,h=1);
            translate([floor_width/2-5-4,0,4]) cylinder(d=4,h=5);
            translate([-floor_width/2+5+4,0,4]) cylinder(d=4,h=5);
        }
        
        // angle 45° to floor
        for(posX=[-36:12:+36]) {
            translate([posX,5,1]) rotate([45,0,0]) cube([10,30,10], center=true);
        }
    }
}
