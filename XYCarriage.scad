include <Parameters.scad>;
use <GantryEnd2.scad>;

genBottom = true;
genMiddle = true;
genTop = true;
genTrueBottom = true;

difference(){
  union() {
    if (genBottom) {
      translate([30, 0, 70]) {
        rotate([0, 180, 0]) {
          highTop();
        }
      }
    }
    if (genMiddle) {
      translate([30, 30, 70 + XYSpacing]) {
        rotate([0, 180, 90]) {
          highTop();
        }
      }
      translate([0,0, 30 + XYSpacing]){
        cube([30, 30, XYSpacing - 20]);
      }
      translate([0, 0, 10]) {
        highTop();
      }
    }
    if (genTop) {
      translate([30, 0, 30 + XYSpacing - 20]) {
        rotate([0, 0, 90]) {
          highTop();
        }
      }
    }
    if ( genTrueBottom) {
    difference(){
      cube([30,10, 30]);
      for(x = [5, 25]){
          translate([x, 5, -5]){
            cylinder(d = 4, h = XYSpacing + 10);
          }
        }
      }
    }
  } 
   mountHoles();
   clearanceHoles();
}
module mountHoles() {
  for(z = [25, 15]){
    if (z ==  25){
      for(x = [10.5, 19.5]){
          translate([x, 35, z]) {
              rotate([90, 0, 0]) {
                  cylinder(d = 4, h = 40);
              }
          }
      }
    }else{
          translate([15, 35, z]) {
                rotate([90, 0, 0]) {
                  cylinder(d = 4, h = 40);
              }
          }
      }
    }
  }

module clearanceHoles(){
  for(z = [5, 15]){
    for(x = [6.5, 23.5]){
      translate([x, 35, z]) {
        rotate([90, 0, 0]) {
          cylinder(d = 4, h = 40);
        }
      }
    }
  }
}
