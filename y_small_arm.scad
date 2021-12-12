
module y_small_arm() {
  color(cnrm(167, 187, 194)) {
    rotate([0,-90,0]) {
      intersection() {
        cube([50,50,125]);
        translate([25,25,-10]){
          rotate([0,0,270]){
            cylinder(d=55, h=240, $fn=7);
          }
        }
      }
    }
  }
}
