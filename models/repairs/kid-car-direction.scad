$fn = 50;

difference() {
    union() {
        translate([60/2,0,0]) cylinder(6.5,8.5/2,8.5/2);
        translate([-60/2,0,0]) cylinder(6.5,8.5/2,8.5/2);    
        hull() {
            translate([60/2,0,0]) cylinder(4.5,8.5/2,8.5/2);
            translate([-60/2,0,0]) cylinder(4.5,8.5/2,8.5/2);
        }
    }
    translate([60/2,0,0]) cylinder(6.5,4.8/2,4.8/2);
    translate([-60/2,0,0]) cylinder(6.5,4.8/2,4.8/2);
    translate([0,2,0]) cylinder(4.5,3.2/2,3.2/2);
}

length=32;
teeth=21;
for (i=[0:teeth]) {
    difference() {
        hull() {
            translate([-length/2+i*(length/teeth),0.5,4.5]) cylinder(r1=0.75,r2=0,2);
            translate([-length/2+i*(length/teeth),-4.5,4.5]) cylinder(r1=0.75,r2=0,2);    
        }
        translate([-length/2+i*(length/teeth)-5/2,0,3]) cube([5,5,5]);
        translate([-length/2+i*(length/teeth)-5/2,-9.25,3]) cube([5,5,5]);
    }
}