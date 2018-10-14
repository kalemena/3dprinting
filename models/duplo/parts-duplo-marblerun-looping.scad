// Duplo-compatible marble run pieces (C) by Daniel Schwering 2017
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
// The duplo-marblerun base is derived from https://www.thingiverse.com/thing:159219
include <duplo-block-lib.scad>
include <duplo-marblerun.scad>

quality = 50; // quality: low/fast (e.g. 10) for design, high/slow (e.g. 90) for final rendering 
wall=2;
inset=1;
//13 = 16-wall-inset
innerRadius=13*dr/16;
outerRadius=15*dr/16;
center=innerRadius+6.25-duploHeight;

looping(steps=quality);
//loop(steps=quality);

module looping(steps)
{
    //translate([-dr,0,innerRadius+6]) rotate([90,0,0]) color([128,0,0,128])cylinder(h=2*dr,r=innerRadius,$fn=steps);
    translate([0,0,duploHeight])
    union() {
        translate([2*dr,dr,0]) halfpipe(steps);
        halfpipe(steps);
        halfloop(steps);
        difference() {
            duplo(4,2,2,false,false);
            union() {
                translate([2*dr,dr+1,0])pipe(steps);
                translate([0,1,0])pipe(steps);
                loop(steps);
            }
        }
    }
}
module halfpipe(steps){
    difference(){
        difference(){
            translate([-dr,0,center]) rotate([90,0,0]) cylinder(h=dr,r=outerRadius, $fn=steps);
            translate([-dr,dr/2,center]) rotate([90,0,0]) cylinder(h=2*dr,r=innerRadius,$fn=steps);
        }
        translate([-2.5*dr,-1.5*dr,duploHeight]) cube([3*dr,2*dr,2*dr]);
    }
}
module pipe(steps){
    translate([-dr,-1,center]) rotate([90,0,0]) cylinder(h=dr+1,r=outerRadius-0.01, $fn=steps);
}
module halfloop(steps)
{
    translate([-dr,0,dr*5/8+center])
    rotate([90/steps,0,0])
    rotate([90,90,0])
    union(){
        for(i=[0:90/steps:360])
        {
            rotate([0,i,0])
            translate([dr*5/8,dr*(1-cos(i/2)),0])
            multmatrix(m = [[1, 0, -cos(i/4)/8, 0], [0, 1, -sin(i/2)/4, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) 
            difference(){
                difference(){
                    cylinder(h=50/steps,r=outerRadius*(1+sin(i/2)/4), $fn=steps);
                    translate([0,0,-25/steps])
                    cylinder(h=100/steps,r=innerRadius*(1+sin(i/2)/4), $fn=steps);
                }
                translate([-2*dr+5+inset-wall-4*cos(i),-2*dr-1,-2])cube([2*dr,4*dr+2,5]);
            }
        };
    }
}
module loop(steps)
{
    translate([-dr,0,dr*5/8+center])
    rotate([90/steps,0,0])
    rotate([90,90,0])
    union(){
        for(i=[0:90/steps:360])
        {
            rotate([0,i,0])
            translate([dr*5/8,dr*(1-cos(i/2)),0])
            multmatrix(m = [[1, 0, -cos(i/4)/8, 0], [0, 1, -sin(i/2)/4, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) 
            cylinder(h=50/steps,r=outerRadius*(1+sin(i/2)/4)-0.01, $fn=steps);
        };
    }
}