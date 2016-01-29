include <Parameters.scad>;
use <zAxisMotorMount.scad>;


union(){
    translate([rodDiam / 2 + 1,extrusionThickness + rodDiam / 2+ zSupportBeamSpacing, 0]){
            zSupportMounts();
        }
    difference(){
        union(){
            translate([ZSupportSpacing / 2 - extrusionThickness / 2,0,0]){
                mountBar();
            }
            hull(){
                for (i = [0, ZSupportSpacing]){
                    translate([i + rodDiam / 2 + 1,extrusionThickness + rodDiam / 2+ zSupportBeamSpacing,0]){
                        cylinder(d = rodDiam + 2, h = bracketThickness);
                    }
                }for(i = [0, bracketThickness + extrusionThickness]){
                    translate([i + ZSupportSpacing / 2 - bracketThickness, bracketThickness]){
                        cylinder(r = bracketThickness, h = bracketThickness);
                    }
                }
            }
        }
        translate([ZSupportSpacing / 2 - extrusionThickness / 2 + bracketThickness, - 1, - 1]){
           cube([extrusionThickness, extrusionThickness + 1, 3 *narrowScrewHoleSpacing + bracketThickness]);
        }
    }
}