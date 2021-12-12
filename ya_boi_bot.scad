include <base.scad>;
include <nema_23.scad>;
include <utils.scad>;
include <z_plate.scad>;
include <bolt.scad>;
include <bearing.scad>;
include <stepper_adapter.scad>;

dy = center(19.5, 23.5);
translate([nema_23_xy/2-7,dy,base_plate_thickness]) {
  stepper_nema_23();
}

base(nema_23_xy);
translate([10,10, 110 + 2]) {
  color([0.5,0,0]) z_plate();
}

dbolt_h = 125.2;

translate([26.5+47,26.5+47,dbolt_h]) {
  color([0.01,1,0.5,0.65]) bolt();
}
translate([26.5+47,26.5,dbolt_h]) {
  color([0.01,1,0.5,0.65]) bolt();
}
translate([26.5,26.5+47,dbolt_h]) {
  color([0.01,1,0.5,0.65]) bolt();
}
translate([26.5,26.5,dbolt_h]) {
  color([0.01,1,0.5,0.65]) bolt();
}

bearing_z = 122.5;
n = 10;
for(i = [0:n-1]) {
  translate([50,50,bearing_z]){
    rotate([0,0,i*360/n]) {
      translate([20,0,0]) bearing(12);
    }
  }
}

translate([50,50,138]) {
  rotate([180,0,0]) stepper_adapter();
}
