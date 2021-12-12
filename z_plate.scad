include <nema_23.scad>
include <utils.scad>

$fn=100;
module z_plate() {
  xy=80;
  bearing_d = 12;
  the_center = center(0,xy);
  difference(){
    cube([xy,xy,5+(bearing_d/3)]);
    dhole_xy = (xy-47)/2;
    translate([dhole_xy, dhole_xy,-0.5]) holes();
    drive_shaft__hole_xy = the_center;
    translate([drive_shaft__hole_xy, drive_shaft__hole_xy, -2]) {
      scale([1.1,1.1,1]) drive_shaft();
    }
    translate([the_center,the_center,5+bearing_d/2]) {
      rotate_extrude(convexity=10) translate([xy/4,0,90]) circle(d=bearing_d);
    }
    translate([the_center,the_center,-40+3]) color([0.8,0.8,0.8]) cylinder(d=42, h=40);
  }
}
