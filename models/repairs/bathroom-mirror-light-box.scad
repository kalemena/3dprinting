$fn=60;

module part() { 
    hull() {
        translate([0.5,0,9/2]) cube([1,70,10], center=true);
        translate([27.5,0,19/2]) cube([1,80,20], center=true);
    }
}

difference() {
    part();
    translate([1.5,0,-0.5]) scale([0.90,0.95,0.90]) part();
    rotate([0,90,0]) cylinder(d=10, h=50);
}