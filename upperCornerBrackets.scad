use <608Mount.scad>;
include <Parameters.scad>;

bearingHolderRadius = bearingRadius+bearingHolderWallThickness;
bracketHeight = bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + XYSpacing + bearingHolderRadius + exteriorSpace;

bracketWidth = bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + bearingHolderRadius + exteriorSpace;
difference (){
608Mount(bracketThickness, bearingHolderWallThickness, bearingHolderWallHeight, [0, bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing, bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing], [0,90,0]) {
		cube (size = [bracketThickness, bracketWidth, bracketHeight]);
}
for (i = [0: (bracketHeight - bracketThickness) / wideScrewHoleSpacing]) {
	translate ([-.5, bracketThickness + extrusionThickness/2, bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i])
		rotate([0,90,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
for (i = [0: (bracketWidth - bracketThickness) / wideScrewHoleSpacing]) {
	translate ([-.5, bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i, bracketThickness + extrusionThickness/2, ])
		rotate([0,90,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
}

difference() {
608Mount(bracketThickness, 4, 3, [bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing, 0, bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + XYSpacing], [-90,0,0]) {
		cube (size = [bracketWidth, bracketThickness, bracketHeight]);
}
for (i = [0: (bracketHeight - bracketThickness) / wideScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2, -.5, bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i])
		rotate([-90,0,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
for (i = [0: (bracketWidth - bracketThickness) / wideScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i, -.5, bracketThickness + extrusionThickness/2, ])
		rotate([-90,0,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
}

difference () {
linear_extrude(height=5)
	polygon(points=[[0,0],[bracketWidth,0],[bracketWidth,bracketThickness+extrusionThickness],[bracketThickness+extrusionThickness,bracketWidth],[0,bracketWidth]]);
for (i = [0: (bracketWidth - bracketThickness) / wideScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2, bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i, - 0.5])
		rotate([0,0,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
for (i = [0: (bracketWidth - bracketThickness) / wideScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i, bracketThickness + extrusionThickness/2, -0.5])
		rotate([0,0,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
}