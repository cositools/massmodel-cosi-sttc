//////////////////////
//
//
// Geometry for the stand base, shell front support, and cold finger support in the STTC
// By: Alyson Joens
// Date: 10/24/22
// Email: ajoens@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume StandBase
StandBase.Material Vacuum
StandBase.Virtual true
StandBase.Shape Brik 25.0 25.0 5.0

# The stand base on its own
Volume StandBaseSolo
StandBaseSolo.Material Aluminium
StandBaseSolo.Shape BRIK 22.86 17.145 0.3175
StandBaseSolo.Position 0.0 0.0 0.0
StandBaseSolo.Mother StandBase
StandBaseSolo.Visibility 1

# Pegboard HV side
Volume PegBoardLeft
PegBoardLeft.Material Aluminium
PegBoardLeft.Color 15
PegBoardLeft.Shape BRIK 24.15 30.55 0.25
PegBoardLeft.Position 0.0 37.0 7.326
PegBoardLeft.Mother StandBase
PegBoardLeft.Visibility 1

# Pegboard LV side
Volume PegBoardRight
PegBoardRight.Material Aluminium
PegBoardRight.Color 15
PegBoardRight.Shape BRIK 24.15 30.55 0.25
PegBoardRight.Position 0.0 -37.0 7.326
PegBoardRight.Mother StandBase
PegBoardRight.Visibility 1


# Now making the shell front support
Shape BRIK LowerBlockLSupport
#LowerBlockLSupport.Parameters 1.27 2.2225 2.3895
LowerBlockLSupport.Parameters 1.27 2.2225 2.548
Shape BRIK UpperBlockLSupport
UpperBlockLSupport.Parameters 2.54 2.2225 0.635
Orientation UpperBlockLSupportOri
#UpperBlockLSupportOri.Position -1.27 0.0 3.0245 
UpperBlockLSupportOri.Position -1.27 0.0 3.183

Shape Union LSupport
LSupport.Parameters LowerBlockLSupport UpperBlockLSupport UpperBlockLSupportOri

# Place the Shell Front Support
Volume ShellFrontSupport
ShellFrontSupport.Material Aluminium
ShellFrontSupport.Shape LSupport
ShellFrontSupport.Color 4
ShellFrontSupport.Mother StandBase
#ShellFrontSupport.Position -18.097 0.0 2.707
ShellFrontSupport.Position -18.097 0.0 2.8655
ShellFrontSupport.Visibility 1

# Now for the Cold Finger Support
Shape BRIK BaseSupport
BaseSupport.Parameters 1.27 5.3975 10.16
Shape BRIK ColdFingerSquareHole
ColdFingerSquareHole.Parameters 1.28 2.064 2.058
Orientation ColdFingerSquareHoleOri
ColdFingerSquareHoleOri.Position 0.0 0.0 8.105

Shape Subtraction BaseSupportMinusSquareHole
BaseSupportMinusSquareHole.Parameters BaseSupport ColdFingerSquareHole ColdFingerSquareHoleOri

# Now making the circular cutout
Shape TUBE ColdFingerCircleHole
ColdFingerCircleHole.Parameters 0.0 2.064 1.28 0.0 360.0
Orientation ColdFingerCircleHoleOri
ColdFingerCircleHoleOri.Rotation 0.0 90.0 0.0
ColdFingerCircleHoleOri.Position 0.0 0.0 6.049
#ColdFingerCircleHoleOri.Position 0.0 0.0 5.9495

Shape Subtraction BaseSupportMinusCircleHole
BaseSupportMinusCircleHole.Parameters BaseSupportMinusSquareHole ColdFingerCircleHole ColdFingerCircleHoleOri

Volume ColdFingerSupport
ColdFingerSupport.Material Aluminium
ColdFingerSupport.Shape BaseSupportMinusCircleHole
ColdFingerSupport.Color 12
ColdFingerSupport.Mother StandBase
#ColdFingerSupport.Position 14.033 0.0 10.795
ColdFingerSupport.Position 14.0335 0.0 10.4775
ColdFingerSupport.Visibility 1
