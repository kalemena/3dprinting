
$fn=100;

cr123H=34.5;
cr123D=17.5;

module xiaomiAqaraMotion() {
    sensorExtD=30.5;
    sensorIntD=27.7;

    // batteryH + borderToFit + BoxBottom - cr2450H
    holderH=cr123H+1.5+2-4;

    difference() {
        cylinder(d=sensorExtD, h=holderH);
        translate([0,0,-0.01]) cylinder(d=sensorIntD, h=2);
        
        // battery
        translate([3,0,-5+3]) cylinder(d=cr123D, h=cr123H);
        
        // battery positive
        translate([3,0,cr123H-5+1.99]) {
            hull() {
                cylinder(d=6, h=1.5);
                translate([0,cr123D/2,0]) cylinder(d=3, h=1.5);
            }
        }
        
        // wire
        translate([3,cr123D/2,-2]) cylinder(d=3, h=cr123H);
    }
}

module xiaomiAqaraMotionWithMount() {
    difference() {
        union() {
            xiaomiAqaraMotion();
            hull() {
                translate([0,15,12])
                    cube([15,5,15], center=true);
                translate([0,11,14])
                    cube([21,1,21], center=true);
            }
        }
        
        // nut for M3
        translate([0,18,12])
            rotate([90,0,0]) {
                cylinder(d=6.4,h=2.5, $fn=6);
                cylinder(d=3.3+0.1, h=17, center=true);
            }
            
    }
}

// xiaomiAqaraMotion();
xiaomiAqaraMotionWithMount();