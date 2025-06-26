//////////////////////
//
//
// Geometry for the STTC chamber incluing the side panels.
// By: Alyson Joens
// Date: 10/31/22
// Email: ajoens@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume Chamber
Chamber.Material Vacuum
Chamber.Virtual true
Chamber.Shape Brik 25.0 25.0 25.0

# Making the chamber body
Shape BRIK ChamberBody
ChamberBody.Parameters 14.2875 2.8575 9.8425
Shape BRIK ChamberCavity
ChamberCavity.Parameters 12.2555 2.9 7.8105
Orientation ChamberCavityOri
ChamberCavityOri.Position 0.0 0.0 0.0

Shape SUBTRACTION ChamberBodyMinusCavity
ChamberBodyMinusCavity.Parameters ChamberBody ChamberCavity ChamberCavityOri

# Creating holes for Feedthrough Adapters
Shape BRIK FeedthroughAdapterHole
FeedthroughAdapterHole.Parameters 4.1275 0.9525 1.02
Orientation FeedthroughAdapterHoleOri
FeedthroughAdapterHoleOri.Position 2.015 0.0 8.825

Shape SUBTRACTION ChamberMinusFeedthroughTop
ChamberMinusFeedthroughTop.Parameters ChamberBodyMinusCavity FeedthroughAdapterHole FeedthroughAdapterHoleOri

# Creating holes for Feedthrough Adapter on side
Shape BRIK FeedthroughAdapterHole2
# Making the x value larger since it's not subtracting out all the mass for some reason
FeedthroughAdapterHole2.Parameters 1.1 0.9525 4.1275
Orientation FeedthroughAdapterHole2Ori
FeedthroughAdapterHole2Ori.Position -13.335 0.0 0.317

Shape SUBTRACTION ChamberMinusFeedthroughSide
ChamberMinusFeedthroughSide.Parameters ChamberMinusFeedthroughTop FeedthroughAdapterHole2 FeedthroughAdapterHole2Ori

# Creating circular holes
Shape TUBS ChamberCircleHoleTop
ChamberCircleHoleTop.Parameters 0.0 0.8575 1.1 0.0 360.0
Orientation ChamberCircleHoleTopOri
ChamberCircleHoleTopOri.Position -9.386 0.0 8.8125

Shape SUBTRACTION ChamberMinusCircleHoleTop
ChamberMinusCircleHoleTop.Parameters ChamberMinusFeedthroughSide ChamberCircleHoleTop ChamberCircleHoleTopOri

Shape TUBS ChamberCircleHoleBot
ChamberCircleHoleBot.Parameters 0.0 0.8575 1.1 0.0 360.0
Orientation ChamberCircleHoleBotOri
ChamberCircleHoleBotOri.Position 8.079 0.0 -8.8125

Shape SUBTRACTION ChamberMinusCircleHoleBot
ChamberMinusCircleHoleBot.Parameters ChamberMinusCircleHoleTop ChamberCircleHoleBot ChamberCircleHoleBotOri

Shape TUBS ChamberCircleHoleSide
ChamberCircleHoleSide.Parameters 0.0 0.8575 1.4 0.0 360.0
Orientation ChamberCircleHoleSideOri
ChamberCircleHoleSideOri.Rotation 0.0 90.0 0.0
ChamberCircleHoleSideOri.Position 13.2875 0.0 7.302

# When looking in geomega this hole doesn't appear to go fully through but it should... look into
Shape SUBTRACTION ChamberMinusCircleHoleSide
ChamberMinusCircleHoleSide.Parameters ChamberMinusCircleHoleBot ChamberCircleHoleSide ChamberCircleHoleSideOri

# Now make the feedthrough adapters
Shape BRIK FeedthroughAdapterTop 
FeedthroughAdapterTop.Parameters 5.715 2.3495 0.3925
Orientation FeedthroughAdapterTopOri
FeedthroughAdapterTopOri.Position 2.6355 0.0 10.235

Shape UNION ChamberPlusAdapterTop
ChamberPlusAdapterTop.Parameters ChamberMinusCircleHoleSide FeedthroughAdapterTop FeedthroughAdapterTopOri

Shape BRIK FeedthroughAdapterSide
FeedthroughAdapterSide.Parameters 0.3925 2.3495 5.715
Orientation FeedthroughAdapterSideOri
FeedthroughAdapterSideOri.Position -14.68 0.0 1.255

Shape UNION ChamberPlusAdapterSide
ChamberPlusAdapterSide.Parameters ChamberPlusAdapterTop FeedthroughAdapterSide FeedthroughAdapterSideOri

# Make the Feedthrough Pressure Plates
Shape BRIK FeedthroughPressurePlateTop
FeedthroughPressurePlateTop.Parameters 3.1815 0.711 0.0925
Orientation FeedthroughPressurePlateTopOri
FeedthroughPressurePlateTopOri.Position 1.796 0.0 10.72

Shape UNION ChamberPlusPressurePlateTop
ChamberPlusPressurePlateTop.Parameters ChamberPlusAdapterSide FeedthroughPressurePlateTop FeedthroughPressurePlateTopOri

Shape BRIK FeedthroughPressurePlateSide
FeedthroughPressurePlateSide.Parameters 0.0925 0.711 3.1815
Orientation FeedthroughPressurePlateSideOri
FeedthroughPressurePlateSideOri.Position -15.165 0.0 0.788

Shape UNION ChamberPlusPressurePlateSide
ChamberPlusPressurePlateSide.Parameters ChamberPlusPressurePlateTop FeedthroughPressurePlateSide FeedthroughPressurePlateSideOri

