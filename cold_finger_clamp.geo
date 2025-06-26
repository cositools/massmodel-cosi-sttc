//////////////////////
//
//
// Geometry for the cold finger clamp
// By: Alyson Joens
// Date: 10/31/22
// Email: ajoens@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume ColdFingerClamp
ColdFingerClamp.Material Vacuum
ColdFingerClamp.Virtual true
ColdFingerClamp.Shape Brik 5.0 5.0 5.0


# Making the main mass of the cold finger clamp
Shape BRIK ClampBlock
ClampBlock.Parameters 0.9525 0.584 1.905
Shape TUBS ClampWindow
ClampWindow.Parameters 0.0 0.832 1.0 0.0 360.0
Orientation ClampWindowOri
ClampWindowOri.Position 0.0 .5585 0.0
ClampWindowOri.Rotation 0.0 90.0 0.0

Shape SUBTRACTION ClampBlockMinusWindow
ClampBlockMinusWindow.Parameters ClampBlock ClampWindow ClampWindowOri

# Place the Shell Front Support
Volume Clamp
Clamp.Material Alu6061
Clamp.Shape ClampBlockMinusWindow
Clamp.Color 9
Clamp.Mother ColdFingerClamp
Clamp.Position 0.0 0.0 0.0
Clamp.Visibility 1

