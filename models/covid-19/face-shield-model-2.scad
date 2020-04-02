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

difference() {
    union() {
        // int
        translate([0,10,0]) 
            rotate([0,0,210+45-90]) 
                rotate_extrude(angle=210, convexity=10) translate([48, 0]) square([3,high]);
        
        // face left
        translate([23,-8,0]) {
            rotate([0,0,190+45]) {
                rotate_extrude(angle=170, convexity=10) translate([38, 0]) square([3,high]);
                rotate([0,0,180-30]) translate([0,-44,high/2]) clip();
                rotate([0,0,180+30]) translate([0,-44,high/2]) clip();            }
        }
        
        // face right
        translate([-23,-8,0]) {
            rotate([0,0,180-45]) {
                rotate_extrude(angle=170, convexity=10) translate([38, 0]) square([3,high]);
                rotate([0,0,180-30]) translate([0,-44,high/2]) clip();
                rotate([0,0,180+30]) translate([0,-44,high/2]) clip();
            }
        }

        // tiges gauche
        translate([47,21,0])
            rotate([0,0,20]) {
                cube([3,50,high]);
                translate([2,-4,0]) rotate([0,0,3]) cube([3,40,high]);
                translate([0,49,4]) rotate([0,90,0]) cylinder(d=8,h=3);
            }
        // tiges gauche
        translate([-47-3,21,0])
            rotate([0,0,-20]) {
                cube([3,50,high]);
                translate([2-4,-4,0]) rotate([0,0,-3]) cube([3,40,high]);
                translate([0,50,4]) rotate([0,90,0]) cylinder(d=8,h=3);
            }
     }
     
     // elastique
     translate([34,68.5,4]) rotate([0,90,20]) cylinder(d=3,h=10,center=true);
     translate([-33,68,4]) rotate([0,90,-20]) cylinder(d=3,h=10,center=true);
 }
