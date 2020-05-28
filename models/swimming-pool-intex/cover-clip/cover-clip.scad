
$fn=100;

width=16;
thick=3.5;
rounded=1;

union() {

    translate([-0.5,9.5,0])
    rotate([0,0,-90]) 
    rotate_extrude(angle = 90, convexity = 20)
        translate([6.5,0]) 
            minkowski() {
                square([thick,width-rounded]);
                circle(d=rounded);
            }

    translate([6,8.5,0]) 
        minkowski() {
            cube([thick,30,width-rounded]);
            sphere(d=rounded);
        }
        
    translate([32,38.5,0])
    rotate([0,0,-90+35]) 
    rotate_extrude(angle = 235, convexity = 20)
        translate([45/2,0]) 
            minkowski() {
                square([thick,width-rounded]);
                circle(d=rounded);
            }
        
    translate([51.5,12.5,0])
    rotate([0,0,90+35]) 
    rotate_extrude(angle = 110, convexity = 20)
        translate([6.5,0]) 
            minkowski() {
                square([thick,width-rounded]);
                circle(d=rounded);
            }
}
