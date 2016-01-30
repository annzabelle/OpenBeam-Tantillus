include <Parameters.scad>;
use <BracketPentagon.scad>;
use <BottomBracket.scad>;

BottomTotalDemension = extrusionThickness * 2 + gearSpacing * 2 + clampWidth + bracketThickness + platformLength;

module lowerCorners(){
	spacing = BottomTotalDemension + .01;
	for(x = [0, spacing]){
		for(y = [0, spacing])
		translate([x,y]) {
			rotate([0, 0, 90 * x / spacing - 90 * y / spacing + 180 * x * y / (spacing * spacing)]) {
				FlatBracketPentagon(x= bracketThickness + extrusionThickness + bracketInnerDimension + 1, w=extrusionThickness+bracketThickness + 1);
			}
		}
	}
}

module holes(){
	d = BottomTotalDemension - 2 * (bracketThickness + extrusionThickness + 1);
	step = d / 7;
	for(x = [7.5, BottomTotalDemension - 7.5]){
		for(y = [step + bracketThickness + extrusionThickness + 1: step: BottomTotalDemension - (bracketThickness + extrusionThickness + 1)]){
			translate([x,y]) {
				circle(d = screwHoleDiam);
			}
		}
}
			for(y = [7.5, BottomTotalDemension - 7.5]){
				for(x = [step + bracketThickness + extrusionThickness + 1: step: BottomTotalDemension - (bracketThickness + extrusionThickness + 1)]){
					translate([x,y]) {
						circle(d = screwHoleDiam);
					}
			 }
	}
}

module BBPMountingHoles(){
  for(x = [0, 100]){
    for(y = [0, 50]){
      translate ([x + BottomTotalDemension / 2 - 50, y + BottomTotalDemension / 2 - 50]){
        circle (d = 4);
      }
    }
  }
}

module AirTripperMountingHoles(){
  for(x = [0, 71]){
    translate([x - 35.5 + BottomTotalDemension / 2, BottomTotalDemension * .75]){
      circle(d = 7);
    }
  }
}

difference(){
		square([BottomTotalDemension, BottomTotalDemension]);
		lowerCorners();
		holes();
    if (BBPMountingHoles){
      BBPMountingHoles();
    }
    if(AirTripperMountingHoles){
      AirTripperMountingHoles();
    }
}
