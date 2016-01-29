include <Parameters.scad>;
use <GantryEnd2.scad>;
use <nutTrap.scad>;

module frontHalf(){
    for (y = [0, ZSupportSpacing]){
        r = 0;
           translate([r / 180 * (ZSupportSpacing + 10), y + r / 6, 30]){
                rotate([r, 90, 0]){
                    highTop();
                }
            }
        }
    }

module backHalf(){
    for (y = [0, ZSupportSpacing]){
    r = 180;
        translate([r / 180 * (ZSupportSpacing + 10), y + r / 6, 30]){
           rotate([r, 90, 0]){
                highTop();
            }
        }
    }
}

module support(){
    for (y = [15, 15 + ZSupportSpacing]){
        translate([10, y, 0,]){
            difference(){    
                hull(){
                    translate([platformLength / 3, 0, 30 - 3 * screwHoleDiam]){
                        cylinder(d = screwHoleDiam + 4, h = 3 * screwHoleDiam);
                    }
                    translate([0,0,30 - 4 * screwHoleDiam]){
                        cylinder(d = bracketThickness, h = 4 * screwHoleDiam);
                    }
                    
                }
                     translate([platformLength / 3, 0, 29 - 3 * screwHoleDiam]){
                        NutTrap();
                    }
                }
        }
    }
}


module movingSide(){
    union(){
        translate([- 30, 0, 0]){
            frontHalf();
        }
        difference(){
                translate([0, ZSupportSpacing / 2 + 5, 0]){
                    cube([10, ZSupportSpacing - 30, 30]);
                }
                for (z = [-.1 , 27.61]){
                    translate([5, ZSupportSpacing / 2 + 15, z]){
                        NutTrap();
                    }
                }
        }
        support();
    }
}

module otherSide(){
    union(){
        translate([- 30, 0, 0]){
            frontHalf();
        }
        translate([0, ZSupportSpacing / 2 + 5, 0]){
            cube([10, ZSupportSpacing - 30, 30]);
            }
        support();
    }
}

module clampHalf(){
        union(){
        translate([- 30, 0, 0]){
            frontHalf();
        }
        translate([0, ZSupportSpacing / 2 + 5, 0]){
            cube([10, ZSupportSpacing - 30, 30]);
            }
    }
}

movingSide();

rotate([0,0,180]){
    otherSide();
}