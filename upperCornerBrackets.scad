use <608Mount.scad>;
use <BracketPentagon.scad>;
use <LShape.scad>;
include <Parameters.scad>;

xmotor=true;
ymotor=true;

bearingHolderRadius = bearingRadius+bearingHolderWallThickness;
bracketHeight = bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + XYSpacing + bearingHolderRadius + exteriorSpace;

baseScrewOffset = bracketThickness + extrusionThickness/2;

gearThickness = 18;

/* clearance needed for gears - xGearClearance is the clearance for an x-axis drive gear*/
gearClearance = max(0, gearThickness - extrusionThickness + 2);
yGearClearance = ymotor?gearClearance:0;
xGearClearance = xmotor?gearClearance:0;

bracketWidth = bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + bearingHolderRadius + exteriorSpace;

echo (bracketWidth);
difference (){
608Mount(bracketThickness, bearingHolderWallThickness, bearingHolderWallHeight, [0, bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + yGearClearance, bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing], [0,90,0]) {
		cube (size = [bracketThickness, bracketWidth+yGearClearance, bracketHeight]);
		if(xmotor) {
		translate([bracketThickness + xGearClearance,0,0])
			rotate([0,-90,0])
				LShape(thickness = gearClearance, x=bracketHeight, y=bracketWidth+yGearClearance, wx= extrusionThickness+yGearClearance+bracketThickness, wy=extrusionThickness+bracketThickness);}
}
for (i = [0: (bracketHeight - baseScrewOffset - screwHoleDiam/2) / wideScrewHoleSpacing]) {
	translate ([-.5, bracketThickness + extrusionThickness/2 + yGearClearance, bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i])
		rotate([0,90,0])
			cylinder (h = 100, d = screwHoleDiam);
}
for (i = [0: (bracketWidth - baseScrewOffset - screwHoleDiam/2 - yGearClearance) / wideScrewHoleSpacing]) {
	translate ([-.5, bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i + yGearClearance, bracketThickness + extrusionThickness/2, ])
		rotate([0,90,0])
			cylinder (h = 100, d = screwHoleDiam);
}
}

difference() {
608Mount(bracketThickness, 4, 3, [bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + xGearClearance, 0, bracketThickness + extrusionThickness + gearDiam / 2 + gearSpacing + XYSpacing], [-90,0,0]) {
		cube (size = [bracketWidth + xGearClearance, bracketThickness, bracketHeight]);
		if(ymotor) {
		translate([0,bracketThickness+gearClearance,0])
			rotate([90,0,0])
				LShape(thickness = gearClearance, x=bracketWidth+xGearClearance, y=bracketHeight, wx= extrusionThickness+bracketThickness, wy=extrusionThickness+bracketThickness+xGearClearance);}
}
for (i = [0: (bracketHeight - baseScrewOffset - screwHoleDiam/2 - xGearClearance) / wideScrewHoleSpacing]) {
	translate ([baseScrewOffset + xGearClearance, -.5, bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i])
		rotate([-90,0,0])
			cylinder (h = 100, d = screwHoleDiam);
}
for (i = [0: (bracketWidth - baseScrewOffset - screwHoleDiam/2) / wideScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i + xGearClearance, -.5, bracketThickness + extrusionThickness/2, ])
		rotate([-90,0,0])
			cylinder (h = 100, d = screwHoleDiam);
}
}

difference () {
translate([xGearClearance, yGearClearance, 0])
	BracketPentagon(x=bracketWidth, w=bracketThickness+extrusionThickness+5);
for (i = [0: (bracketWidth - bracketThickness - (screwHoleDiam+2) - xGearClearance) / wideScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + xGearClearance, bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i + yGearClearance, - 0.5])
		rotate([0,0,0])
			cylinder (h = 100, d = screwHoleDiam);
}
for (i = [0: (bracketWidth - bracketThickness - (screwHoleDiam+2) - yGearClearance) / wideScrewHoleSpacing]) {
	translate ([bracketThickness + extrusionThickness/2 + wideScrewHoleSpacing * i + xGearClearance, bracketThickness + extrusionThickness/2 + yGearClearance, -0.5])
		rotate([0,0,0])
			cylinder (h = 100, d = screwHoleDiam);
}
}