$fn=100;

L=34;
l=31.5;
h=65;
width=2;

minkowski=2;

difference() {

    union() {
        minkowski() { 
            cube([L-minkowski,l-minkowski,h-minkowski], center=true); 
            sphere(d=minkowski);
        }
        
        translate([0,0,-h/2-4.5])
            cube([L,l,12], center=true);
    }
    
    translate([0,3,2])
        cube([L-5,l+2,h-8], center=true);
    
    translate([0,0,-37]) {
        rotate([90,0,0])
            cylinder(d=7,h=50, center=true);
        rotate([0,90,0])
            cylinder(d=7,h=50, center=true);
    }
    
    translate([ 0,8,30]) {
        translate([ 8,0,0])
            cylinder(d1=3, d2=10,h=5);
        translate([-8,0,0])
            cylinder(d1=3, d2=10,h=5);
    }
    
    translate([(L+width)/2-1,0,7])
        cylinder(d=3, h=70+width*2,center=true);
        
    translate([-L/2,0,-h/2+3]) rotate([90,0,0]) cylinder(d=3, h=50, center=true);
    translate([L/2,0,-h/2+3]) rotate([90,0,0]) cylinder(d=3, h=50, center=true);
    translate([0,-l/2,-h/2+3]) rotate([0,90,0]) cylinder(d=3, h=50, center=true);
    translate([0,l/2,-h/2+3]) rotate([0,90,0]) cylinder(d=3, h=50, center=true);

}
