include <Parameters.scad>;

bracketInnerDimension = extrusionThickness - bracketThickness;

difference () {
	cube([extrusionThickness + bracketThickness, extrusionThickness, bracketThickness]);
	translate([extrusionThickness / 2 + bracketThickness, extrusionThickness / 2, - 2.5])cylinder (h = 100, d = screwHoleDiam);
}

translate([5, 0, 0])
rotate([0, -90, 0])
difference () {
	cube([extrusionThickness + bracketThickness, extrusionThickness, bracketThickness]);
	translate([extrusionThickness / 2 + bracketThickness, extrusionThickness / 2, - 2.5])cylinder (h = 100, d = screwHoleDiam);
}
