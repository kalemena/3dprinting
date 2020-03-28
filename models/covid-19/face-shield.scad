$fn=100;

high=4;

difference() {
    union() {
        difference() {
            hull() {
                translate([0,5,0]) cylinder(d=100,h=high);
                translate([0,70,0]) cylinder(d=10,h=high);
            }
            hull() {
                translate([0,4,-0.05]) cylinder(d=95,h=high+0.1);
                translate([0,68,-0.05]) cylinder(d=10,h=high+0.1);
            }
            translate([0,80,0]) rotate([0,0,-45]) cube([20,20,20], center=true);
        }

        difference() {
            hull() {
                translate([0,-10,0]) cylinder(d=120,h=high);
                translate([0,70,0]) cylinder(d=10,h=high);
            }
            hull() {
                translate([0,-10,-0.05]) cylinder(d=116,h=high+0.1);
                translate([0,66,-0.05]) cylinder(d=10,h=high+0.1);
            }
            translate([0,80,0]) rotate([0,0,-45]) cube([20,20,20], center=true);
        }
        
        //translate([10,80,0]) rotate([0,0,0]) 
        //    rotate_extrude(angle=270, convexity=10) translate([3, 0]) square(3);

        translate([-7,70,4]) rotate([90,0,45]) 
            cylinder(d=8,h=3);
        translate([7,70,4]) rotate([90,0,-45]) 
            cylinder(d=8,h=3);
        
        // translate([20,-66,5/2]) rotate([90,0,25]) cylinder(d1=5,d2=1,h=3);
    }
    translate([-7,70,4]) rotate([90,0,45])
            cylinder(d=3,h=high);
    translate([7,70,4]) rotate([90,0,-45]) 
            cylinder(d=3,h=high);
}