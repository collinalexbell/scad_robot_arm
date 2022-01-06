battery_y = 65 + 0.25;
battery_x = 148 + 0.25; // +/- 2.5;
wall_thickness = 5;
shell_y = battery_y * 2 + wall_thickness * 2;
shell_x = battery_x + wall_thickness * 2;

module battery_slot() {
  rotate([0,180,0]) {
      difference() {
        cube([shell_x,shell_y,40]);
        translate([wall_thickness, wall_thickness,wall_thickness+0.2]) {
          cube([battery_x, battery_y*2, 40-wall_thickness]);
        }
      }
    }
}

module screw_hole() {
       rotate([90,0,0]) cylinder(r=2.15, h=50);
}

module bit_slot() {
  difference() { 
    translate([-shell_x,0,0]) rotate([0,180,0]) battery_slot();

    dscrew_z = 20;
    translate([-50,10,dscrew_z]) screw_hole();
    translate([-45 - 65,10,dscrew_z]) screw_hole();


    translate([-50,180,dscrew_z]) screw_hole();
    translate([-45 -65,180,dscrew_z]) screw_hole();

    rotate([0,0,90]) {
      translate([50,10,dscrew_z]) screw_hole();
      translate([100,10,dscrew_z]) screw_hole();
    }


    rotate([0,0,90]) {
      translate([50,180,dscrew_z]) screw_hole();
      translate([100,180,dscrew_z]) screw_hole();
    }
  }
}


module battery_base() {
  battery_slot();  
  bit_slot();
}