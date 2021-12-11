module drive_shaft() {
  cylinder(d=10, h=24);
}

module rest_plate() {
  cylinder(d=38, h=2);
}

hole_distance=47;
module holes() {
  $fn=60;
  cylinder(d=4.2,h=10);
  translate([00,hole_distance,0]) cylinder(d=4.2,h=10);
  translate([hole_distance,00,0]) cylinder(d=4.2,h=10);
  translate([hole_distance,hole_distance,0]) cylinder(d=4.2,h=10);
}

module wires(wire_d, wire_l) {
  cube([wire_d,wire_l,wire_d]);
}
nema_23_xy    = 57 ;
module stepper_nema_23() {
    h     = 113;
    xy    = nema_23_xy;
    difference(){
    cube([nema_23_xy,nema_23_xy,h]);
      dxy_hole = (nema_23_xy-hole_distance)/2;
      translate([dxy_hole, dxy_hole,h-5]) {
        holes();
      }
    }
    wire_d = 4.5;
    wire_l = 220;
    translate([nema_23_xy/2-wire_d/2,-wire_l,0]){
      wires(wire_d, wire_l);
    }
    translate([xy/2,xy/2,h]) {
      drive_shaft();
      rest_plate();
    }

}
