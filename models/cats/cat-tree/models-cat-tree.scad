$fn=100;

module box() {
    difference() {
        cube([330,330,330], center=true);
        cube([320,320,320], center=true);
        translate([0,-100,0]) rotate([90,0,0]) cylinder(d=260, h=100);
        
        // side hole
        translate([-200,0,0]) rotate([0,90,0]) cylinder(d=160, h=100);
    }
}

module lader() {
    translate([ 40,0,0]) cylinder(d=16, h=400, center=true);
    translate([-40,0,0]) cylinder(d=16, h=400, center=true);
    
    for(transZ=[40:40:360]) {
        translate([0,0,transZ-200])
            rotate([0,90,0])
                cylinder(d=6,h=90, center=true);
    }
}

module game1() {
    cylinder(d=2, h=500, center=true);
    for(transZ=[-30:100:360]) {
        translate([0,0,transZ-200])
            sphere(d=40);
    }
}

module game2() {
    cylinder(d=2, h=300, center=true);
    for(transZ=[0:100:200]) {
        translate([0,0,transZ-150])
            sphere(d=40);
    }
}

module hamoc() {
    rotate([90,0,0]) {
        translate([200,0,0]) cylinder(d=16,h=220);
        translate([-200,0,0]) cylinder(d=16,h=220);
    }
    
    scale([4,1,1])
        translate([0,-210,10])
            rotate([-90,15,0])
                rotate_extrude(angle=150, convexity=10) 
                    translate([50, 0]) 
                        square([3,200]);
    
    // wires
    translate([200,-10,0])
        rotate([30,45,0])
            cylinder(d=2, h=120);
    translate([200,-210,0])
        rotate([-30,45,0])
            cylinder(d=2, h=120);
    translate([-200,-10,0])
        rotate([30,-45,0])
            cylinder(d=2, h=120);
    translate([-200,-210,0])
        rotate([-30,-45,0])
            cylinder(d=2, h=120);
}

module base() {
    cube([880,390,15], center=true);
}

module model1() {
    base();
    
    translate([100,0,0]) {
        translate([150,-40,0])
            cylinder(d=80, h=220);
        translate([-40,150,0])
            cylinder(d=80, h=220);
    }

    translate([-200,0,0])    
        cylinder(d=80, h=700);

    translate([150,50,220+330/2]) {
        box();
    }

    translate([50,50,700-150])
        cylinder(d=80, h=150);

    translate([-80,50,700])
        cube([400,300,15], center=true);

    translate([-100,50,700])
        cylinder(d=80, h=250);

    translate([-100,50,950])
        cylinder(d=300,h=15, center=true);

    // translate([150,-230,160])
    //    rotate([-35,0,0])
    //        lader();

    translate([-90,90,250+200])
        game1();
}

module model2() {
    base();
    
    // right: bottom square plate
    translate([150,0,0]) {
        translate([150,-40,0])
            cylinder(d=80, h=350);
        translate([-40,150,0])
            cylinder(d=80, h=350);
        translate([50,50,350])
            cube([380,350,15], center=true);
    }
    
    // right: top round plate
    translate([150,50,350]) {
        cylinder(d=80, h=350);
        translate([0,0,350]) cylinder(d=300,h=15);
    }
    
    // left: high module
    translate([-300,0,0])    
        cylinder(d=80, h=700);
        
    translate([-300,0,705])
        rotate([90,0,220]) cylinder(d=10,h=200);
    translate([-400,120,250+300])
        game2();
    
    // hamoc
    translate([-10,90,150])
        rotate([0,0,-5])
            hamoc();
}


translate([500,0,0]) model1();

translate([-500,0,0]) model2();