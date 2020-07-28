
$fn=80;

wine_glass_holder_base();
//translate([0,0,60]) wine_glass_holder_top();

module wine_glass_holder_base() {    
    difference() {
        union() {
            cube([80,20,4], center=true);
            
            hull() {
                translate([-47.5/2,0,15/2]) cylinder(d=4+3,h=15,center=true);
                translate([-47.5/2,6,4/2]) cylinder(d=4+3,h=4,center=true);
                translate([-47.5/2,-6,4/2]) cylinder(d=4+3,h=4,center=true);
            }
            
            hull() {
                translate([+47.5/2,0,15/2]) cylinder(d=4+3,h=15,center=true);
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
        
        translate([-47.5/2,0,0]) cylinder(d=4,h=40,center=true);
        translate([+47.5/2,0,0]) cylinder(d=4,h=40,center=true);
    }
}

module wine_glass_holder_top() {
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