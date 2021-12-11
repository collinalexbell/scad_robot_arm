module drive_shaft() {
  cylinder(d=10, h=24);
}

module rest_plate() {
  cylinder(d=38, h=2);
}

module wires(wire_d, wire_l) {
  cube([wire_d,wire_l,wire_d]);
}
nema_23_xy    = 57 ;
module stepper_nema_23() {
    h     = 113;
    xy    = nema_23_xy;
    cube([nema_23_xy,nema_23_xy,h]);
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
