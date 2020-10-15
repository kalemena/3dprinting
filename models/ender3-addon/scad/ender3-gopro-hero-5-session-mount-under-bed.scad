$fn=100;

thickness=4;
thicknessPlate=4.5;
widthMid=7;
width=25;

lenthUnder=60;

//#translate([0,0,4]) cube([10,30,7]);

hull() {
    translate([width/2,55,5]) rotate([0,90,0]) cylinder(d=10,h=width,center=true);
    translate([width/2,30,10]) sphere(d=3);
    translate([width/2,80,25]) sphere(d=3);
}

difference() {
    cube([width,lenthUnder,thickness*2+thicknessPlate]);
    translate([0,-5,thickness]) cube([width,35,thickness]);
    translate([width/2,10,0]) cylinder(d=5,h=40);
}

translate([0,lenthUnder-1,5])
hull() {
    rotate([0,90,0]) cylinder(d=10,h=width);
    translate([0,45,45]) {
        rotate([0,90,0]) cylinder(d=10,h=width);
        // translate([0,0,-2]) rotate([0,90,0]) cylinder(d=10,h=width);
    }    
}

translate([0,105,52]) {
    hull() {
        rotate([0,90,0]) cylinder(d=10,h=width);
        translate([0,5,-25/2+3]) 
            translate([0,0,25-5]) rotate([0,90,0]) cylinder(d=10,h=width);
        translate([0,0,-25/2+3])
            translate([0,0,5]) rotate([0,90,0]) cylinder(d=10,h=width);
    }

    translate([0,5,-25/2+3])
    difference() {
        hull() {
            cube([width,22,25]);
            translate([0,0,25-5]) rotate([0,90,0]) cylinder(d=10,h=width);
            translate([0,-5,5]) rotate([0,90,0]) cylinder(d=10,h=width);
        }
        translate([0,thickness,thickness]) cube([width,22,25-2*thickness]);
        translate([width/2,thickness+9,-1]) cylinder(d=6.2,h=50);
    }
}
