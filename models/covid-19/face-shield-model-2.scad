include <face-shield-lib.scad>

$fn=100;
high=6;
width=3.5;

module arc(high,width) {
    translate([0,-43,0])
        rotate([0,0,180]) {
            
            scale([1,1.3,1]) 
                rotate_extrude(angle=180, convexity=10) 
                    translate([50, 0]) 
                        square([width,high]);
            
            // clip left
            rotate([0,0,180+30]) 
                translate([0,-67,high/2]) 
                    rotate([0,0,10]) 
                        clip(high);
            
            // clip right
            rotate([0,0,180-45]) 
                translate([0,-62,high/2]) 
                    rotate([0,0,-13]) 
                        clip(high); 
        }
}

union() {
    faceShieldBase(high,width);
    
    // 2 frontal arcs
    translate([0,10,0]) {
        rotate([0,0,-40]) arc(high,3);
        translate([0,0,high]) rotate([0,180,40])  arc(high,3);
    }
}
