
$fn=100;

hole_diam = 8;
width=8;

module vesaSpacer() {
    for(i = [0 : 1 : 4]) {
        rotate([0,0,360/4 * i]) {
            translate([50,50,0]) {
                difference() {
                    cylinder(h=width, d=hole_diam + 8, center=true);
                    cylinder(h=width+0.01, d=hole_diam, center=true);
                }
            }
            translate([0,98,0])
            difference() {
                cylinder(h=width, r=62 + 3, center=true);
                cylinder(h=width+0.01, r=62, center=true);
                translate([0,55,0]) cube([200,200,width+0.01],center=true);
            }
        }
    }
}

vesaSpacer();