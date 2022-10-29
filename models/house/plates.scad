
$fn = 50;
// smooth corners
cornerOffset=2;

difference() {
    minkowski() {
        hull() {
            cylinder(h=1, d=30);
            translate([70,0,0]) cylinder(h=1, d=30);
        }
        sphere(d=cornerOffset);
    }
    translate([-6,0,-2]) cylinder(h=5,d=3.5);
    translate([76,0,-2]) cylinder(h=5,d=3.5);
    
    translate([0,-2.5,1]) linear_extrude(height = 1) text("EAU de VILLE", size = 8);
}

