module NutTrap(screw="m3", trapDepth=0, depth=100) {
		hexEdge=3.1;
		trapDepth = trapDepth==0 ? 2.4 : trapDepth;
		holeDiam=3.4;

	union() {
		translate([0,0,-.5])
			linear_extrude(height=trapDepth+.5)
			polygon(points=[
				[-hexEdge,0],
				[-hexEdge*sin(30), -hexEdge*cos(30)],
				[hexEdge*sin(30), -hexEdge*cos(30)],
				[hexEdge,0],
				[hexEdge*sin(30), hexEdge*cos(30)],
				[-hexEdge*sin(30), hexEdge*cos(30)]]);
		cylinder(d=holeDiam, h=depth);
	}
}

NutTrap();