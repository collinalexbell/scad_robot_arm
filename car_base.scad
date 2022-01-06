

module wheel() {
  d = 65;
  rotate([90,0,0]) cylinder(d=65, h =7.5);
}

module motor() {
  x=22;
  y=13;
  z=41.5;
  cube([x,y,z]);
}

module drive_train() {
 translate([10,0,0]) color([0,0,0]) wheel();
 translate([0,3.5,0]) color([1,1,1]) motor();
}

module drive_trains() {
  translate ([30,-5,0])   translate([0,0,50]) rotate([7,0,0])  drive_train();
  translate([160,-5,0])   translate([0,0,50]) rotate([7,0,0])  drive_train();
  translate ([52.5,205,0])  translate([0,0,50]) rotate([-7,0,0]) rotate([0,0,180]) drive_train();
  translate ([182.5,205,0]) translate([0,0,50]) rotate([-7,0,0]) rotate([0,0,180]) drive_train();
}

module drive_train_stub() {
 x=25;
 y=7;
 z=11;
 color([0.2,0.2,0.2]) rotate([7,0,0]) cube([x,y,z]);
}

module drive_train_stubs() {
  drive_train_stub();
  translate([130,0,0]) drive_train_stub();
  translate([155,177,0]) {
    rotate([0,0,180]) drive_train_stub();
    rotate([0,0,180]) translate([130,0,0]) drive_train_stub();
  }
}

module car_base() {
  difference() {
   color([0,0,0]) cube([200,200,100]);
   translate([10,10,50]) color([1,0,0]) cube([180,180,100]);
  }
  translate([0,0,-60]) drive_trains();
  translate([29,11.3,-11]) drive_train_stubs(); 

}