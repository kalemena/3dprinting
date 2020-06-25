
$fn=80;

// shapeU();
// shapeO();
// shapeE();
shapeX();

module shapeU() {
    difference() {
        union() {
            hull() {
                translate([42.5,0,0]) cylinder(d=10, h=10);
                translate([-42.5,0,0]) cylinder(d=10, h=10);
            }
            
            translate([0,32,0])
            linear_extrude(height = 10) {
                offset(r = 5) square([65,25], center = true);
            }
            
            translate([-20/2,0,0]) cube([20,20,10]);
        }
        
        translate([19,25,-0.005])
        linear_extrude(height = 10.01) {
            offset(r = 5) square([20,30], center = true);
        }
        
        translate([-19,25,-0.005])
        linear_extrude(height = 10.01) {
            offset(r = 5) square([20,30], center = true);
        }
        
        translate([40,10,5]) rotate([90,0,0]) cylinder(d=4,h=20);
        translate([-40,10,5]) rotate([90,0,0]) cylinder(d=4,h=20);
        translate([40,4,5]) rotate([-90,0,0]) cylinder(d1=4,d2=6,h=1.05);
        translate([-40,4,5]) rotate([-90,0,0]) cylinder(d1=4,d2=6,h=1.05);
        translate([-110/2,-10,-0.5]) cube([110,10,11]);
    }
}

module shapeO() {
    width=10;
    thick=5;

    difference() {
        union() {
            translate([0,-6,0]) 
                cube([thick,38,width]);
            
            translate([0,25,0]) 
                rotate([0,90,0])
                cylinder(d=15,h=thick);
            
            translate([-20,30,0])
            rotate([0,0,0]) 
            rotate_extrude(angle = 305, convexity = 20)
                translate([40/2,0]) 
                    square([thick,width]);
        }
        
        translate([-5,0,5]) rotate([0,90,0]) cylinder(d=4,h=20);
        translate([1,0,5]) rotate([0,-90,0]) cylinder(d1=4,d2=6,h=1.05);
        
        translate([-5,25,-2]) rotate([0,90,0]) cylinder(d=4,h=20);
        translate([1,25,-2]) rotate([0,-90,0]) cylinder(d1=4,d2=6,h=1.05);
    }
}

module shapeE() {
    
    difference() {        
        union() {
            hull() {
                cube([85,2,6], center=true);
                translate([-35,2/2,10]) rotate([90,0,0]) cylinder(d=10,h=2);
                translate([35,2/2,10]) rotate([90,0,0]) cylinder(d=10,h=2);
            }
            
            hull() {
                cube([85,2,6], center=true);
                translate([0,-5,-3/2]) cube([85,2,3], center=true);
            }
            
            for(posX=[-85/2:10:+40]) {
                translate([posX,-25,-3]) cube([5,20,3]);
                translate([posX,-29.3,1.3]) rotate([-45,0,0]) cube([5,6,3]);
            }
        }
        
        translate([-25,10,8]) rotate([90,0,0]) cylinder(d=4,h=20);
        translate([-25,0,8]) rotate([90,0,0]) cylinder(d1=4,d2=6,h=1.05);
        
        translate([25,10,8]) rotate([90,0,0]) cylinder(d=4,h=20);
        translate([25,0,8]) rotate([90,0,0]) cylinder(d1=4,d2=6,h=1.05);    
    }    
}

module shapeX() {
    difference() {
        union() {
            cylinder(d=80,h=3);
            cylinder(d=20,h=20);
            translate([0,0,20]) cylinder(d=26,h=4); 
            translate([0,0,16]) cylinder(d1=20,d2=26,h=4); 
        }
        
        translate([0,0,-0.1]) cylinder(d=7,h=20);
        translate([0,0,-0.1]) cylinder(d=4,h=25);
        translate([0,0,19.8]) cylinder(d1=7,d2=4,h=2);
        
        for(rotZ=[0:360/6:360]) {            
            rotate([0,0,rotZ]) {
                hull() {
                    translate([28,0,-0.1]) cylinder(d=22,h=24);
                    translate([21,0,-0.1]) cube([15,10,25], center=true);
                }
                translate([36,0,-0.1]) cube([15,10,25], center=true);
            }
        }
    }
}