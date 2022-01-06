length = 55;

module end_effector_base() {
  color(cnrm(167, 187, 194)) {
    rotate([0,-90,0]) {
      intersection() {
        cube([50,50,length]);
        translate([25,25,-10+0.1]){
          rotate([0,0,270]){
            cylinder(d=55, h=length, $fn=7);
          }
        }
      }
    }
  }
}
