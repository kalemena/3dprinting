
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

module part(length) {

    rotate([0,0,180])
        laptopStandTop();

    color([0.4,0.4,0.4]) {
        translate([-length/2-(width-rounded)/2,0,(width-rounded)/2]) 
        rotate([0,90,0]) 
        cylinder(d=8, h=length, center=true);
    }
    
    translate([-length-15,-21.5,0]) 
        rotate([0,0,180])
        laptopStandBase();
}

rotate([0,90,0]) {
    part(160);
    translate([0,0,240-15]) part(160);

    translate([0,0,15])
    rotate([0,0,-45]) {
        mirror([0,1,0]) part(135);
        translate([0,0,210-15]) mirror([0,1,0]) part(135);
    }

    color([0.4,0.4,0.4]) {
        cylinder(d=12, h=240);
        translate([-175,-20,0]) cylinder(d=12, h=240);
        translate([-90,120,15]) cylinder(d=12, h=210);
    }
}