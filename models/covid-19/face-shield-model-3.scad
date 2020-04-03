$fn=80;

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

union() {
    // int
    translate([0,10,0]) 
        rotate([0,0,210+45-90]) 
            rotate_extrude(angle=210, convexity=10) translate([48, 0]) square([3,high]);
    
    // face right
    translate([-38,-5,0]) {
        rotate([0,0,180-60]) {
            rotate_extrude(angle=170, convexity=10) translate([25, 0]) square([3,high]);
            rotate([0,0,175]) translate([0,-30,high/2]) clip();          
        }
    }
    
    // face left
    translate([38,-5,0]) {
        rotate([0,0,-60-48]) {
            rotate_extrude(angle=170, convexity=10) translate([25, 0]) square([3,high]);
            rotate([0,0,175]) translate([0,-30,high/2]) clip();          
        }
    }
    
    // face center
    translate([0,-30,0]) {
        rotate([0,0,185]) {
            rotate_extrude(angle=170, convexity=10) translate([25, 0]) square([3,high]);
            rotate([0,0,175]) translate([0,-30,high/2]) clip();           
        }
    }

    // tiges gauche
    translate([47,21,0])
        rotate([0,0,20]) {
            cube([3,50,high]);
            translate([2,-4,0]) rotate([0,0,3]) cube([3,40,high]);
            //translate([0,49,4]) rotate([0,90,0]) cylinder(d=8,h=3);
        }
    // tiges gauche
    translate([-47-3,21,0])
        rotate([0,0,-20]) {
            cube([3,50,high]);
            translate([2-4,-4,0]) rotate([0,0,-3]) cube([3,40,high]);
            //translate([0,50,4]) rotate([0,90,0]) cylinder(d=8,h=3);
        }
        
    translate([-36,67,high/2]) rotate([0,0,-20-90]) clip();
    translate([36,67,high/2]) rotate([0,0,20+90]) clip();
 }
