include <Parameters.scad>;
difference() {
  minkowski() {
    circle(d = screwHoleDiam + 4);
    square(platformLength, platformLength);
  }
  for (x = [0, platformLength]) {
    for (y = [0, platformLength]) {
      translate([x, y]) {
        circle(d = screwHoleDiam);
      }
    }
  }
  for (x = [platformLength / 3, platformLength * 2 / 3]) {
    for (y = [platformLength / 2 - ZSupportSpacing / 2, platformLength / 2 + ZSupportSpacing / 2 + 25]) {
      translate([x, y]) {
        circle(d = screwHoleDiam);
      }
    }
  }
}
