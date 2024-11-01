$fn=100;

thickness=4;
widthMid=7;
wide=25;

//#translate([0,0,4]) cube([10,30,7]);

difference() {
    union() {
        cube([wide,35,thickness]);
        translate([0,0,thickness+widthMid]) {
            translate([0,0,-0.4]) rotate([1,0,0]) cube([wide,55,thickness]);
            translate([0,35,25-thickness])
                cube([wide,20,thickness]);
        }
        translate([0,(70-thickness)/2,0])
            cube([wide,thickness*4/3,25+thickness+widthMid]);
    }
    translate([wide/2,46,0])
        cylinder(d=6.2,h=50);
    translate([wide/2,0,0]) 
        cylinder(d=8.2,h=50);
}
