// From Lukas Süss 2011
// public domain

riA = 14/2;
riB = 9/2-0.25;  // rimthickness trouble

vert0 = 64;
vert1 = 32;

t1 = 1.75; // minimum wallthickness
r1 = 24/2;

// initial standoff
t2 = 4; 
r2 = 20/2;

// torodial reduction
t3 = 8; 
r3= 14/2;

// trapezoidal
t4 = 0.75;
t5 = 1.50; r5 = 17/2;
t6 = 0.75;
  s6 = t1+t2+t3+t4+t5+t6;

// tip
t7 = 2.50;
t8 = 3.00;
t9 = 3.5;
r7 = 16/2;
r8 = 11.5/2; // critical
echo("rimthickness: ",r8-riB);
r9 = r7;

echo("length=24? ",s6-t1 +t7+t8+t9); // not correct yet #############################

module torus(ra,rb,va,vb) {
    rotate_extrude(convexity=3, $fn=vb)
        translate([rb,0,0])
            rotate(45,[0,0,1])
                circle(r=ra,$fn=va);
}

module waterhose_connector_male() {
    difference() {
        union() {
            cylinder(r=r1,h=t1,$fn=vert0);

            // bottom part
            translate([0,0,t1]) {
                cylinder(r=r2,h=t2,$fn=vert0);

                translate([0,0,t2])
                difference() {
                  cylinder(r=r2,h=t3,$fn=vert0);

                  translate([0,0,t3])
                    scale([1,1,t3/(r2-r3)])
                        rotate_extrude(convexity=3, $fn=vert0)
                            translate([r2,0,0])
                                circle(r=r2-r3,$fn=vert1);
                }
            }

            // trapezoidal part
            translate([0,0,t1+t2+t3])
                rotate_extrude(convexity=3, $fn=vert0)
                    polygon(points=[[0,0],
                                    [r3,0],
                                    [r5,t4],
                                    [r5,t4+t5],
                                    [r7,t4+t5+t6],
                                    [0,t4+t5+t6]],
                            paths=[[0,1,2,3,4,5]]);

            //TIP
            translate([0,0,s6]) {
                cylinder(r = r7, h=t7+t8,$fn=vert0) ;
                translate([0,0,t7+t8+0.5])
                torus(2.5,r7-2.5,vert1,vert0);
            }
        }

        // -- minus:

        // O-ring
        translate([0,0,s6+t7+t8/2]) {
            torus(t8/2*sqrt(2), (r7+r8)/2 + (r7-r8)/2*sqrt(2),4,vert0);
            torus(t8/2, r8+t8/2,vert1,vert0);
        }

        // inside hole
        cylinder(r=riB,h= (t1+24)*1.1,$fn=vert0);  // to see 24 mm 
        translate([0,0,-0.05])
            cylinder(r1=riA+1.0,r2=riB,h=12,$fn=vert0);  // h=10 just looks good
    }
}

waterhose_connector_male();