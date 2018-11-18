// Duplo-compatible marble run pieces (C) by Joachim Eibl 2013
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.

// Version 2 (added longRampPiece and cosinusSlopedRampPiece)
// Turn, Half Ramp, Cones added by Thomas Rauscher

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
include <duplo-block-lib.scad>

quality = 50; // quality: low/fast (e.g. 10) for design, high/slow (e.g. 50) for final rendering 
innerRadius=14*dr/16;

//straightPiece(2);
//straightHolePiece(3); 
//crossingPiece();
//endPiece();
//cornerPiece();
//cornerHolePiece(); 
//ramp(2,4);
//cosinusSlopedRampPiece();
//rampCornerPiece(steps=quality);
//halfRampCornerPiece(steps=quality);
//rampTurnPiece(steps=quality);
//rampCornerPiece2(steps=quality);
//zigZaglongRampPiece(steps=quality);
//zigZaglongRampPiece2(steps=quality);
//zigZaglongRampPiece3(steps=quality);
//ramp2HolePiece(steps=quality);
//longRampPiece3(steps=quality);
//conePiece3(3,support=0); // can be 3, 4 or 5

module duploMarbleRunBase(width,length,height,topNibbles,bottomHoles) {
   union() {
      duplo(width,length,height,topNibbles,bottomHoles);
      translate([0,0,3])
         cube([width*duploRaster-0.4,length*duploRaster-0.4,duploHeight*height-6],center=true);
   }
}

module straightPiece(length=2) {
   difference() {
      duploMarbleRunBase(2,length,2,false);
      translate([0,dr*length+1, duploHeight+2]) rotate([90,0,0])
         cylinder( duploRaster*2 * length, innerRadius, innerRadius,$fn = quality*2 );
   }
}

module straightHolePiece(length=2) {
   difference() {
     duploMarbleRunBase(2,length,4,true);
     translate([0,dr*length+1, 0*duploHeight+2]) rotate([90,0,0])
       cylinder( duploRaster*2 * length, innerRadius, innerRadius,$fn = quality*2 );
   }
}

module crossingPiece() {
   difference() {
      duploMarbleRunBase(2,2,2,false);
      translate([0,dr+1, duploHeight+2]) rotate([90,0,0])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
      translate([-dr-1,0, duploHeight+2]) rotate([0,90,0])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
   }
}

module endPiece() {
   difference() {
      duploMarbleRunBase(2,2,2,false);
      union() {
         translate([0,dr+2, duploHeight+2]) rotate([90,0,0])
            cylinder( dr+2, innerRadius, innerRadius,$fn = quality*2 );
         translate([0,0, duploHeight+2]) rotate([90,0,0])
            sphere( innerRadius, $fn = quality*2 );
      }
   }
}

module cornerPiece() {
   difference() {
      duploMarbleRunBase(2,2,2,false);
      translate([-dr,-dr,duploHeight+2])rotate_extrude(convexity = 10, $fn = quality*2)
         translate([dr, 0, 0]) circle(r = innerRadius, $fn = quality*2);
   }
}

module cornerHolePiece() {
   difference() {
      duploMarbleRunBase(2,2,4,true);
        translate([-dr,-dr,0*duploHeight+2])rotate_extrude(convexity = 10, $fn = quality + 2)
         translate([dr, 0, 0]) circle(r = innerRadius, $fn = quality*2);
   }
}

