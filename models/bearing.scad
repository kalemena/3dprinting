
h=8.6;

difference() {
  union() {
    cylinder(r=4,h=h/2, $fn=50);
    cylinder(r=5,h=(h-7)/2, $fn=50);
  }
  cylinder(r=2.4,h, $fn=50);
}