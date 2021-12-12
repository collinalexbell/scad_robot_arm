include <utils.scad>;

module base_cover() {
  z=50;
  xy=120;
  difference() {
    intersection() {
      color(cnrm(189, 163, 126)) cube([xy, xy, z]);
      translate([60,60,20]) rotate([0,90,0]) color(cnrm(38, 36, 53)) sphere(d=xy+35, $fn=10);
    }
    translate([10,10,-10]) base(nema_23_xy);
    translate([28,28,-2]) cube([64,64,20]);
  }
}
