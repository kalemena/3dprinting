
$fn=100;

top_diameter_ext=24;

base_diameter_ext=28;

width=15;
thick=14;
rounded=1;


module laptopStandBase() {
    translate([0,0,width/2])
    difference() {
        union() {
            minkowski() {
                cylinder(d=base_diameter_ext, h=width-rounded, center=true);
                sphere(d=rounded);
            }
            translate([-14,0,-(width-rounded)/2])
                rotate([0,0,-90])
                rotate_extrude(angle = 90, convexity = 20)
                translate([15,0]) 
                    minkowski() {
                        square([thick-rounded,width-rounded]);
                        circle(d=rounded);
                    }
        }
        
        cylinder(d=12.3, h=width-rounded+5.01, center=true);
        
        translate([-14+4,-30,0]) rotate([90,0,0]) cylinder(d=3.3, h=width-rounded+5.01, center=true);
        
        translate([0,10,0]) rotate([90,0,0]) cylinder(d=3.3, h=width-rounded+5.01, center=true);
        
        translate([-39+8,-21.5,0]) rotate([0,90,0])
            cylinder(d=8.3, h=50, center=true);
    }
}

module laptopStandTop() {
    translate([0,0,width/2])
    difference() {
        hull() {
            minkowski() {
                cylinder(d=top_diameter_ext, h=width-rounded, center=true);
                sphere(d=rounded);
            }
            translate([(width-rounded)*2/3,0,0])
            minkowski() {
                cube([width-rounded-2,width-rounded-2,width-rounded], center=true);
                sphere(d=rounded);
            }
        }
        
        cylinder(d=12.3, h=width-rounded+5.01, center=true);
        
        translate([41-8,0,0]) rotate([0,90,0])
            cylinder(d=8.3, h=50, center=true);
        
        translate([-14+4,0,0]) rotate([0,90,0]) cylinder(d=3.3, h=width-rounded+5.01, center=true);
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