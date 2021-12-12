module bolt() {
  rotate([180,0,0]) {
    cap_h=4;
    pein_h = 15;
    translate([0,0,cap_h]) cylinder(d=4,$fn=100, h=pein_h);
    cylinder(d=6.5, h=cap_h);
  }
}
