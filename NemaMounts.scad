m3Diam=3.5;

module nema17Mount (depth) {
	union() {
		translate([-33.1/2, -33.1/2, 0])
			cylinder (h=depth,d=m3Diam);
		
		translate([33.1/2, -33.1/2, 0])
			cylinder (h=depth,d=m3Diam);
		
		translate([-33.1/2, 33.1/2, 0])
			cylinder (h=depth,d=m3Diam);
   
		translate([33.1/2, 33.1/2, 0])
			cylinder (h=depth,d=m3Diam);
		cylinder(h=3, d=23);
		cylinder(h=depth, d=6);
	}
}

module slideyMount (length=10) {
	for (i=[0:$children-1]) {
		hull() {
			translate([-length/2,0,0]) children(i);
			translate([length/2,0,0]) children(i);
		}
	}
}

module slideyNema17Mount(length, depth) {
	slideyMount(length) {
		translate([-33.1/2, -33.1/2, 0])
			cylinder (h=depth,d=m3Diam);
		
		translate([33.1/2, -33.1/2, 0])
			cylinder (h=depth,d=m3Diam);
		
		translate([-33.1/2, 33.1/2, 0])
			cylinder (h=depth,d=m3Diam);
   
		translate([33.1/2, 33.1/2, 0])
			cylinder (h=depth,d=m3Diam);
		cylinder(h=3, d=23);
		cylinder(h=depth, d=6);
	}
}