$fn = 100;

soap_diameter=75;
soap_high=15;

module soap_holder() {    
    difference() {
        cylinder(d=soap_diameter + 3*2, h=soap_high+2);
        translate([0,0,11.01]) 
            minkowski() {
                cylinder(d=soap_diameter-20, h=soap_high);
                sphere(d=20);
            }
        translate([0,0,20]) {
            for(rotZ=[0:72:360]) {
                rotate([90,0,rotZ]) cylinder(d=25, h=50);
            }        
        }
    }
}

module soap_fix() {
    difference() {
        cylinder(d1=soap_diameter + 3*2, d2=40, h=40);
        translate([0,0,35/2+5]) cube([90,30.5,35], center=true);
    }
}

soap_holder();
rotate([0,180,120]) soap_fix();
