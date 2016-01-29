include <Parameters.scad>;
use <nemaMounts.scad>;
use <upperCornerBrackets.scad>;

bracket(1); //1forx2fory

rotate(180){
    bracket(2);
}

module bracket (1forx2fory){
    squareY = extrusionThickness + bearingHolderWallThickness * 2+ bearingRadius * 2 + gearDiam + gearSpacing;
    squareX = extrusionThickness + bearingHolderWallThickness + bearingRadius * 2 + gearDiam / 2+ slideyNemaMountSize + bracketThickness + gearSpacing;  
    if(1forx2fory ==2) {
        squareX = extrusionThickness + bearingHolderWallThickness + bearingRadius * 2 + gearDiam / 2+ slideyNemaMountSize + XYSpacing + gearSpacing;
        stepX = (squareX - extrusionThickness + 1) / 7;
        stepY = (squareY - extrusionThickness + 1) / 4;
        difference(){
            square([squareX, squareY]);
            for (i = [stepX + extrusionThickness: stepX: 7 * stepX + extrusionThickness]) {
                translate([i, extrusionThickness/2]){
                    circle(d = screwHoleDiam);
                }
            }
            for (i = [stepY + extrusionThickness: stepY: 3 * stepY + extrusionThickness]) {
                translate([extrusionThickness/2, i]){
                    circle(d = screwHoleDiam);
                }
            } 
            square([extrusionThickness + 1, extrusionThickness +1]);
            translate([slideyNemaMountSize / 2 + extrusionThickness + bracketThickness +  bearingHolderWallThickness / 2 + gearSpacing + bearingRadius / 2 + XYSpacing + gearDiam, gearDiam / 2 + bearingHolderWallThickness / 2 + bearingRadius / 2 + extrusionThickness + bracketThickness + gearSpacing]){
                rotate(180){
                    flatSlideyNema17Mount(10);
                }
            }
            translate([bearingHolderWallThickness / 2 + bearingRadius / 2 + extrusionThickness + bracketThickness + gearDiam / 2 + XYSpacing + gearSpacing, (bearingHolderWallThickness / 2 + bearingRadius / 2) + extrusionThickness + bracketThickness + gearDiam / 2 + gearSpacing]){
                circle(d = rodClearance);
            }
        }
    }else{
        stepX = (squareX - extrusionThickness + 1) / 6;
        stepY = (squareY - extrusionThickness + 1) / 4;
        difference(){
            square([squareX, squareY]);
            for (i = [stepX + extrusionThickness: stepX: 5 * stepX + extrusionThickness]) {
                translate([i, extrusionThickness/2]){
                    circle(d = screwHoleDiam);
                }
            }
            for (i = [stepY + extrusionThickness: stepY: 3 * stepY + extrusionThickness]) {
                translate([extrusionThickness/2, i]){
                    circle(d = screwHoleDiam);
                }
            } 
            square([extrusionThickness + 1, extrusionThickness + 1]);
            translate([slideyNemaMountSize / 2 + extrusionThickness + bracketThickness +  bearingHolderWallThickness / 2 + bearingRadius / 2 + gearDiam + gearSpacing, gearDiam / 2 + bearingHolderWallThickness / 2 + bearingRadius / 2 + extrusionThickness + bracketThickness + gearSpacing]){
                rotate(180){
                    flatSlideyNema17Mount(10);
                }
            }
            translate([bearingHolderWallThickness / 2 + bearingRadius / 2 + extrusionThickness + bracketThickness + gearDiam / 2 + gearSpacing, (bearingHolderWallThickness / 2 + bearingRadius / 2) + extrusionThickness + bracketThickness + gearDiam / 2 + gearSpacing]){
                circle(d = rodClearance);
            }
        }
    }
}