
$fn=100;

module sprayHook() {
    difference() {
        union() {
            cylinder(d=50, h=2);
            cylinder(d1=27, d2=25.5, h=16);
        }
        cylinder(d=22, h=21.01);
        translate([0,0,13]) {
            translate([0,5/2+0.3,0]) cube([50,0.5,7.01], center=true);
            translate([0,-5/2-0.3,0]) cube([50,0.5,7.01], center=true);
        }
    }
    
    difference() {
        translate([0,0,18])
            cube([25.5,5,8], center=true);
        translate([0,0,15])
            cylinder(d1=19,d2=23.5,h=11);
        translate([0,0,13])
            cylinder(d1=23,d2=19,h=3);
    }
}

sprayHook();