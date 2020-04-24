
$fn=80;

difference() {
    union() {
        hull() {
            cube([5,30,2], center=true);
            translate([0,0,7]) rotate([90,0,0]) cylinder(d=8,h=30,center=true);
        }
        hull() {
            cube([35,5,2], center=true);
            union() {
                translate([-8,0,7-1.5]) rotate([0,90-15,0]) cylinder(d=8,h=20,center=true);
                translate([8,0,7-1.5]) rotate([0,-90+15,0]) cylinder(d=8,h=20,center=true);
            }
        }
    }
    
    translate([0,0,7]) rotate([90,0,0]) cylinder(d=4,h=32,center=true);
    translate([-8,0,7-1.5]) rotate([0,90-15,0]) cylinder(d=4,h=22,center=true);
    translate([8,0,7-1.5]) rotate([0,-90+15,0]) cylinder(d=4,h=22,center=true);
}