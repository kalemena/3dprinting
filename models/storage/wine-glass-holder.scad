
$fn=80;

//wine_glass_holder_base();
wine_glass_holder_top();
//translate([0,0,60]) wine_glass_holder_finish();

module wine_glass_holder_top() {
    union() {
        difference() {
            linear_extrude(height=12, convexity=4)
                    minkowski() {
                        square([100-4,24-4]);
                        circle(d=4);
                    }
                
            translate([8,-3,-0.01]) cube([80,24-4,12.02]);
                
            translate([-2+50,20,12/2]) {
                rotate([90,0,0]) cylinder(d=3, h=10, center=true);
                translate([0,-2.8,0]) rotate([90,0,0]) cylinder(d1=3, d2=6, h=2, center=true);
            }
        }
        
        difference() {
            hull() {
                translate([0,-2,0]) cube([10,8,12]);
                translate([32,-1,0]) cylinder(d=9, h=12);
            }
            translate([32,-1,0]) cylinder(d=4,h=25,center=true);
        }
        difference() {    
            hull() {
                translate([100-4-10,-2,0]) cube([10,8,12]);
                translate([100-4-32,-1,0]) cylinder(d=9, h=12);
            }
            translate([100-4-32,-1,0]) cylinder(d=4,h=25,center=true);
        }

    }
    //translate([0,17,10]) cube([80,5,10]);
}

module wine_glass_holder_base() {    
    difference() {
        union() {
            cube([80,20,4], center=true);
            
            hull() {
                translate([-47.5/2,0,15/2]) rotate([5,0,0]) cylinder(d=4+3,h=15,center=true);
                translate([-47.5/2,6,4/2]) cylinder(d=4+3,h=4,center=true);
                translate([-47.5/2,-6,4/2]) cylinder(d=4+3,h=4,center=true);
            }
            
            hull() {
                translate([+47.5/2,0,15/2]) rotate([3,0,0]) cylinder(d=4+3,h=15,center=true);
                translate([+47.5/2,6,4/2]) cylinder(d=4+3,h=4,center=true);
                translate([+47.5/2,-6,4/2]) cylinder(d=4+3,h=4,center=true);
            }
        }
        
        cylinder(d=3,h=20,center=true);
        translate([-47.5/2-10,0,0]) cylinder(d=3,h=20,center=true);
        translate([+47.5/2+10,0,0]) cylinder(d=3,h=20,center=true);
        
        translate([0,0,1.01])cylinder(d1=3,d2=6,h=2,center=true);
        translate([-47.5/2-10,0,1.01]) cylinder(d1=3,d2=6,h=2,center=true);
        translate([+47.5/2+10,0,1.01]) cylinder(d1=3,d2=6,h=2,center=true);
        
        translate([-47.5/2,0,5]) rotate([5,0,0]) cylinder(d=4,h=25,center=true);
        translate([+47.5/2,0,5]) rotate([5,0,0]) cylinder(d=4,h=25,center=true);
    }
}

module wine_glass_holder_finish() {
    difference() {
        hull() {
            cube([60,10,10], center=true);
            translate([47.5/2-2,0,15]) sphere(d=10);
            translate([-47.5/2+2,0,15]) sphere(d=10);
        }
        
        translate([-47.5/2,0,0]) cylinder(d=4,h=20,center=true);
        translate([+47.5/2,0,0]) cylinder(d=4,h=20,center=true);
        
        translate([0,0,-5]) sphere(d=30);
    }
    
}