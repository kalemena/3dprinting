// Duplo-compatible marble run extended pieces (C) by Keisuke Oohashi 2017
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.
// 

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
// The duplo-marblerun is derived from https://www.thingiverse.com/thing:159219
include <duplo-block-lib.scad>
include <duplo-marblerun.scad>

innerRadius=14*dr/16;
quality = 50;

// This is not marble run system, but it support building a higher marble run corce. then it can print in less time.
poll(8);
//pollBridge(5,1,1);

module poll(height=1) {
    length = 2;
    width = 2;
    effWidth = 2 * duploRaster-gapBetweenBricks;
    ns = duploRaster / 2;  //nibble start offset
    translate([0,0, duploHeight/2]) duploBottomNibbles(width, length, 1);
    difference() {
      translate([0,0, height * duploHeight/2]) cylinder(r=effWidth/2.4, h=height * duploHeight, center=true, $fn=quality);
      translate([0,0,-0.1]) cylinder(r=10,h=7,center=false,$fn = quality);
      cylinder(r=6,h=height * duploHeight,center=false,$fn = quality);

      for(j=[1:length]) {
        for (i = [1:width]) {
          // disabled
          translate([ns-(i-width*0.5)*dr,ns-(j-length*0.5)*dr,-0.1]) {
            cylinder(r=duploNibbleRadius+0.1,h=7,center=false,$fn = quality);
            cylinder(r=duploNibbleRadius+0.2,h=0.5,center=false,$fn = quality);
          }
        }
      }
    }
    intersection() {
      duploTopNibbles(width, length, height * 2);    
      translate([0,0, height * duploHeight]) cylinder(r=effWidth/2.4, h=height * duploHeight, center=false, $fn=quality);
    }
}

module pollBridge(width, length, height) 
{   
    ns = duploRaster / 2;  //nibble start offset
    difference() {
    for(j=[1:length]) {
        for( i = [1:width]) {
            
            translate([ns-(i-width*0.5)*dr,ns-(j-length*0.5)*dr,0])  poll(height);
        }
    }
    for(j=[1:length]) {
        for(i = [1:width]) {
            translate([ns-(i-width*0.5)*dr,ns-(j-length*0.5)*dr,0]) translate([0,0,height * duploHeight / 3]) cylinder(r=6,h=70,center=false,$fn = quality);

        }
    }
        
    }
}