# Make the Bottom cold finger hole and base connection
Shape BRIK ChamberColdFingerBase
ChamberColdFingerBase.Parameters 1.905 2.8575 2.54
Orientation ChamberColdFingerBaseOri
ChamberColdFingerBaseOri.Position 16.1925 0.0 0.0

Shape UNION ChamberPlusColdFingerBase
ChamberPlusColdFingerBase.Parameters ChamberPlusPressurePlateSide ChamberColdFingerBase ChamberColdFingerBaseOri

Shape BRIK ChamberColdFingerBaseBig
ChamberColdFingerBaseBig.Parameters 0.635 5.08 5.08
Orientation ChamberColdFingerBaseBigOri
ChamberColdFingerBaseBigOri.Position 18.7325 0.0 0.0

Shape UNION ChamberPlusColdFingerBaseBig
ChamberPlusColdFingerBaseBig.Parameters ChamberPlusColdFingerBase ChamberColdFingerBaseBig ChamberColdFingerBaseBigOri

# Add hole through the base and chamber
# I think this hole is giving me trouble so I am going to make it way larger than it should be in length
Shape TUBS ChamberBaseHole
ChamberBaseHole.Parameters 0.0 1.778 4.8 0.0 360.0
Orientation ChamberBaseHoleOri
ChamberBaseHoleOri.Rotation 0.0 90.0 0.0
ChamberBaseHoleOri.Position 16.0 0.0 0.0

Shape SUBTRACTION ChamberMinusBaseHole
ChamberMinusBaseHole.Parameters ChamberPlusColdFingerBaseBig ChamberBaseHole ChamberBaseHoleOri

Volume SttcChamber
SttcChamber.Material Aluminium
SttcChamber.Shape ChamberMinusBaseHole
SttcChamber.Color 7
SttcChamber.Mother Chamber
SttcChamber.Position 0.0 0.0 0.0
SttcChamber.Visibility 1


# Now adding the bracket which will be it's own volume
Shape BRIK BracketBase
#BracketBase.Parameters 0.0635 3.175 4.445
BracketBase.Parameters 0.0635 2.54 4.445
Shape BRIK BracketBaseCornerCut1
BracketBaseCornerCut1.Parameters 0.064 0.95 0.95
Shape BRIK BracketBaseCornerCut2
BracketBaseCornerCut2.Parameters 0.064 0.95 0.95
Shape BRIK BracketBaseCornerCut3
BracketBaseCornerCut3.Parameters 0.064 0.95 0.95
Shape BRIK BracketBaseCornerCut4
BracketBaseCornerCut4.Parameters 0.064 0.95 0.95

Orientation BracketBaseMinusCornerCut1Ori
BracketBaseMinusCornerCut1Ori.Rotation 45.0 0.0 0.0
BracketBaseMinusCornerCut1Ori.Position 0.0 2.54 4.445
Orientation BracketBaseMinusCornerCut2Ori
BracketBaseMinusCornerCut2Ori.Rotation 45.0 0.0 0.0
BracketBaseMinusCornerCut2Ori.Position 0.0 2.54 -4.445
Orientation BracketBaseMinusCornerCut3Ori
BracketBaseMinusCornerCut3Ori.Rotation -45.0 0.0 0.0
BracketBaseMinusCornerCut3Ori.Position 0.0 -2.54 4.445
Orientation BracketBaseMinusCornerCut4Ori
BracketBaseMinusCornerCut4Ori.Rotation -45.0 0.0 0.0
BracketBaseMinusCornerCut4Ori.Position 0.0 -2.54 -4.445

Shape SUBTRACTION BracketBaseMinusCornerCut1
BracketBaseMinusCornerCut1.Parameters BracketBase BracketBaseCornerCut1 BracketBaseMinusCornerCut1Ori
Shape SUBTRACTION BracketBaseMinusCornerCut2
BracketBaseMinusCornerCut2.Parameters BracketBaseMinusCornerCut1 BracketBaseCornerCut2 BracketBaseMinusCornerCut2Ori
Shape SUBTRACTION BracketBaseMinusCornerCut3
BracketBaseMinusCornerCut3.Parameters BracketBaseMinusCornerCut2 BracketBaseCornerCut3 BracketBaseMinusCornerCut3Ori
Shape SUBTRACTION BracketBaseMinusCornerCut4
BracketBaseMinusCornerCut4.Parameters BracketBaseMinusCornerCut3 BracketBaseCornerCut4 BracketBaseMinusCornerCut4Ori

# Now add the hole to the base
Shape TUBS BracketBaseHole
BracketBaseHole.Parameters 0.0 1.778 0.3 0.0 360.0

Orientation BracketBaseHoleOri
BracketBaseHoleOri.Rotation 0.0 90.0 0.0
BracketBaseHoleOri.Position 0.0 0.0 0.0

Shape SUBTRACTION BracketBaseMinusHole
BracketBaseMinusHole.Parameters BracketBaseMinusCornerCut4 BracketBaseHole BracketBaseHoleOri

# Add the cylinder part to the bracket
Shape TUBS BracketBaseCylinder
BracketBaseCylinder.Parameters 1.778 2.032 0.762 0.0 360.0
Orientation BracketBaseCylinderOri
BracketBaseCylinderOri.Rotation 0.0 90.0 0.0
BracketBaseCylinderOri.Position -0.8255 0.0 0.0

Shape UNION BracketBasePlusCylinder
BracketBasePlusCylinder.Parameters BracketBaseMinusHole BracketBaseCylinder BracketBaseCylinderOri


Volume SttcChamberBracket
SttcChamberBracket.Material Aluminium
SttcChamberBracket.Shape BracketBasePlusCylinder
SttcChamberBracket.Color 3
SttcChamberBracket.Mother Chamber
SttcChamberBracket.Position 12.192 0.0 0.0
SttcChamberBracket.Visibility 1