module rampPiece() {
   angle = 30.964; // 180 / 3.14159 * atan(duploHeight/duploRaster);
   vscale = 0.8575; // cos(angle);
   difference() {
      duploMarbleRunBase(2,2,4,false);
      
      union() {
         translate([0,dr+1, 2*duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
            cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );   
         translate([-2*dr,dr+0, 2*duploHeight+0]) rotate([90+angle,0,0])
            cube( [duploRaster*4,duploRaster*8,duploRaster*4] );   
      }
   }
}

module ramp(length=2, height=4) {
   angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);
   wireDiam = 3;
   difference() {
      duploMarbleRunBase(2,length,height,false,false);      
      union() {
         translate([0,((4-length)/2)*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  cylinder( duploRaster*6, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,length*dr+0, (length/2) * 1.5*duploHeight+0]) rotate([90+angle,0,0])
                  cube( [duploRaster*4,duploRaster*4,duploRaster*2*length] );
      }
   }
}

module cosinusSlopedRampPiece() {
   difference() {
      duploMarbleRunBase(2,4,4,false);
      cosinusSlopedRamp(quality);      
   }
}

// internal
module cosinusSlopedRamp(steps) // nr of steps: e.g. coarse=10, fine=90
{
   translate([0,-2*dr,duploHeight])
   for(i=[0:180/steps:180])
   {
      translate([0,+i/180*dr*4-0.01,-cos(i)*duploHeight+2]) 
      multmatrix(m = [ [1, 0, 0, 0], [0, 1, 0, 0], [0, sin(i)*0.5, 1, 0], [0, 0, 0, 1] ]) 
      union() {
         rotate([-90,0,0]) cylinder(h=4.1*dr/steps,r=innerRadius, $fn=steps);
         translate([-dr,0,-2]) cube([4*dr,4.1*dr/steps,2*dr]);
      }
   }
}

module rampCornerPiece(steps) {
   difference() {
      duploMarbleRunBase(2,2,4,true);
      cornerRamp(steps);      
   }
}

module halfRampCornerPiece(steps) {
   difference() {
      duploMarbleRunBase(2,2,4,false);
      cornerHalfRamp(steps);      
   }
}

module rampTurnPiece(steps) {
   difference() {
      duploMarbleRunBase(4,2,4,false);
//      cornerHalfRamp(steps);      
      turnRamp(steps);      
   }
//      trunRamp(steps);
}

// internal
module cornerRamp(steps) // nr of steps: e.g. coarse=10, fine=90
{
   translate([-dr,-dr,2])
   for(i=[0:90/steps:90])
   {
      rotate([0,0,i]) translate([dr,0,i/90*2*duploHeight]) {
         // Using the rotate&shearing matrix produces nicer results with less steps.
         multmatrix(m = [ [1, 0, 0, 0], [0, 0, 1, -50/steps], [0, 1, 0.4, 0], [0, 0, 0, 1] ]) 
             union() {
                cylinder(h=50/steps,r=innerRadius, $fn=steps);
                translate([-dr,-2,0]) cube([4*duploRaster,4*duploRaster,70/steps]);
             }
      }
   }
}

// internal
module cornerHalfRamp(steps) // nr of steps: e.g. coarse=10, fine=90
{
   translate([-dr,-dr,2])
   for(i=[0:90/steps:90])
   {
      rotate([0,0,i]) translate([dr,0,i/90*2*duploHeight/2]) {
         // Using the rotate&shearing matrix produces nicer results with less steps.
         multmatrix(m = [ [1, 0, 0, 0], [0, 0, 1, -50/steps], [0, 1, 0.4/2, 0], [0, 0, 0, 1] ]) 
             union() {
                cylinder(h=50/steps,r=innerRadius, $fn=steps);
                translate([-dr,-2,0]) cube([4*duploRaster,4*duploRaster,70/steps]);
             }
      }
   }
}

module rampCornerPiece2(steps)
{
   difference() {
      duploMarbleRunBase(2,2,6,true);
      translate([0,0, -duploHeight])cornerRamp2(steps);      
   }
}

// internal
module cornerRamp2(steps) // nr of steps: e.g. coarse=10, fine=90
{
   translate([-dr,-dr,2])
   for(i=[0:90/steps:90])
   {
      rotate([0,0,i]) translate([dr,0,i/90*2*duploHeight]) {
         // Using the rotate&shearing matrix produces nicer results with less steps.
         multmatrix(m = [ [1, 0, 0, 0], [0, 0, 1, -50/steps], [0, 1, 0.4, 0], [0, 0, 0, 1] ]) 
             union() {
                cylinder(h=50/steps,r=innerRadius, $fn=steps);
                if (i%2==1) {
                    translate([dr/2,-2,0]) cube([2*duploRaster,duploRaster,70/steps+ 1]);
                }
             }
      }
   }
}

module zigZaglongRampPiece() {
   angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   //angle = atan(0.25*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);

