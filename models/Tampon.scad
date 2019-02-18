
WIDTH=35;
LENGTH=65;

module handle() {
    rotate(90, [0, 0, 1]) {
        difference() {
            cube(size = [6,WIDTH-WIDTH*0.3,10], center = true);
            
            translate([101,0,0]) cylinder(h = 10.1, r = 100, $fn=700, center = true);
            translate([-101,0,0]) cylinder(h = 10.1, r = 100, $fn=700, center = true);
        }
    }    
}

module arrow() {
    // arrow
    rotate([0,0,-135]) {
        cube([5, 1.5, 1.5], center = true);
        translate ([1.75,1.75,0]) cube([1.5, 5, 1.5], center = true);
    }
}

union () {
    // scale([1.8, 1.8, 1.8]) translate([2.2,-1,1.5]) import("elf_mage_by_nicoledelancret.stl", convexity=3);
    translate([-WIDTH/2,-LENGTH/2,0]) cube([WIDTH,LENGTH,3]);
    
    translate([0,3*-LENGTH/7,7.25]) handle();    
    translate([0,3*LENGTH/7,7.25]) handle();    
    
    translate([- WIDTH/3,4*-LENGTH/13,3]) arrow();
    translate([- WIDTH/3,4*LENGTH/13,3]) arrow();
}