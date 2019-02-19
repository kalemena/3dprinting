echo(version=version());

font = "Liberation Sans";

module letter(letter_size, letter_height, l) {
  linear_extrude(height = letter_height) {
    text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
  }
}

//difference() {
//  translate([-27,-27,0])
//    cube([54, 54, 20]);
//  translate([0, -27, 10])      
//    rotate([90, 0, 0])
//        letter(8,2,"Genesys");
//  translate([-25,-25,2])
//    cube([50, 50, 30]);
//  
//  translate([-25,-10,18]) cube([50, 50, 10]);
//  #translate([-25,-26,18])
//    cube([50, 53, 2]);
//}

// translate([-25,-25,0]) cube([4, 4, 3]);
// translate([21,-25,0])  cube([4, 4, 3]);
// translate([-25,21,0])  cube([4, 4, 3]);
// translate([21,21,0])   cube([4, 4, 3]);

// 
// translate([50,-26,0])
union() {
    difference() {
        cube([50.4, 52.4, 1.6]);
        translate([25.2, 26.2, 0]) 
            letter(40,4,"\u263A");    
    }        
    translate([25.2, 26.2, 0]) 
        letter(47,1.6,"\u263C");
    
    translate([0.4, 2, 0.8]) sphere(r = 0.8);
    translate([0.4, 50.4, 0.8]) sphere(r = 0.8);
    translate([50, 2, 0.8]) sphere(r = 0.8);
    translate([50, 50.4, 0.8]) sphere(r = 0.8);
}
