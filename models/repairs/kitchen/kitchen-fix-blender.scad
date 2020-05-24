
union() {
    cube([3.5,14,3], center=true);
    translate([0,0,2.5]) cube([3.5,3.4,3], center=true);
    translate([1.25,5.75,-1]) cube([6,2.5,5],  center=true);
    translate([1.25,-5.75,-1]) cube([6,2.5,5],  center=true);    
}