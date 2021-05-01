
$fn=100;

width=15;
thick=16;
rounded=1;


translate([0,0,width/2])
difference() {
    union() {
        minkowski() {
            cylinder(d=28, h=width-rounded, center=true);
            sphere(d=rounded);
        }
        translate([-16,0,-(width-rounded)/2])
            rotate([0,0,-100])
            rotate_extrude(angle = 100, convexity = 20)
            translate([15,0]) 
                minkowski() {
                    square([thick-rounded,width-rounded]);
                    circle(d=rounded);
                }
    }
    
    cylinder(d=12.3, h=width-rounded+5.01, center=true);
    
    translate([-35,-22,0]) rotate([0,90,0])
        cylinder(d=8.3, h=50, center=true);
}