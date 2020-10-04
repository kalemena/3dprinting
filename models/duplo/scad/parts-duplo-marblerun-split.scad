// Duplo-compatible marble run pieces (C) by Daniel Schwering 2017
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
// The duplo-marblerun base is derived from https://www.thingiverse.com/thing:159219
include <duplo-block-lib.scad>
include <duplo-marblerun.scad>

quality = 50; // quality: low/fast (e.g. 10) for design, high/slow (e.g. 50) for final rendering 
wall=2;
inset=1;
//13 = 16-wall-inset
innerRadius=13*dr/16;
outerRadius=15*dr/16;
center=innerRadius+6.25-duploHeight;
handleRadius=1.5;

union(){
    split();
    translate([dr*1.5,-dr*1.5,duploHeight*2+2])duplonibble();
    //translate([-dr*1.5,-dr*0.5,duploHeight*2+2])duplonibble();
    //translate([dr*1.5,-dr*0.5,duploHeight*2+2])duplonibble();
    translate([-dr*1.5,-dr*1.5,duploHeight*2+2])duplonibble();
}

color("green") translate([dr*2.5,-21,0])switch();

module switch(){
    switchHeight=3;
    difference(){
        union(){
            translate([-1,-1,0])cube([2,42,switchHeight-0.5]);
            translate([-4,-1,0])cube([8,2,switchHeight-0.5]);
            translate([0,0,switchHeight])cylinder(h=0.5,r=handleRadius+1,$fn=20);
            cylinder(h=switchHeight+2+duploWall,r=handleRadius,$fn=20);
            translate([0,0,switchHeight+duploWall])cylinder(h=1,r1=handleRadius,r2=handleRadius+0.2,$fn=20);
            translate([0,0,switchHeight+1+duploWall])cylinder(h=1,r1=handleRadius+0.2,r2=handleRadius,$fn=20);
        }
        color("pink") union(){
            translate([-0.2,-2,switchHeight+duploWall])cube([0.4,4,3]);
            translate([-2,-0.2,switchHeight+duploWall])cube([4,0.4,3]);
        }
    }
}

module split(){
    //difference() {
        difference() {
            difference() {
                union() {
                    translate([0,0,duploHeight]) duplo(4,4,2);
                    intersection(){
                        y(innerRadius+wall);
                        translate([-dr*2+gapBetweenBricks,-dr*2+gapBetweenBricks,0]) cube([dr*4-gapBetweenBricks*2,dr*4-    gapBetweenBricks*2,duploHeight*2]);
                    }
                }
            color("red")
                y(innerRadius);
            }
            color("blue") translate([-dr/2,dr/4,duploHeight*3]) rotate([0,90,0]) cylinder(h=dr,r=dr);
        }
         /*color("green") translate([0,dr*1.75,duploHeight*2-4])cylinder(h=5,r=handleRadius+0.1,$fn=20);
    }*/
}

module y(radius) {
    translate([0,0,duploHeight*2]) union(){
        s(radius,1);
        s(radius,-1);
    }
}

module s(radius, dir){
        translate([0,-2*dr-0.3,0])
            for(i=[0:250/quality:250]) {
                translate([dir*(cos(i)-1)*dr/2,+i/180*dr*4,0]) 
                    multmatrix(m = [[1, -dir*sin(i)*0.4, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) 
                        rotate([-90,0,0]) cylinder(h=(dr/2)*dr/quality,r=radius, $fn=quality);
            }
}