   translate([dr,3*dr,dr ]) rotate([90+angle, -angle, 30]) cube([dr+20, 10, 2], center=true);
   translate([-dr + 5,dr ,dr -10]) rotate([90, -angle, 90+60]) cube([dr+15, 10, 2], center=true);
   translate([dr,-dr,-3]) rotate([90+angle, -angle, 30]) cube([dr+20, 10, 2], center=true);
   difference() {
      duploMarbleRunBase(4,8,8,false);      
      union() {

        translate([0, -6*duploHeight - 3, -duploHeight - 4 ]) rotate([90 + angle,0,0])linear_extrude(height = 2*dr, center = true, scale=[1/6,1], $fn=100, slices=30)  scale([3,1,1]) square([innerRadius + 2, innerRadius], center=true);


//         translate([0, -6*duploHeight - 3, -duploHeight + 1.2 ]) rotate([90 + angle,0,0])linear_extrude(height = 2*dr, center = true, scale=[1/3,1], $fn=100, slices=30)  scale([2,1,1]) circle(d=1.5*dr);
         translate([0,0, 4*duploHeight - dr/2+0.3])  rotate([90+angle,0,0])
                  translate([0, 0, 0]) cube( [duploRaster*3,duploRaster*4,duploRaster*7] , center=true);
         translate([0,0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  translate([0, 0, -50]) cylinder( duploRaster*3, innerRadius, innerRadius,, center=true, $fn = quality*2 );     

         translate([0,0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  translate([0, 0, 50]) cylinder( duploRaster*3, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,4*dr+0, 3*duploHeight+0]) rotate([90+angle,0,0])
                  translate([0, 0, -10]) cube( [duploRaster*6,duploRaster*4,duploRaster*10] );       
      }
   }
}

module zigZaglongRampPiece2() {
   //angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   angle = atan(0.125*duploHeight/duploRaster);
   vscale = cos(angle);//0.9578; // cos(angle);

   translate([dr,2.5*dr,dr -12]) rotate([90+angle, -angle, 20]) cube([dr+15, 7, 3], center=true);
   translate([-dr + 3, 6 ,dr -14]) rotate([90, -angle, 90+70]) cube([dr+15, 7, 3], center=true);
   translate([dr, -dr * 1.5,-1]) rotate([90+angle, -angle, 20]) cube([dr+15, 7, 3], center=true);
   difference() {
      duploMarbleRunBase(4,8,3,false);      
      union() {

        translate([0, -6*duploHeight-.8, 0.6 ]) rotate([90 + angle - 5,0,0])linear_extrude(height = 17, center = true, scale=[0.1,1], $fn=100, slices=30)  scale([3,1,1]) square([innerRadius + 5, innerRadius], center=true);


         //translate([0, -6*duploHeight - 3, 5 ]) rotate([90 + angle,0,0])linear_extrude(height = 2*dr, center = true, scale=[1/3,1], $fn=100, slices=30)  scale([2,1,1]) circle(d=1.5*dr);
         translate([0,3, 4*duploHeight - dr/2 - 0.8])  rotate([90+angle,0,0])
            translate([0, 0, 0]) cube( [duploRaster*3.5 + 3,duploRaster*4,duploRaster*7 ] , center=true);
         translate([0,0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  translate([0, 0, -50]) cylinder( duploRaster*3, innerRadius, innerRadius,, center=true, $fn = quality*2 );     

         translate([0,0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  translate([0, 0, 50]) cylinder( duploRaster*3, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,4*dr+0, 1.5*duploHeight-4]) rotate([90+angle,0,0])
                  translate([0, 0, -10]) cube( [duploRaster*6,duploRaster*4,duploRaster*10] );       
      }
   }
}

module zigZaglongRampPiece3() {
   //angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   angle = atan(0.25*duploHeight/duploRaster);
   vscale = cos(angle);//0.9578; // cos(angle);

   translate([dr,1.5 * dr + 3,dr -11]) rotate([90+angle, -angle, 30]) cube([dr+15, 8, 3], center=true);
   translate([-dr - 1, 0 ,dr -15]) rotate([90, -angle, 90+60]) cube([dr+15, 8, 3], center=true);
   translate([dr, -dr * 1.7 ,-4]) rotate([90+angle, -angle, 30]) cube([dr+15, 8, 3], center=true);
   difference() {
      duploMarbleRunBase(4,6,4,false);      
      union() {

        //translate([0, -6*duploHeight-.8, 0.6 ]) rotate([90 + angle - 5,0,0])linear_extrude(height = 17, center = true, scale=[0.1,1], $fn=100, slices=30)  scale([3,1,1]) square([innerRadius + 5, innerRadius], center=true);


         //translate([0, -6*duploHeight - 3, 5 ]) rotate([90 + angle,0,0])linear_extrude(height = 2*dr, center = true, scale=[1/3,1], $fn=100, slices=30)  scale([2,1,1]) circle(d=1.5*dr);
         translate([0,-3, 4*duploHeight - dr/2 - 0.8])  rotate([90+angle,0,0])
            translate([0, 0, 0]) cube( [duploRaster*3.5 + 4,duploRaster*4 + 0.5 ,duploRaster*5.5 + 3 ] , center=true);
         translate([dr,0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  translate([0, 0, -50]) cylinder( duploRaster*3, innerRadius, innerRadius,, center=true, $fn = quality*2 );     

         translate([-dr, 0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  translate([0, 0, 50]) cylinder( duploRaster*3, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,4*dr+0, 2*duploHeight]) rotate([90+angle,0,0])
                  translate([0, 0, -10]) cube( [duploRaster*6,duploRaster*4,duploRaster*10] );       
      }
   }
}

module ramp2HolePiece()
{
   angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);
   difference() {
      duploMarbleRunBase(2,2,5,true);      
      union() {
         translate([0,dr+1, duploHeight/2+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  cylinder( duploRaster*6, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         //translate([-2*dr,2*dr+0, 1.5*duploHeight+0]) rotate([90+angle,0,0])
                  //cube( [duploRaster*4,duploRaster*4,duploRaster*4] );       
      }
   }
}

module longRampPiece3()
{
   angle = atan(1/2*duploHeight/duploRaster);//16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   vscale = cos(angle);//0.9578; // cos(angle);
   difference() {
      duploMarbleRunBase(2,3,4,false);      
      union() {
         translate([0,0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  cylinder( duploRaster*6, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,4*dr+0, 3*duploHeight+0]) rotate([90+angle,0,0])
                  cube( [duploRaster*4,duploRaster*4,duploRaster*8] );       
      }
   }
}

// internal
module turnRamp(steps) // nr of steps: e.g. coarse=10, fine=90
{
   translate([0,-dr,2])
   for(i=[0:90/steps:190])
   {
      rotate([0,0,i]) translate([dr,0,i/90*2*duploHeight/2]) {
         // Using the rotate&shearing matrix produces nicer results with less steps.
         multmatrix(m = [ [1, 0, 0, 0], [0, 0, 1, -50/steps], [0, 1, 0.4/2, 0], [0, 0, 0, 1] ]) 
             union() {
                cylinder(h=50/steps,r=innerRadius, $fn=steps);
                translate([-dr,-2,0]) cube([4*duploRaster,4*duploRaster,70/steps]);
             }
      }
   }
}

// internal
module coneShape3(oRadius,coneHeight,coneQuality) {
	stepSize=5/coneQuality;
	r=(oRadius-innerRadius-dr);
	epsilon=0.001;
	for (i = [0 : stepSize : (0.9999)]) {
		translate([0,0,i*coneHeight])
			cylinder(coneHeight*stepSize+epsilon, innerRadius+pow(i,2)*r, innerRadius+pow(i+stepSize+epsilon,2)*r,$fn = coneQuality ); // top
	}	
	for (i = [0 : stepSize : (0.9999)]) {
		translate([0,0,coneHeight+i*innerRadius])
			cylinder(innerRadius*stepSize+epsilon, r+innerRadius+innerRadius*sqrt(1-pow(1-i,2)), r+innerRadius+innerRadius*sqrt(1-pow(1-i-stepSize-epsilon,2)),$fn = coneQuality ); // top
	}	
}

module conePiece3(coneSize,support=0)
{
	coneDepth=(coneSize<=3)?1.0:1.5;
	carving=1.0;
	inletLength=(coneSize<=3)?2:3;
	tapSupport=(support==0)?-1:(coneSize==5)?10:(coneSize==4)?7:20;

	socketDistance=coneSize-1;
	coneRadius=coneSize*dr;
	coneHeight=coneDepth*duploHeight;
	coneRaise=(1.5-coneDepth)*duploHeight;

	coneQuality=2*quality;

	for (i = [0 : 90 : 270]) {
		rotate([0,0,i]) translate([socketDistance*dr,0,0.5*duploHeight]) {
      		duploMarbleRunBase(2,2,1,false);
      	}
    }
	translate([(coneSize-1)*dr,(2+inletLength/2)*dr,0.5*duploHeight]) // inlet brick
      	duploMarbleRunBase(2,inletLength,1,true);
	
	difference() 
	{

		union() {
			if (tapSupport>=0) {
				cylinder(coneHeight+innerRadius+coneRaise,coneRadius-tapSupport, coneRadius,$fn = coneQuality ); // solid 
			} else {
				cylinder(coneHeight+innerRadius+coneRaise,innerRadius+2, innerRadius+2,$fn = coneQuality ); // solid 
			}
      		translate([0,0,coneRaise])
      			coneShape3(coneRadius+duploWall,coneHeight,coneQuality*2);	
	      	translate([(coneSize-1)*dr,(1+inletLength)/2*dr,2*duploHeight-1])
				cube([2*dr-gapBetweenBricks,(1+inletLength)*dr-gapBetweenBricks,2*duploHeight+1],true); // inlet wall
			for (i = [0 : 90 : 270]) { // cube sockets
				rotate([0,0,i]) translate([socketDistance*dr,0,1.75*duploHeight-1]) {
	      			cube([2*dr-gapBetweenBricks,2*dr-gapBetweenBricks,2.5*duploHeight],true);
 		     	}
    		}
		}
// */		

      	union() {
			for (i = [0 : 90 : 270]) {
				rotate([0,0,i]) translate([socketDistance*dr,0,0.5*duploHeight]) {
      				translate([0,0,-0*duploHeight-1]) rotate([0,180,0])
      					linear_extrude(height = duploHeight, center = true, convexity = 10, scale=[carving,carving], $fn=100)
      						square([2*dr-2*gapBetweenBricks,2*dr-2*gapBetweenBricks],center = true);
      			}
      		}
      		translate([(coneSize-1)*dr,coneSize*dr,1.5*duploHeight+coneHeight+coneRaise+2]) rotate([90,0,0])
				cylinder( duploRaster*coneSize, innerRadius, innerRadius,$fn = coneQuality ); // inlet
      		translate([0,0,-0.5*duploHeight])
				cylinder(3*duploHeight, innerRadius, innerRadius,$fn = coneQuality ); // hole
      		translate([0,0,2+coneRaise])
      			coneShape3(coneRadius,coneHeight,coneQuality*2);
			if (coneSize>3) {
      			translate([(coneSize-1)*dr,2*dr,0.5*duploHeight-1]) rotate([0,180,0])
      				linear_extrude(height = duploHeight, center = true, convexity = 10, scale=[carving,carving], $fn=100)
      					square([2*dr-2*gapBetweenBricks,4*dr-2*gapBetweenBricks],center = true);
			}
      			
      				
		}
// */      
   }
}



