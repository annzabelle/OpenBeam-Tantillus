include <Parameters.scad>
use <nemaMounts.scad>

module nema17MountFace(){
	difference(){
		cube([nemaMountSize + 2 * bracketThickness,nemaMountSize + 3 * bracketThickness + extrusionThickness,bracketThickness], [0,0,bracketThickness / 2]);
		translate([nemaMountSize / 2 + 5, nemaMountSize / 2 + extrusionThickness + 2 * bracketThickness, 0]){
			nema17Mount(bracketThickness * 2);
		}
	}
}

module mountBar(){
	difference(){
		cube([2 * bracketThickness + extrusionThickness, bracketThickness + extrusionThickness, 3 * narrowScrewHoleSpacing], [0, 0, bracketThickness]);
		rotate([0,270,0]){
			screwHole(bracketThickness + narrowScrewHoleSpacing);
			screwHole(bracketThickness + 2 * narrowScrewHoleSpacing);
		}
	}
}

module screwHole(xSpacing){
	translate([xSpacing, extrusionThickness / 2, -3 * bracketThickness - extrusionThickness]){	
		cylinder(3 * bracketThickness + extrusionThickness, screwHoleDiam / 2, screwHoleDiam / 2, 0);
	}
}

module extrusionCube(height) {
	cube([extrusionThickness, extrusionThickness, height], 0);
} 

difference(){
	union(){
		nema17MountFace();
		translate([nemaMountSize / 2 - extrusionThickness / 2,0,0]){
			mountBar();
		}
	}
	translate([nemaMountSize / 2 + bracketThickness - extrusionThickness / 2,0,0]){
		extrusionCube(bracketThickness + 3 * narrowScrewHoleSpacing);
	}
}

