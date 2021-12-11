include <base.scad>;
include <nema_23.scad>;
include <utils.scad>;

dy = center(19.5, 23.5);
translate([nema_23_xy/2-7,dy,base_plate_thickness]) {
  stepper_nema_23();
}

base(nema_23_xy);
