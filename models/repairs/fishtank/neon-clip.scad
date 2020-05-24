$fn = 100;

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
                        cylinder(d=28,h=8,center=true);
                        translate([0,7.5,0]) 
                            cylinder(d=18,h=8,center=true);
                    }
                    sphere(r=1);
                }
                cylinder(d=26,h=12,center=true);
                translate([0,15,0]) cube([12,10,10],center=true);
            }
        }
    }
    
    // nut for M3
    cylinder(d=6.5,h=5, $fn=6);
    cylinder(d=3.4, h=15, center=true);
}

translate([0,0,-6])
difference() {
    cylinder(d=10,h=1.5);
    cylinder(d=3.3,h=2.5);
}