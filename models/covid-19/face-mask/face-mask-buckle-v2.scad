
$fn = 50;

module clip() {
    translate([0,-10,0]) cube([3,20,2]);
    translate([0,-10,0]) cylinder(d=6,h=2);
    translate([0,10,0]) cylinder(d=6,h=2);
}

module clips() {
    for(i=[0:4]) {
        translate([10*i,0,0]) clip();
    }
}

module sideWithClips() {
    clips();
    translate([-20,-5,0]) cube([60,10,1]);
}

module faceMaskBuckle() {
    translate([-50/2,-20/2,0]) {
        hull() {
            cube([50,20,1]);
            translate([-5,5,0]) cube([60,10,1]);
        }
    }
    
    translate([50-5,3,0]) rotate([0,0,10]) sideWithClips();
    translate([-50+5,3,0]) mirror([1,0,0]) rotate([0,0,10])sideWithClips();
}

faceMaskBuckle();
translate([-50/2-3,-3.5,0]) 
    linear_extrude(height = 1.5) text("COURAGE", size = 8);
