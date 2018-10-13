
R=7/2;
H=8.5;
difference() {
    cylinder(r=R+1.5,H, $fn=50);
    cylinder(r=R,H, $fn=50);
    translate([0,-R,H/2]) cube([5,5,H],center=true,$fn=50);
}