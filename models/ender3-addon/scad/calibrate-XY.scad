
high=0.3;

union() {
    difference() {
        cube([150,150,high]);
        cube([149,149,high+0.1]);
    }

    difference() {
        cube([100,100,high]);
        cube([99,99,high+0.1]);
    }
    
    difference() {
        cube([50,50,high]);
        cube([49,49,high+0.1]);
    }
    
    difference() {
        cube([10,10,high]);
        cube([9,9,high+0.1]);
    }
}