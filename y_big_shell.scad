include <nema_23.scad>
include <utils.scad>

module mount_holes() {
  color(cnrm(167, 36, 41)) {
    n=4;
    translate([0, 0, -85]){
      for(i=[1:n-1]){ // n-1 is purposeful, we only want 3.
        rotate([0,0,i*360/n]) translate([10,0,100]) cylinder(d=4, h=100);
      }
    }
  }
}

module y_big_shell() {

  // ------$---tribute to jobs----$---
  // ---------------------------------
  steve_jobs_white = cnrm(251, 254, 254);

  // ---------------------------------
  // ------$--tribute to pacioli--$---
  ormgd_red        = cnrm(167, 36, 41);

  difference() {
    color(steve_jobs_white) {
      cylinder(d=70, h=20);
      intersection() {
        cube([100,100,100]);
        translate([50,300,50]) rotate([90,0,0]) cylinder(d=110, h=300, $fn=12); }
    }
    translate([20,105,25]) rotate([90,0,0]) stepper_nema_23();
    
    // --- minus ----

                    //intentionally keeping the slash in the shell
    translate([0,0,-30]) mount_holes();
  }
  translate([20,105,25]) rotate([90,0,0]) stepper_nema_23();
}
