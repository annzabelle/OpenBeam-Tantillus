include <Parameters.scad> // at the moment, just for circle parameters
use <nutTrap.scad>
//TODO: parametrize for rod diameter, igubal sizing (incl. screws), make igubal use nut traps

genTop=true;
genBottom=true;


module igubalBlobule() {
	difference() {
		cube([10,45,10]);
		translate ([5,5,-5])
			cylinder(d=4.4, h=100);
		translate ([5,40,-5])
			cylinder(d=4.4, h=100);
	}
}

difference () {
	translate ([-25,0, 0]) {
		translate([0,0,0]) igubalBlobule();
		translate([40,0,0])igubalBlobule();
		translate([25,0,0])
				difference() {
					translate ([-15,0,0])cube([30,15,10]);
					translate([0,5,10]) rotate([-90,0,0]) cylinder(d=8,h=100);
				}
	}
	translate ([10, 7.5, -5]) cylinder(d=3.4, h=100);
	translate ([-10, 7.5, -5]) cylinder(d=3.4, h=100);
}

difference () {
	translate([-5,-10,0]) {
		cube([10,10,5]);
	}
	translate([0,-5,-1]) {
		cylinder(d=screwHoleDiam, h=100);
	}
}

if (genTop) {
difference() {
	translate ([-15,0,10])cube([30,15,10]);
	translate([0,5,10]) rotate([-90,0,0]) cylinder(d=8,h=100);
	
	translate ([10, 7.5, -5]) cylinder(d=3.4, h=100);
	translate ([-10, 7.5, -5]) cylinder(d=3.4, h=100);
}

difference() {
	translate ([-5,-10,15]) cube([10,10,5]);
	translate ([0,-5,0]) cylinder(d=screwHoleDiam, h=100);
}
}