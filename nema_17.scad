module nema_17() {
  chunk = 42;
  color([0,0,0]) {
    cube([chunk,chunk,chunk]);
  }
  translate([chunk/2,0,chunk/2]){
    rotate([90,0,0]) color([1,1,1]) cylinder(d=10,h=20);
  }
}
