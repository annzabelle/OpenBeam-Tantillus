include <Parameters.scad>;
module BracketPentagon(x, y=0, height=bracketThickness, w=extrusionThickness) {
	y = y == 0 ? x : y;
	linear_extrude(height=height) polygon(points=[[0,0],[x,0],[x,w],[w,y],[0,y]]);
}
module FlatBracketPentagon(x, y=0, w=extrusionThickness) {
	y = y == 0 ? x : y;
	polygon(points=[[0,0],[x,0],[x,w],[w,y],[0,y]]);
}

BracketPentagon(40);
