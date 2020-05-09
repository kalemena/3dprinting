
$fn = 50;

module clip() {
    translate([0,-10,0]) cube([3,20,2]);
    translate([0,-10,0]) cylinder(d=6,h=2);
    translate([0,10,0]) cylinder(d=6,h=2);
}

module clips() {
    for(i=[0:3]) {
        translate([10*i,0,0]) clip();
    }
}

module faceMaskBuckle() {
    clips();
    translate([-80,0,0]) mirror([1,0,0]) clips();
    translate([-110,-5,0]) cube([140,10,1]);

    translate([-65,-20/2,0]) {
        hull() {
            cube([50,20,1]);
            translate([-5,5,0]) cube([60,10,1]);
        }
    }
}

faceMaskBuckle();
translate([-65,-3.5,0]) 
    linear_extrude(height = 1.5) text("COVID-19", size = 8);
