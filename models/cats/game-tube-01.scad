$fn = 100;

module bouchon() {
    
    difference() {
        union() {
            cylinder(d=50, h=2);
            cylinder(d=50-2*1.6, h=6);
        }
        translate([0,0,2]) cylinder(d=50-4*1.6, h=5);
        translate([0,0,-0.01]) cylinder(d=30, h=10);
    }
}

module tube() {
    difference() {
        cylinder(d=50, h=200);
        cylinder(d=50-2.*1.6, h=200);
        
        translate([0,0,50]) rotate([90,0,0]) cylinder(d=32, h=50);
        translate([0,0,100]) rotate([90,0,0]) cylinder(d=32, h=50);
        translate([0,0,150]) rotate([90,0,0]) cylinder(d=32, h=50);
    }
}

module balle() {
    sphere(d=38);
}

bouchon();

translate([0,0,2])
    tube();

translate([0,0,202])
    rotate([180,0,0])
        bouchon();

translate([0,0,60])
    balle();