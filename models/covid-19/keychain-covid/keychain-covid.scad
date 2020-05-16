
$fn = 60;

dropSize=4;
size=35;
high=2;
nbPics=13;

angleGlitch = rands(-8,8,nbPics);
scaleRaindropGlitch = rands(0.7,1.3,nbPics);
distRaindropGlitch = rands(0.7,1.3,nbPics);
distFactorRaindropGlitch = rands(0.9,1.1,nbPics);

// viscosity=25;//[0:200]
// size=25;//[-100:100]
// quality=64;//[4,8,16,32,64,128,256]
// step=110;//[0:200]
module viscosphere(size,viscosity,step,quality) {
    rotate([90,0,0])
        rotate_extrude($fn=quality)
            difference() {
                offset(-viscosity)
                    offset(viscosity)
                        union() {
                            for(i=[-1,1]) {
                                translate([0,i*20/100*step,0])
                                    circle(d=20+(i*size/5));
                            }
                        }
                        translate([160,0])
                            square(320,center=true);
            }
}

module viscocylinder(size,viscosity,step) {
    scale([0.2,0.2,high]) 
        projection(cut = true)
            viscosphere(size,viscosity,step);
}

module eye() {
    hull() {
        rdScale = rands(0.5,1.5,2);
        circle(d=2*rdScale[0],center=true);
        translate([4,0,0]) circle(d=4*rdScale[1],center=true);
    }
}

module mouth() {
    hull() {
        rdScale = rands(1,2,2);
        translate([-4,0,0]) circle(d=2*rdScale[0],center=true);
        translate([4,0,0]) circle(d=4*rdScale[1],center=true);
    }
}

module face() {
    rdRotate = rands(-30,30,2);
    
    // eyes
    translate([size/7,size/7,0]) rotate([0,0,rdRotate[0]]) eye();
    translate([-size/7,size/7,0]) rotate([0,0,rdRotate[1]]) mirror([1,0,0]) eye();
    
    // mouth
    translate([0,-size/5,0]) mouth();
}

linear_extrude(height = high, center = true, convexity = 10, twist = 0)
difference() {
    union() {
        circle(d=size,center=true);
        for(rot=[0:nbPics-1]) {
            rotate([0,0,angleGlitch[rot] + (360 - rot * 360/nbPics)]) 
                translate([size*3/5,0,0]) 
                    rotate([0,0,90]) {
                        difference() {
                            rdSize = rands(15,45,1)[0];
                            rdViscosity = rands(25,60,1)[0];
                            rdStep = rands(90,110,1)[0];
                            rdScale = rands(0.6,1.5,1)[0];
                            scale([1,rdScale,1]) viscocylinder(rdSize,rdViscosity,rdStep);
                        }
                    }
        }
    }
    face();
    translate([0,(size/2) * (7.5/9),0]) circle(d=2,center=true);
}
