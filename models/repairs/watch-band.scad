

$fn=100;

L=22;
l=7;
h=7;
width=1;

minkowski=1;

difference() {
    minkowski() { 
        cube([l-minkowski,L-minkowski,h-minkowski], center=true); 
        sphere(d=minkowski*2);
    }
    minkowski() { 
        cube([l-(2*minkowski)-width,L-(2*minkowski)-width,h+0.1], center=true); 
        sphere(d=minkowski*2);
    }
}