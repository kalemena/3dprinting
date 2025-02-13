
$fn = 100;

dropSize=4;
size=35;
high=2;
nbPics=13;

angleZGlitch = rands(-8,8,nbPics);
angleXGlitch = rands(-30,30,nbPics);
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

module virus() {
    sphere(d=size,center=true);

    color([1,0,0])
    for(rotY=[-80:20:80]) {
        nbPics = (90-abs(rotY))/5;
        for(rotZ=[0:nbPics-1]) {
            angleXGlitch = rands(-8,8,1)[0];
            angleZGlitch = rands(-10,10,1)[0];
            
            rotate([angleXGlitch,0,0])
            rotate([0, 0, (360 - rotZ * 360/nbPics)])
            rotate([0,-rotY,0])
            rotate([0, 0, angleZGlitch]) 
            translate([size*3/5,0,0]) {
                rdSize = rands(15,45,1)[0];
                rdViscosity = rands(25,60,1)[0];
                rdStep = rands(90,110,1)[0];
                rdScale = rands(0.7,1.5,1)[0];
                scale([0.2,rdScale*0.2,0.2]) rotate([0,0,90]) viscosphere(rdSize,rdViscosity,rdStep);
            }
        }
    }
}

for(nz=[0:10]) {
for(nx=[0:6]) {
    
    rndXGlitch = rands(0,640,1)[0];
    rndYGlitch = rands(-25,25,1)[0];
    rndZGlitch = rands(0,400,1)[0];
    rndColor = rands(0.1,0.9,3);
    rdScale = rands(0.7,1.5,1)[0];
    
    translate([rndXGlitch,rndYGlitch,rndZGlitch])
    color(rndColor)
    scale(rdScale)
        virus();
}
}