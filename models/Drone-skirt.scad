echo(version=version());

font1 = "Liberation Sans";
font2 = "Segoe UI Emoji";

module letter(font, letter_size, letter_height, l) {
  linear_extrude(height = letter_height) {
    text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
  }
}

width=1.5;
z_h=34.5;
y_l=32;
part1_L=45.5;
part2_L=70;
part3_L=42.5;
spacer_diam=5;

module spacer() {
    difference() {
        cylinder(z_h,(spacer_diam + width)/2,(spacer_diam + width)/2,true);
        cylinder(z_h,spacer_diam/2,spacer_diam/2,true);
        translate([-spacer_diam/2,-spacer_diam,-z_h/2]) cube([spacer_diam, spacer_diam, z_h]);
    }
}

module side() {
    difference() {
        union() {
            //-- plates
            
            // back
            translate([0,-spacer_diam/2,z_h/2]) spacer();
            translate([+part3_L,-spacer_diam/2,z_h/2]) spacer();
            translate([-spacer_diam+width,0,0]) cube([part3_L+spacer_diam+width, width, z_h]);
            translate([-spacer_diam/2-spacer_diam/2-0.2,-y_l/2,0]) rotate([0,0,-5]) cube([width, y_l/2+width, z_h]);
            translate([part3_L+spacer_diam/2,-y_l/4+width,0]) cube([width, y_l/4, z_h]);
            /*            
            // front
            translate([+part3_L+part2_L,-spacer_diam/2,z_h/2]) spacer();
            translate([+part3_L+part2_L+part1_L,-spacer_diam/2,z_h/2]) spacer(); 
            translate([part2_L+part3_L,0,0]) cube([part1_L, width, z_h]);
            translate([part1_L+part2_L+part3_L+spacer_diam,-y_l/2+0.2,0]) rotate([0,0,+10]) cube([width, y_l/2, z_h*2/3]);
            translate([part2_L+part3_L-spacer_diam+width-0.2,-y_l/4,0]) cube([width, y_l/4, z_h]);
            
            // middle
            translate([part3_L+spacer_diam,-y_l/4,0]) cube([width, y_l/4, z_h]);
            translate([part3_L+spacer_diam,0,0]) rotate([0,0,-45]) cube([width, y_l/2, z_h]);
            translate([part2_L+part3_L-spacer_diam,-y_l/4,0]) cube([width, y_l/4, z_h]);
            translate([part2_L+part3_L-spacer_diam,0,0]) rotate([0,0,48]) cube([width, y_l/2, z_h]);
            translate([part3_L+16,10,0]) cube([part2_L-2*16, width, z_h]);
            */
        }
        
        // front
        translate([part2_L+part3_L-spacer_diam+1,-5,z_h-5]) sphere(r = 1.5);
        translate([part2_L+part3_L-spacer_diam+1,-5,5]) sphere(r = 1.5);
        translate([part1_L+part2_L+part3_L-41.6, -5,z_h-5]) cube([15, 10, 5]); // strap front
                
        // back
        translate([part3_L+spacer_diam-1,-5,z_h-5]) sphere(r = 1.2);
        translate([part3_L+spacer_diam-1,-5,5]) sphere(r = 1.2);
        translate([part3_L-19,-5,z_h-4]) cube([15, 10, 4]); // strap back
    }
}

// FULL set with mirror
difference() {
    union() {
        //side(); // left
        translate([0,-y_l,0]) mirror([0,1,0]) side(); // right
    }
    
    // back
    translate([0,-y_l/2,10]) rotate([0,90,0]) cylinder(z_h,3.5,3.5,true);
    
    // front
    translate([part1_L+part2_L+part3_L,-y_l/2,20]) rotate([0,90,0]) cylinder(z_h,y_l/2-spacer_diam/2,y_l/2-spacer_diam/2,true);
    
    // middle
    translate([part3_L+15/2,-y_l*2,0]) cube([part2_L-15, y_l*3, 10]);
}
