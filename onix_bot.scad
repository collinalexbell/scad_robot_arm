include <base.scad>;
include <nema_23.scad>;
include <utils.scad>;
include <z_plate.scad>;
include <bolt.scad>;
include <bearing.scad>;
include <stepper_adapter.scad>;
include <z_upper.scad>;
include <y_big_shell.scad>;
include <base_cover.scad>;
include <y_big_arm.scad>;
include <y_small_arm.scad>;
include <nema_17.scad>;
include <y_small_arm_zrot_servo.scad>
include <battery_base.scad>
include <battery.scad>
include <car_base.scad>
include <end_effector_base.scad>

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

//rotate([0,0,$t*90]) {

  translate([50,50,123.2]) {
    z_upper();
  }

  translate([50,50,180]) y_big_shell();

  translate([-10,-10,0.2]) base_cover();

  translate([-2,-10,233.5]) {
    translate([100,0,0]) rotate([0,$t*90,0]) y_big_arm();
  }

  translate([-210,-10,208]){
    y_small_arm();
    translate([-7,50,5]){
      nema_17();
      translate([-190,0,0]){
        nema_17();
      }
      translate([-148,-40,4]){
        y_small_arm_zrot_servo();
      }
      translate([-223,-40,4]){
        y_small_arm_zrot_servo();
      }
    }
  }
//}













translate([130,-20,0]) {
  color(cnrm(167, 36, 41)) battery_base();
//static_base();
}
translate([-20,-20,-50]) {
  translate([0,5,0]) battery();
  translate([0,70,0]) battery();
}






















translate([-48,-50,-100]) {
  car_base();
}


translate([-450,0,200])  {
  end_effector_base();
}









