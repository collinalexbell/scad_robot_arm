include <utils.scad>;
include <stepper_adapter.scad>;

module y_big_arm() {
  zyross_section=50;
  l = 300;
  translate([0,-500,0]) cube([1,1000,1]);
  translate([-l+20,0,25]) {
    rotate([-90,0,0]) {
      color(cnrm(114, 119, 123)) {
        difference() {
          intersection() {
            cube([l,zyross_section,zyross_section]);
            translate([0,zyross_section/2, zyross_section/2]) rotate([0,90,0]) cylinder(d=zyross_section+8, h=l, $fn=7);
          }
          translate([-10, 10, 10]){
            cube([l+20,zyross_section-20,zyross_section-20]);}

          translate([280,zyross_section/2, zyross_section-2]) stepper_adapter();
        }
      }
    }
  }
}
