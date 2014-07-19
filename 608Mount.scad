module 608Mount(throughDepth, heightOffSurface, wallThickness, transVec, rotVec) {
	difference() {
		union() {
			children();
			translate(transVec)
				rotate(rotVec)
					translate([0,0,-heightOffSurface])
						cylinder(d=22+wallThickness, h=heightOffSurface);
		}
		translate(transVec)
			rotate(rotVec) {
				translate([0,0,-heightOffSurface-.5])
					cylinder(d=22, h=7+.5);
				cylinder(d=9, h=throughDepth+1);
			}
	}
}

608Mount(50.5, 3, 3, [25, 25, 0], [0,0,0])
	cube(size=50);