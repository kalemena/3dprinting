$fn=200;

diameter=150;
h=15;
buse=0.2;
nbWings=180;
wingX=25;

module wing() {
    difference() {
        cube([wingX,buse,h], center=false);
        translate([10,+0.5,1]) rotate([90,-8,0]) cylinder(d=25,h=1, $fn=3);
    }
}

module wings() {    
    for(rotZ=[0:360/nbWings:360]) {
        rotate([0,0,rotZ])
            translate([diameter/2,0,-h/2])
                wing();
    }
}

difference() {

    union() {
        cylinder(d=diameter-buse/2, h=h, center=true);
        wings();
    }
    
    
    cylinder(d=diameter-buse, h=h+1, center=true);
}
