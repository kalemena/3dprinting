$fn=100;

L=34;
l=31.5;
h=70;
width=2;

minkowski=2;

difference() {

    union() {
        minkowski() { 
            cube([L-minkowski,l-minkowski,h-minkowski], center=true); 
            sphere(d=minkowski*2);
        }
        
        translate([0,0,-h/2-5])
            cube([L+width*2,l+width*2,12], center=true);
    }
    
    translate([0,2,0])
        cube([L-width,l+2,h-width*2], center=true);
    
    translate([0,0,-40]) {
        rotate([90,0,0])
            cylinder(d=7,h=50, center=true);
        rotate([0,90,0])
            cylinder(d=7,h=50, center=true);
    }
    
    translate([ 8,8,33])
        cylinder(d1=3, d2=10,h=5);
    translate([-8,8,33])
        cylinder(d1=3, d2=10,h=5);
    
    translate([(L+width)/2,0,3])
        cube([2,2,70+width*2],center=true);
    
    
    translate([-L/2-width/2,0,-h/2+2]) rotate([90,0,0]) cylinder(d=2, h=50, center=true);
    translate([L/2+width/2,0,-h/2+2]) rotate([90,0,0]) cylinder(d=2, h=50, center=true);
    translate([0,-l/2-width/2,-h/2+2]) rotate([0,90,0]) cylinder(d=2, h=50, center=true);
    translate([0,l/2+width/2,-h/2+2]) rotate([0,90,0]) cylinder(d=2, h=50, center=true);

}
