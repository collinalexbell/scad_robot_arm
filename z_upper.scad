include <z_plate.scad>
include <stepper_adapter.scad>
include <utils.scad>

by/*te*/=255;
function cnrm(x,y,z)=[x/by,y/by,z/by];
function cnrm_transparent(x,y,z)=[x/by,y/by,z/by, 0.8];

module champher() {
  rotate([180,0,0]) {
    translate([0,0,-25]){
      color(cnrm(69,63,91)){
        rotate_extrude(convexity=10){
          rotate([0,0,30]){
            translate([42,0,0]){
              regular_polygon(order=3, r=10);
            }
          }
        }
      }
    }
  }
}

module z_upper() {
  difference() {
    color(cnrm(57,59,56)) {
      cylinder(d=70, h=50);
    }
    color(cnrm(75,27,24)) {
      translate([0,0,-0.03]){
        cylinder(d=35, h=20);
      }
    }

    color(cnrm(128,133,137)) bearing_race();
    translate([0,0,23]){
      color(cnrm(45,45,63)) stepper_adapter_holes();
    }
    champher();
  }
}

