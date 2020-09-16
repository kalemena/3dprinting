/** Part not OK yet, still studying the rotate/extrude logic
 */
include <duplo-block-lib.scad>

$fn=50;

module slice() {
    translate([20,20])
    rotate([0,0,800])
    difference() {
        circle(d=25);
        circle(d=20);
        translate([-20,0]) square([40,20]);
    }
}
/*
rotate_extrude(height = 100, twist = height * 5)
    translate([10,10]) slice();
*/
// rotate_extrude($fn=200) polygon( points=[[0,0],[2,1],[1,2],[1,3],[3,4],[0,5]] );


translate([0,0,40])
duplo(width=2,length=2,height=8,topNibbles=true,bottomHoles=false);

linear_extrude(height = 80, twist=360, scale=1, slices=100)
    slice();