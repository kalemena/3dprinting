$fn = 100;

/////////////////////
// PARAMETERS

diamNeon= 26;
diamM3  = 3.3;

/////////////////////
// PARTS

difference() {
    clip();
    translate([0,0,-5.5]) rotate([0,0,90]) washer();
}

translate([0,0,-6]) rotate([0,0,90]) washer();

/////////////////////
// MODULES

module clip() {
    difference() {
        union() {
            minkowski() {
                cube([8,8,4], center=true);
                cylinder(r=1,h=4,center=true);
            }
            translate([0,0,17]) rotate([90,0,0]) {        
                difference() {
                    minkowski() {
                        union() {
                            cylinder(d=diamNeon+2,h=8,center=true);
                            translate([0,7.5,0]) 
                                cylinder(d=diamNeon*18/26,h=8,center=true);
                        }
                        sphere(r=1);
                    }
                    cylinder(d=diamNeon,h=12,center=true);
                    translate([0,15,0]) cube([12,10,10],center=true);
                }
            }
        }
        
        // nut for M3
        cylinder(d=6.5,h=5, $fn=6);
        cylinder(d=diamM3+0.1, h=15, center=true);
    }
}

module washer() {
    difference() {
        cylinder(d=14,h=2.5);
        cylinder(d=diamM3,h=2.5);
        
        // add-ons
        translate([0,4.5,7.5+1.5]) rotate([-90,0,0]) rotate([0,90,0]) hull() {
            cylinder(d=15,h=15, center=true);
            translate([-10,0,0]) cube([10,15,15], center=true);
        }
        translate([0,-4.5,7.5+1.5]) rotate([90,0,0]) rotate([0,90,0]) hull() {
            cylinder(d=15,h=15, center=true);
            translate([-10,0,0]) cube([10,15,15], center=true);
        }
    }
}

