include <Parameters.scad>;
use <BracketPentagon.scad>;

bracketFullDimension = bracketThickness + extrusionThickness + bracketInnerDimension;

difference() {
BracketPentagon(x=bracketFullDimension, w=extrusionThickness+bracketThickness);
for (i = [1: (bracketFullDimension - bracketThickness) / narrowScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2, bracketThickness + extrusionThickness/2 + narrowScrewHoleSpacing * i, -.5])
		cylinder (h = 100, d = screwHoleDiam);
}
for (i = [1: (bracketFullDimension - bracketThickness) / narrowScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + narrowScrewHoleSpacing * i, bracketThickness + extrusionThickness/2, -.5])
		cylinder (h = 100, d = screwHoleDiam);
}
}

translate([0, 5, 0])
rotate([90, 0, 0]) 
difference(){
BracketPentagon(x=bracketFullDimension, w=extrusionThickness+bracketThickness);
for (i = [0: (bracketFullDimension - bracketThickness) / narrowScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2, bracketThickness + extrusionThickness/2 + narrowScrewHoleSpacing * i, -.5])
		cylinder (h = 100, d = screwHoleDiam);
}
for (i = [0: (bracketFullDimension - bracketThickness) / narrowScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + narrowScrewHoleSpacing * i, bracketThickness + extrusionThickness/2, -.5])
		cylinder (h = 100, d = screwHoleDiam);
}
}

translate([5, 0, 0])
rotate([0, -90, 0])
difference(){
BracketPentagon(x=bracketFullDimension, w=extrusionThickness+bracketThickness);
for (i = [0: (bracketFullDimension - bracketThickness) / narrowScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2, bracketThickness + extrusionThickness/2 + narrowScrewHoleSpacing * i, -.5])
		cylinder (h = 100, d = screwHoleDiam);
}
for (i = [0: (bracketFullDimension - bracketThickness) / narrowScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + narrowScrewHoleSpacing * i, bracketThickness + extrusionThickness/2, -.5])
		cylinder (h = 100, d = screwHoleDiam);
}
}

translate([0, 0, -footHeight])
cube([footDimension, footDimension, footHeight]);


