include <Parameters.scad>
use <nemaMounts.scad>

module nema17MountFace(){
  difference(){
    cube([nemaMountSize + 2 * bracketThickness,nemaMountSize + 3 * bracketThickness + extrusionThickness,bracketThickness], [0,0,bracketThickness / 2]);
    translate([nemaMountSize / 2 + 5, nemaMountSize / 2 + extrusionThickness + 2 * bracketThickness, -0.5]){
      nema17Mount(bracketThickness * 3);
    }
  }
}

module mountBar(){
  difference(){
    cube([2 * bracketThickness + extrusionThickness, bracketThickness + extrusionThickness, 3 * narrowScrewHoleSpacing], [0, 0, bracketThickness]);
    rotate([0,270,0]){
      screwHole(bracketThickness + narrowScrewHoleSpacing);
      screwHole(bracketThickness + 2 * narrowScrewHoleSpacing);
    }
  }
}

module screwHole(xSpacing){
  translate([xSpacing, extrusionThickness / 2, -2.5 * bracketThickness - extrusionThickness]){
    cylinder(3 * bracketThickness + extrusionThickness, screwHoleDiam / 2, screwHoleDiam / 2, 0);
  }
}

module extrusionCube(height) {
  translate([0,-1,-1]) {
        cube([extrusionThickness, extrusionThickness+1, height+2], 0);
    }
}

module zSupportMounts (){
    for (i = [0, ZSupportSpacing]){
        translate([i,0,0]){
            difference(){
                cylinder(d = rodDiam + 4, h = 2 * rodDiam + 5);
                translate([0,0,5]){
                    cylinder(d = rodDiam, h = 2 * rodDiam + 5);
                }
            }
        }
    }
}

difference(){
  union(){
    nema17MountFace();
    translate([nemaMountSize / 2 - extrusionThickness / 2,0,0]){
      mountBar();
    }
        translate([0, extrusionThickness + rodDiam + 2 + zSupportBeamSpacing, 0]){
            zSupportMounts();
        }
  }
  translate([nemaMountSize / 2 + bracketThickness - extrusionThickness / 2,0,0]){
    extrusionCube(bracketThickness + 3 * narrowScrewHoleSpacing);
  }
}
