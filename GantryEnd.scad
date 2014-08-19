include <Parameters.scad> // at the moment, just for circle parameters
use <nutTrap.scad>
//TODO: parametrize for rod diameter, igubal sizing (incl. screws), make igubal use nut traps

module igubalBlobule() {
	difference() {
		cube([10,45,10]);
		translate ([5,5,-5])
			cylinder(d=4.4, h=100);
		translate ([5,40,-5])
			cylinder(d=4.4, h=100);
	}
}

translate ([-25, -7.5, 0]) {
	difference () {	
		union() {	
			translate([0,-15,0]) igubalBlobule();
			translate([40,-15,0])igubalBlobule();
			translate([25,0,15])
				rotate([-90,0,0])
					difference() {
						translate ([-20,0,0])cube([40,15,15]);
						translate([0,0,-1]) cylinder(d=8,h=11);
					}
		}
		translate ([0, 10, 0]) NutTrap();
		translate ([0, -10, 0]) NutTrap();
	}
}