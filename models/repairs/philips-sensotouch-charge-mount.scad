$fn = 100;

screw_diameter=3;
screw_head_diam=5;
screw_head_high=3.5;

shaver_dist_mid=38;

module screw_m3() {
    cylinder(d=screw_head_diam,h=screw_head_high);
    cylinder(d=screw_diameter,h=3+10);
}

difference() {
    translate([-5,0,0]) cylinder(h=7,d=shaver_dist_mid+5+8,center=true);
    translate([-5,0,0]) cylinder(h=7.5,d=shaver_dist_mid+5+0.5,center=true);
    translate([-5,0,0]) rotate_extrude(convexity = 10) translate([21.5, 0, 0]) circle(d = 3);
    translate([0,-shaver_dist_mid/2,0]) rotate([90,0,0]) screw_m3();
    translate([0,shaver_dist_mid/2,0]) rotate([-90,0,0]) screw_m3();
    translate([shaver_dist_mid/2+10,0,0]) cube([50,80,10], center=true);
    translate([-30,0,0]) rotate([0,90,0]) cylinder(d=4,h=3+10, center=true);
}
