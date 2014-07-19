use <608Mount.scad>;

XYSpacing = 15;
gearDiam = 50;
bracketThickness = 5;
extrusionThickness = 15;
gearSpacing = 10;
bearingHolderRadius = 14;
exteriorSpace = 10;
screwHoleSpacing = 30;
screwHoleDiam = 4;

bracketHeight = bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + XYSpacing + bearingHolderRadius + exteriorSpace;

bracketWidth = bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + bearingHolderRadius + exteriorSpace;
difference (){
608Mount(bracketThickness, 4, 3, [0, bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing, bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing], [0,90,0]) {
		cube (size = [bracketThickness, bracketWidth, bracketHeight]);
}
for (i = [0: (bracketHeight - bracketThickness) / screwHoleSpacing]) {
	translate ([-.5, bracketThickness + extrusionThickness/2, bracketThickness + extrusionThickness/2 + screwHoleSpacing * i])
		rotate([0,90,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
for (i = [0: (bracketWidth - bracketThickness) / screwHoleSpacing]) {
	translate ([-.5, bracketThickness + extrusionThickness/2 + screwHoleSpacing * i, bracketThickness + extrusionThickness/2, ])
		rotate([0,90,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
}

difference() {
608Mount(bracketThickness, 4, 3, [bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing, 0, bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + XYSpacing], [-90,0,0]) {
		cube (size = [bracketWidth, bracketThickness, bracketHeight]);
}
for (i = [0: (bracketHeight - bracketThickness) / screwHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2, -.5, bracketThickness + extrusionThickness/2 + screwHoleSpacing * i])
		rotate([-90,0,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
for (i = [0: (bracketWidth - bracketThickness) / screwHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + screwHoleSpacing * i, -.5, bracketThickness + extrusionThickness/2, ])
		rotate([-90,0,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
}

difference () {
linear_extrude(height=5)
	polygon(points=[[0,0],[bracketWidth,0],[bracketWidth,bracketThickness+extrusionThickness],[bracketThickness+extrusionThickness,bracketWidth],[0,bracketWidth]]);
for (i = [0: (bracketWidth - bracketThickness) / screwHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2, bracketThickness + extrusionThickness/2 + screwHoleSpacing * i, - 0.5])
		rotate([0,0,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
for (i = [0: (bracketWidth - bracketThickness) / screwHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + screwHoleSpacing * i, bracketThickness + extrusionThickness/2, -0.5])
		rotate([0,0,0])
			cylinder (h = bracketThickness+1, d = screwHoleDiam);
}
}