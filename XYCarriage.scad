include <Parameters.scad>;
use <GantryEnd2.scad>;

genBottom = true;
genMiddle = true;
genTop = true;
genHighMiddle = true;


union() {
  if (genBottom) {
    union(){
        translate([30, 0, 40]) {
        rotate([0, 180, 0]) {
            highTop();
        }
      }
    difference() {
      translate([0, 30, 0]) {
        cube ([30, 20, 5]);
      }
      translate([6.5, 33, -5]){
          cylinder(d=4, h=15);
        }
        translate([23.5, 33, -5]){
            cylinder(d=4, h=15);
        }
        translate([15, 45, -5]){
            cylinder(d=4, h=15);
        }
        translate([6, 42, -5]){
            cylinder(r=4, h=15);
        }
        translate([24, 42, -5]){
            cylinder(r=4, h=15);
        }
      }
    }
    }
  if (genMiddle) {
    translate([0, 0, - 20]) {
      highTop();
    }
  }
  if (genHighMiddle){
   translate([30, 30, 40 + XYSpacing]) {
      rotate([0, 180, 90]) {
        highTop();
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
