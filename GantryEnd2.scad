include <Parameters.scad>

genBottom = true;
genLowTop = false;
genHighTop = false;

if (genBottom) difference () {
	union() {
		cube([30, 40, 10]);
		cube([30,30,30]);
	}
	translate([15, 30, 10]) rotate([-90,0,0]) cylinder(h=11, d=8);

	translate([-1,15,30]) rotate([0,90,0]) cylinder(h=100, d=9);
	translate([17,15,30]) rotate([0,90,0]) cylinder(h=11, d=10);
	translate([3,15,30]) rotate([0,90,0]) cylinder(h=11, d=10);

	translate([5,5,-1]) cylinder(h=100, d=screwHoleDiam);
	translate([5,25,-1]) cylinder(h=100, d=screwHoleDiam);
	translate([25,25,-1]) cylinder(h=100, d=screwHoleDiam);
	translate([25,5,-1]) cylinder(h=100, d=screwHoleDiam);

	translate([5,35,-1]) cylinder(h=100, d=screwHoleDiam);
	translate([25,35,-1]) cylinder(h=100, d=screwHoleDiam);
}

if (genLowTop) difference () {
	translate([0,30,10]) cube ([30,10,10]);

	translate([15, 30, 10]) rotate([-90,0,0]) cylinder(h=11, d=8);

	translate([5,35,-1]) cylinder(h=100, d=screwHoleDiam);
	translate([25,35,-1]) cylinder(h=100, d=screwHoleDiam);
}

if (genHighTop) difference () {
	translate([0,0,30]) cube ([30,30,10]);

 	translate([-1,15,30]) rotate([0,90,0]) cylinder(h=100, d=9);
	translate([17,15,30]) rotate([0,90,0]) cylinder(h=11, d=10);
	translate([3,15,30]) rotate([0,90,0]) cylinder(h=11, d=10);

	translate([5,5,-1]) cylinder(h=100, d=screwHoleDiam);
	translate([5,25,-1]) cylinder(h=100, d=screwHoleDiam);
	translate([25,25,-1]) cylinder(h=100, d=screwHoleDiam);
	translate([25,5,-1]) cylinder(h=100, d=screwHoleDiam);
}