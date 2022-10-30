
$fn = 50;
cornerOffset=2;

module plate(text) {

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
        
        translate([-1,-3,1]) linear_extrude(height = 1) text(text, size = 8);
    }

}

// plate("EAU de VILLE");

translate([0,50,0]) 
    plate("EAU de PLUIE");