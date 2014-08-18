include <Parameters.scad>;
module LShape(x, y, height=bracketThickness, wx=extrusionThickness, wy=extrusionThickness) {
	linear_extrude(height=height) polygon(points=[[0,0],[x,0],[x,wx],[wy,wx],[wy,y],[0,y]]);
}

LShape(40,50,5,10,20);