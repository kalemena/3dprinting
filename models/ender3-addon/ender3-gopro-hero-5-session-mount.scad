$fn=100;

thickness=4;
widthMid=4.8;
wide=25;

difference() {
    union() {
        cube([wide,70/2,thickness]);
        translate([0,0,thickness+widthMid])
            cube([wide,55,thickness]);
        translate([0,(70-thickness)/2,0])
            cube([wide,widthMid,37.8-widthMid]);
        translate([0,35,thickness+25])
            cube([wide,20,thickness]);
    }
    translate([wide/2,46,0])
        cylinder(d=6.2,h=50);
    translate([wide/2,0,0]) cylinder(d=8.2,h=50);
}
