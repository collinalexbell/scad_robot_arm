include <nema_23.scad>
include <utils.scad>

module y_big_shell() {

  // ------$--tribute to jobs--$------
  // ---------------------------------
  steve_jobs_white = cnrm(251, 254, 254);
  // ---------------------------------

  color(steve_jobs_white) {
    cylinder(d=70, h=20);
    intersection() {
      cube([100,100,100]);
      translate([50,300,50]) rotate([90,0,0]) cylinder(d=110, h=300, $fn=12); }
  }
  translate([20,105,25]) rotate([90,0,0]) stepper_nema_23();
}
