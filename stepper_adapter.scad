module stepper_adapter_holes() {
  for(h=[0:4]) {
      rotate([0,0,90*h]){
        translate([30-17,0,-5]){
          cylinder(d=3.2, h=10);
        }
      }
    }
}
module stepper_adapter() {

   biggen_h    = 2.5;
  smallen_h    = 9.0;
  roter_hole   = 11 ;
  adapt_hole_d = 3;

  color([0.8, 0.8, 0.8, 0.95]) {
    difference() {
      union() {
        cylinder(d=31.5, h=biggen_h);
        cylinder(d=15, h=smallen_h);
      }
      translate([0,0,-10]){
        cylinder(d=roter_hole, h=100);
      }
      stepper_adapter_holes();
    }
    
  }
}
