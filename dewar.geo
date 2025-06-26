//////////////////////
//
//
// Geometry for the dewar
// By: Alyson Joens
// Date: 11/05/22
// Email: ajoens@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume Dewar
Dewar.Material Vacuum
Dewar.Virtual true
Dewar.Shape Brik 35.0 35.0 45.0

Volume DewarMass
DewarMass.Material Aluminium
DewarMass.Visibility 1
DewarMass.Color 15
#Don't know the thickness of the dewar so just assuming 1/4
DewarMass.Shape TUBS 13.845 13.970 19.614 0.0 360.0
DewarMass.Position 0.0 0.0 0.0
DewarMass.Mother Dewar

# Need to make the bottom closed part of the Dewar
Volume DewarBottomClose
DewarBottomClose.Material Aluminium
DewarBottomClose.Visibility 1
DewarBottomClose.Color 15
#Don't know the thickness of the dewar so just assuming 1/4
DewarBottomClose.Shape TUBS 2.54 13.970 0.125 0.0 360.0
DewarBottomClose.Position 0.0 0.0 -19.739
DewarBottomClose.Mother Dewar

# Making the cylinder on the bottom of the dewar (assuming the cylinder is 1/4 cm thick again) with the also the flange
Shape TUBS DewarBase
DewarBase.Parameters 2.415 2.54 2.8575 0.0 360.0
Shape TUBS DewarBaseFlange
DewarBaseFlange.Parameters 1.27 5.08 0.3175 0.0 360.0
Orientation DewarBaseFlangeOri
DewarBaseFlangeOri.Position 0.0 0.0 -3.175

Shape UNION DewarBasePlusFlange
DewarBasePlusFlange.Parameters DewarBase DewarBaseFlange DewarBaseFlangeOri

# Making the cold N2 pipe from dewar into the STTC
Shape TUBS DewarColdPipe
DewarColdPipe.Parameters 0.432 0.635 5.08 0.0 360.0
Orientation DewarColdPipeOri
DewarColdPipeOri.Position 0.0 0.0 -6.0325

Shape UNION DewarBasePlusDewarColdPipe
DewarBasePlusDewarColdPipe.Parameters DewarBasePlusFlange DewarColdPipe DewarColdPipeOri

Volume DewarBottom
DewarBottom.Material Aluminium
DewarBottom.Visibility 1
DewarBottom.Color 15
DewarBottom.Shape DewarBasePlusDewarColdPipe
DewarBottom.Position 0.0 0.0 -22.4715
DewarBottom.Mother Dewar


# Now making the Dewar top
Shape CONE DewarCone
DewarCone.Parameters 2.236 13.845 13.970 4.0025 4.1275
Shape TUBS DewarConeCyl
DewarConeCyl.Parameters 2.8575 4.1275 5.08 0.0 360.0
Orientation DewarConeOri
DewarConeOri.Position 0.0 0.0 -2.085

Shape UNION DewarConePlusCyl
DewarConePlusCyl.Parameters DewarCone DewarConeCyl DewarConeOri

# Need to close of the dewar cylinder
Shape TUBS DewarCylClose
DewarCylClose.Parameters 0.0 2.8575 0.125 0.0 360.0
Orientation DewarCylCloseOri
DewarCylCloseOri.Position 0.0 0.0 -7.165

Shape UNION DewarCylPlusBot
DewarCylPlusBot.Parameters DewarConePlusCyl DewarCylClose DewarCylCloseOri

Volume DewarTop
DewarTop.Material Aluminium
DewarTop.Visibility 1
DewarTop.Color 15
DewarTop.Shape DewarCylPlusBot
DewarTop.Position 0.0 0.0 21.85
DewarTop.Mother Dewar

