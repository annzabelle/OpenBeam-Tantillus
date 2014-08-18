include <Parameters.scad> // at the moment, just for circle parameters
//TODO: parametrize for rod diameter, igubal sizing (incl. screws)

module igubalBlobule() {
	difference() {
		cube([10,45,5]);
		translate ([5,5,-5]) 
			cylinder(d=4.4, h=100);
		translate ([5,40,-5])
			cylinder(d=4.4, h=100);
	}
}

translate ([-20, -7.5, 0]) {
	cube([40,15,5]);
	translate([0,-15,0]) igubalBlobule();
	translate([30,-15,0])igubalBlobule();	
	translate([20,0,15])
		rotate([-90,0,0])
			difference() {
				union() {
					translate ([-15/2,0,0])cube([15,15,15]);
					cylinder(d=15,h=15);	
				}
				translate([0,0,-1]) cylinder(d=8,h=11);
			}
}