module clipX(sizeX, cornerD) {
    hull() {
         translate([-(sizeX-cornerD)/2,0,0]) sphere(d=cornerD);
         translate([(sizeX-cornerD)/2,0,0]) sphere(d=cornerD);
    }
}

module clipFace(sizeX, sizeY, cornerD) {
    hull() {
         translate([0,-(sizeY-cornerD)/2,0]) clipX(sizeX,cornerD);
         translate([0,(sizeY-cornerD)/2,0]) clipX(sizeX,cornerD);
    }
}

module clipCube(sizeX,sizeY,sizeZ,cornerD) {
    hull() {
         translate([0,0,-(sizeZ-cornerD)/2]) clipFace(sizeX,sizeY,cornerD);
         translate([0,0,(sizeZ-cornerD)/2]) clipFace(sizeX,sizeY,cornerD);
    }
}

module clip(high) {
    clipCube(5,2,high,1);
    translate([0,2.5,0]) clipCube(2,5,high,1);
}

module faceShieldBase(high,width) {
    union() {
        translate([0,10,0]) {
            rotate([0,0,210+45-90]) 
                rotate_extrude(angle=210, convexity=10) translate([65, 0]) 
                    square([width,high]);
        }
        
        // right
        translate([63+0.2,25,0])
            rotate([0,0,12]) {
                cube([width,65,high]);
                //translate([2,-4,0]) rotate([0,0,3]) cube([3,40,high]);
            }
        translate([56,86,high/2]) rotate([0,0,12+90]) clip(high);
            
        // left
        translate([-63-3.75,25,0])
            rotate([0,0,-12]) {
                cube([width,65,high]);
                //translate([2-4,-4,0]) rotate([0,0,-3]) cube([3,40,high]);
            }
        translate([-56,86,high/2]) rotate([0,0,-12-90]) clip(high);
    }
}

$fn=80;

faceShieldBase(6,3.5);