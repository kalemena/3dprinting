
$fn=100;

width=15;
thick=16;
rounded=1;


module laptopStandBase() {
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
            translate([15,0]) 
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

}

module laptopStandTop() {
    translate([0,0,width/2])
    difference() {
        hull() {
            minkowski() {
                cylinder(d=28, h=width-rounded, center=true);
                sphere(d=rounded);
            }
            translate([15,0,0])
            minkowski() {
                cube([10,width-rounded,width-rounded], center=true);
                sphere(d=rounded);
            }
        }
        
        cylinder(d=12.3, h=width-rounded+5.01, center=true);
        
        translate([35,0,0]) rotate([0,90,0])
            cylinder(d=8.3, h=50, center=true);
    }
}

color([0.3,0.3,0.3])
translate([-60,-15,(width-rounded)/2]) 
    rotate([0,90,-10]) 
    cylinder(d=8, h=100, center=true);
laptopStandBase();
translate([-125,-4,0]) 
    rotate([0,0,-10])
    laptopStandTop();