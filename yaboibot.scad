color([0.5,0.5,0.5]) {
  base    = 100;
  cube([base,base,1]);
  real_wd = 56;
  mal_wd  = real_wd + 10;
  mal_h   = 35;
  fem_wd  = real_wd+4;
  fem_h   = real_wd+4;
  translate([base/2,base/2,1]) {
    difference() {
      translate([-mal_wd/2, -mal_wd/2, 0]) {
        cube([mal_wd,mal_wd,mal_h]);
      }
      translate([-fem_wd/2, -fem_wd/2, 0]) {
        cube([fem_wd,fem_wd,fem_h+0.001]);
      }
      translate([-5/2,-fem_wd/2-10/2,0]) cube([5,10,fem_h+0.001]);
    }
  }
}
