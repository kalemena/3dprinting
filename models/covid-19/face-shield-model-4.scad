$fn=50;

high=4;

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

module clip() {
    clipCube(5,2,high,1);
    translate([0,2.5,0]) clipCube(2,5,high,1);
}

module arc() {
    translate([0,-45,0])
        rotate([0,0,180]) {
            rotate_extrude(angle=180, convexity=10) translate([20, 0]) square([3,high]);
            rotate([0,0,180]) translate([0,-25,high/2]) clip(); 
        }
}

union() {
    // int
    translate([0,10,0]) {
        rotate([0,0,210+45-90]) 
            rotate_extrude(angle=210, convexity=10) translate([48, 0]) square([3,high]);
        
        rotate([0,0,60])  arc();
        rotate([0,0,-60]) arc();
        rotate([0,0,25])  arc();
        rotate([0,0,-25]) arc();
    }

    // right
    translate([47,21,0])
        rotate([0,0,20]) {
            cube([3,50,high]);
            //translate([2,-4,0]) rotate([0,0,3]) cube([3,40,high]);
        }
    translate([36,67,high/2]) rotate([0,0,20+90]) clip();
        
    // left
    translate([-47-3,21,0])
        rotate([0,0,-20]) {
            cube([3,50,high]);
            //translate([2-4,-4,0]) rotate([0,0,-3]) cube([3,40,high]);
        }
    translate([-36,67,high/2]) rotate([0,0,-20-90]) clip();
}
