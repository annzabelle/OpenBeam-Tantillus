/* Frame and Hardware Parameters */
bracketThickness = 5;
extrusionThickness = 15;
narrowScrewHoleSpacing = 15;
wideScrewHoleSpacing = 30;
screwHoleDiam = 4;

/* BasePlate Parameters*/
BBPMountingHoles = true;
AirTripperMountingHoles = true;

/* Design Parameters */
XYSpacing = 20;
platformLength = 153;

/* Gear Parameters */
gearDiam = 30;

/*clamp parameters*/
clampWidth = 30;


/* 608 Bearing Mount Parameters */
bearingHolderWallThickness = 3;
bearingHolderWallHeight = 4;
bearingRadius = 11;

/* rod parameters */
rodClearance = 10;
rodDiam = 8;

/* top bracket parameters */
gearSpacing = 10; // spacing between gear and extrusion
exteriorSpace = 10; // spacing beyond the bearing mount

/* lower bracket parameters */
footHeight = 10;
footDimension = bracketThickness + extrusionThickness;
bracketInnerDimension = 30;

/* nema mount size */
nemaMountSize = 40;
slideyNemaMountSize = 60;

/* Z axis Parameters */
ZSupportSpacing = 50; //how wide the Z supports are
zSupportBeamSpacing = nemaMountSize / 2; //how far the z supports are from the beam

$fs = .5;
$fa = 3;
