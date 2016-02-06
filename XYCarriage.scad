include <Parameters.scad>;
use <GantryEnd2.scad>;

genBottom = true;
genMiddle = true;
genTop = true;


union() {
  if (genBottom) {
    translate([30, 0, 40]) {
      rotate([0, 180, 0]) {
        highTop();
      }
    }
    difference() {
      translate([0, 30, 5]) {
        cube ([20, 20, 5]);
      }
      translate([10, 40, 0]){
        cylinder(r = 8, h = 40);
      }
    }
  }
  if (genMiddle) {
    translate([30, 30, 40 + XYSpacing]) {
      rotate([0, 180, 90]) {
        highTop();
      }
    }
    translate([0, 0, - 20]) {
      highTop();
    }
    difference() {
      translate([0, 30, 10]) {
        cube ([20, 20, 6]);
      }
      for (i=[0:10]) {
        translate([10 + i, 40, 0]) {
          cylinder(r = 6, h = 40);
        }
      }
    }
  }
  if (genTop) {
    translate([30, 0, XYSpacing - 20]) {
      rotate([0, 0, 90]) {
        highTop();
      }
    }
  }
}
