length = 55;

module holes()
{
   h = 90;
   rotate([0,90,0]) cylinder(d=3.2, h=h);
   translate([0,0,10]) rotate([0,90,0]) cylinder(d=3.2, h=h);
   translate([0,10,10]) rotate([0,90,0]) cylinder(d=3.2, h=h);
   translate([0,10,0]) rotate([0,90,0]) cylinder(d=3.2, h=h);
}

module end_effector_base() {
  difference() {
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
    translate([-length,20,20]) holes();
  }
}
