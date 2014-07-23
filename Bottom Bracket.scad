include <Parameters.scad>;

bracketFullDimension = bracketThickness + extrusionThickness + bracketInnerDimension;

linear_extrude(height=bracketThickness)
polygon([[0, 0], [bracketFullDimension, 0], [bracketFullDimension, extrusionThickness + bracketThickness], [extrusionThickness + bracketThickness, bracketFullDimension], [0, bracketFullDimension]]);

translate([0, 5, 0])
rotate([90, 0, 0])
linear_extrude(height=bracketThickness)
polygon([[0, 0], [bracketFullDimension, 0], [bracketFullDimension, extrusionThickness + bracketThickness], [extrusionThickness + bracketThickness, bracketFullDimension], [0, bracketFullDimension]]);

translate([5, 0, 0])
rotate([0, -90, 0])
linear_extrude(height=bracketThickness)
polygon([[0, 0], [bracketFullDimension, 0], [bracketFullDimension, extrusionThickness + bracketThickness], [extrusionThickness + bracketThickness, bracketFullDimension], [0, bracketFullDimension]]);

translate([0, 0, -footHeight])
cube([footDimension, footDimension, footHeight]);


