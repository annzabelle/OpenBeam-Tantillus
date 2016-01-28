module slotNutTrap(holeOffset, holeDiam, holeDepth, slotWidth, slotDepth, slotThickness) {
    translate([0, 0, - holeDepth / 2]){
        cylinder(h = holeDepth, d =holeDiam);
    }
    translate([-slotWidth / 2, - holeOffset, - slotThickness / 2]){
        cube([slotWidth, slotDepth, slotThickness]);
    }
}

slotNutTrap(2.7, 4, 12, 5.5, 10, 3);