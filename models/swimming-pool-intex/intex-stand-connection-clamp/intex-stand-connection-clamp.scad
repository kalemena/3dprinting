
$fn=100;

module side() {
    union() {
        hull() {
            translate([0,0,0]) cylinder(d=5,h=8);
            translate([3,0,0]) cylinder(d=6,h=8);
        }
        
        hull() {
            translate([0,3/2,0]) cylinder(d=2,h=8);
            translate([45,19,0]) cylinder(d=3,h=8);
        }
        
        translate([45,19,0]) {
            hull() {
                cylinder(d=3,h=8);
                translate([10,0,0]) cylinder(d=3,h=8);
            }
        }
        
        translate([50,25,3.35]) rotate([90,0,0]) cylinder(d=6.7,h=9, center=true);
    }
}

translate([0,0,20]) {
    side();
    mirror([0,1,0]) side();
}
