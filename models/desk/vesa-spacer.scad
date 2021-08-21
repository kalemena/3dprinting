
$fn=100;

hole_diam = 8;
width=5;

module vesaSpacer() {
    for(i = [0 : 1 : 4]) {
        rotate([0,0,360/4 * i])
        translate([50,50,0]) {
            difference() {
                cylinder(h=width, d=hole_diam + 10, center=true);
                cylinder(h=width+0.01, d=hole_diam, center=true);
            }
        }
    }
    
    difference() {
        cylinder(h=width, r=60 + 5, center=true);
        cylinder(h=width+0.01, r=60, center=true);
    }
}

vesaSpacer();