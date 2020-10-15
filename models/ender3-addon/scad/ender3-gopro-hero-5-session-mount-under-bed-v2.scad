$fn=100;

thickness=4;
thicknessPlate=4.5;

width=22;
lenthPartUnderBed=50;

lenthPart2=65;

high=thickness*2+thicknessPlate;

screwDiam=4;

// part #1 : fix under bed
difference() {    
    hull() {
        cube([width,lenthPartUnderBed,high]);
        translate([0,lenthPartUnderBed,high/2]) rotate([0,90,0]) cylinder(d=high, h=width);
    }
    translate([0,-5,thickness]) cube([width,35,thickness]);
    translate([width/2,15,0]) cylinder(d=5.5,h=40);
    translate([width/2,15,thickness+thicknessPlate/2]) cylinder(d=8.5,h=40);
    translate([0,lenthPartUnderBed,high/2]) rotate([0,90,0]) cylinder(d=screwDiam, h=width);
}

// part #2 : arm onto fix under bed
translate([0,lenthPartUnderBed-5.5+6,-2])
rotate([45,0,0])
difference() {
    union() {
        hull() {
            translate([-3,0,0]) cube([width+3*2,20,high]);
            translate([0,15,0]) cube([width,20,high]);
        }
        hull() {
            translate([0,high/2,high/2]) rotate([0,90,0]) cylinder(d=high, h=width);
            translate([0,lenthPart2,high/2]) rotate([0,90,0]) cylinder(d=high, h=width);
        }
    }
    translate([-0.5/2,0,-1.5]) cube([width+0.5,12,10+6]);
    translate([-20,5.5,high/2]) rotate([0,90,0]) cylinder(d=screwDiam, h=50);
    translate([0,lenthPart2,high/2]) rotate([0,90,0]) cylinder(d=screwDiam, h=width);
}

// part #3 : gopro fix
translate([22,86,43])
rotate([90,0,180])
difference() {
    hull() {
        translate([-3,10,0]) cube([width+3*2,27,22]);
        translate([-3,0,0]) cube([width+3*2,37,12]);
    }
    translate([-0.5/2,thickness+12,0]) cube([width+0.5,35-2*thickness-10,25]);
    translate([-0.5/2,thickness-9,0]) cube([width+0.5,35-2*thickness-9.5,25]);
    translate([width/2,50,22-7]) rotate([90,0,0]) cylinder(d=6.2,h=50);
    translate([-20,5.5,high/2]) rotate([0,90,0]) cylinder(d=screwDiam, h=50);
}