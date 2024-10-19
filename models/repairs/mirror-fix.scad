
$fn=100;
width=4;

module mirror_fix() {
    
    difference() {
        minkowski() {
            cube([185-30,135-30,width], center=true);
            cylinder(d=30,h=0.001);
        }
        
        translate([0,0,width-1.5])
            cube([171,121,width], center=true);
        
        cube([171-6,121-6,width], center=true);
    }    
}

mirror_fix();