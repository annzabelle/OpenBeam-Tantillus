include <Parameters.scad>;
use <BracketPentagon.scad>;
use <Bottom Bracket.scad>;

BottomTotalDemension = extrusionThickness * 2 + gearSpacing * 2 + clampWidth + bracketThickness + platformLength;

module lowerCorners(){
  for(x = [0, BottomTotalDemension -bracketThickness + extrusionThickness + bracketInnerDimension  - 1]){
    for(y = [0, BottomTotalDemension - bracketThickness + extrusionThickness + bracketInnerDimension - 1])
      translate([x,y]) FlatBracketPentagon(x= bracketThickness + extrusionThickness + bracketInnerDimension + 1, w=extrusionThickness+bracketThickness + 1);
  }
}

lowerCorners();
