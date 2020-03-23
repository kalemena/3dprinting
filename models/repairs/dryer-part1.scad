$fn=80;

radius = 5.2/2;
inner_radius = 0;
bend_radius = 5/2;
angle_1 = 0;
angle_2 = 90;

bar1_length=6;
bar2_length=50;

module dryerBar() {
    union() {
        // lower arm
        rotate([0, 0, angle_1])
            translate([bend_radius + radius, 0.02, 0])
                rotate([90, 0, 0])
                    difference() {
                        cylinder(r=radius, h=bar2_length);
                        translate([0, 0, -1])
                            cylinder(r=inner_radius, h=bar2_length);
                    }

        // upper arm
        rotate([0, 0, angle_2])
            translate([bend_radius + radius, -0.02, 0])
                rotate([-90, 0, 0])
                    difference() {
                        cylinder(r=radius, h=bar1_length);
                        translate([0, 0, -1])
                            cylinder(r=inner_radius, h=bar1_length);
                    }
                    
        // bend
        difference() {
            // torus
            rotate_extrude()
                translate([bend_radius + radius, 0, 0])
                    circle(r=radius);

            // torus cutout
            rotate_extrude()
                translate([bend_radius + radius, 0, 0])
                    circle(r=inner_radius);
            
            // lower cutout
            rotate([0, 0, angle_1])
                translate([-bar2_length * (((angle_2 - angle_1) <= 180)?1:0), -100, -bar2_length])
                    cube([100, 100, 100]);
            
            // upper cutout
            rotate([0, 0, angle_2])
                translate([-bar1_length * (((angle_2 - angle_1) <= 180)?1:0), 0, -bar1_length])
                    cube([100, 100, 100]);
        }
    }
}

module left() {
    difference() {
        union() {
            translate([2.2,-10,0])
                cube([10,22,8], center=true);
            translate([5-0.3,0,0]) 
            hull() {
                translate([0,4,0]) cube([10/2,7,8], center=true);
                translate([0,5,5]) rotate([0,90,0]) cylinder(d=8.5, h=10/2, center=true);
            }
        }
    }
}

difference() {
    left();
    translate([0,-7.5,0]) dryerBar();
    translate([2.5,-7.5,0]) dryerBar();
    translate([0,-8,0]) cylinder(d=3.7,h=50, center=true);
    translate([0,-18,0]) cylinder(d=3.7,h=50, center=true);
    translate([0,5,5]) rotate([0,90,0]) cylinder(d=4,h=50, center=true);
}

translate([4.3,10,0]) {
    rotate([0,0,180]) {
        difference() {
            left();
            translate([4.4,-7.5,0]) rotate([0,180,0]) dryerBar();
            translate([2.2,-7.5,0]) rotate([0,180,0]) dryerBar();
            translate([4.5,-8,0]) cylinder(d=3.7,h=50, center=true);
            translate([4.5,-18,0]) cylinder(d=3.7,h=50, center=true);
            translate([4.5,5,5]) rotate([0,90,0]) cylinder(d=4,h=50, center=true);
        }
    }
}
