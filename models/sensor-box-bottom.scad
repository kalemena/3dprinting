echo(version=version());

font1 = "Liberation Sans";
font2 = "Segoe UI Emoji";

module letter(font, letter_size, letter_height, l) {
  linear_extrude(height = letter_height) {
    text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
  }
}

cube_size = 56;
cube_h = 26;
cube_bord=2;
difference() {
  translate([- cube_size/2, -cube_size/2, 0]) cube([cube_size, cube_size, cube_h+1]);
  // translate([0, - cube_size/2 + 1, 13]) rotate([90, 0, 0]) letter(font1, 8,2,"Genesys");
  translate([-cube_size/2 +1, 0, 13]) rotate([90, 0, -90]) letter(font1, 8,2,"Genesys");
  translate([- cube_size/2 + cube_bord,- cube_size/2 +cube_bord,cube_bord]) cube([cube_size - cube_bord*2, cube_size - cube_bord*2, cube_h - cube_bord*2]);
  translate([-cube_size/2 + cube_bord,-cube_size/2 + cube_bord,cube_h - cube_bord - 0.1]) cube([cube_size - cube_bord*2, cube_size, 10]);
  
  translate([-cube_size/2+cube_bord, cube_size/2-cube_bord, cube_h-cube_bord/2]) sphere(r = 1);
  translate([-cube_size/2+cube_bord, -cube_size/2+cube_bord*3, cube_h-cube_bord/2]) sphere(r = 1);
  translate([cube_size/2-cube_bord, cube_size/2-cube_bord, cube_h-cube_bord/2]) sphere(r = 1);
  translate([cube_size/2-cube_bord, -cube_size/2+cube_bord*3, cube_h-cube_bord/2]) sphere(r = 1);
}

translate([cube_size/2 - cube_bord, 0, 8]) sphere(r = 1.6);
translate([-cube_size/2 + cube_bord, 0, 8]) sphere(r = 1.6);

translate([-cube_size/2 + cube_bord,-cube_size/2 + cube_bord,0]) cube([4, 4, 5]);
translate([cube_size/2 - cube_bord*3,-cube_size/2 + cube_bord,0])  cube([4, 4, 5]);
translate([-cube_size/2 + cube_bord,cube_size/2 - cube_bord*3,0])  cube([4, 4, 5]);
translate([cube_size/2 - cube_bord*3,cube_size/2 - cube_bord*3,0])   cube([4, 4, 5]);

// top
translate([- cube_size/2 + cube_bord + 0.3, -cube_size/2 + cube_bord +0.3, cube_h-cube_bord])
union() {
difference() {
    cube([cube_size - cube_bord*2-0.6, cube_size - cube_bord-0.3, 2]);
    translate([cube_size/2-cube_bord*1.5, cube_size/2, -2]) letter(font2, 25,5,"😠");    
}        
translate([cube_size/2-cube_bord*1.5, cube_size/2, 0]) letter(font1, 61, 2,"\u263C");
translate([0, cube_bord*2 - 0.3, 1]) sphere(r = 1);
translate([0, cube_size-cube_bord*2-0.6, 1]) sphere(r = 1);
translate([cube_size-cube_bord*2-0.6, cube_bord*2 - 0.3, 1]) sphere(r = 1);
translate([cube_size-cube_bord*2-0.6, cube_size-cube_bord*2-0.6, 1]) sphere(r = 1);
}
