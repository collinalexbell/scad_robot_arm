include <nema_23.scad>
include <utils.scad>

$fn=100;
bearing_d = 12;
xy=80;
module bearing_race() {
  rotate_extrude(convexity=10) translate([xy/4,0,90]) circle(d=bearing_d);
}

module z_plate() {
  the_center = center(0,xy);
  intersection() {
    difference(){
      cube([xy,xy,5+(bearing_d/3)]);
      dhole_xy = (xy-47)/2;
      translate([dhole_xy, dhole_xy,-0.5]) holes();
      drive_shaft__hole_xy = the_center;
      translate([drive_shaft__hole_xy, drive_shaft__hole_xy, -2]) {
        scale([1.1,1.1,1]) drive_shaft();
      }
      translate([the_center,the_center,5+bearing_d/2]) {
        bearing_race();
      }
      translate([the_center,the_center,-40+3]) color([0.8,0.8,0.8]) cylinder(d=42, h=40);
    }
   translate([the_center, the_center,0])  cylinder(d=95, h=100);
  }
}
