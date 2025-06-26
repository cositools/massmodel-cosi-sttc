//////////////////////
//
//
// Geometry for the cold finger assembly in the STTC
// By: Alyson Joens
// Date: 10/20/22
// Email: ajoens@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume ColdFingerAssem
ColdFingerAssem.Material Vacuum
ColdFingerAssem.Virtual true
ColdFingerAssem.Shape Brik 15.0 15.0 15.0

# Going to start by building from the inside out
# Therefore, sarting with the chicken finger inner pipe
Shape TUBS BottomInnerPipe
#BottomInnerPipe.Parameters 0.7875 0.9525 6.889 0.0 360.0 
BottomInnerPipe.Parameters 0.7875 0.9525 7.0045 0.0 360.0 
Shape TUBS SmallTopInnerPipe
#SmallTopInnerPipe.Parameters 0.7875 0.9525 1.0476 0.0 360.0
SmallTopInnerPipe.Parameters 0.7875 0.9525 0.959 0.0 360.0
Orientation SmallTopInnerPipeOri
SmallTopInnerPipeOri.Rotation 0.0 90.0 0.0
#SmallTopInnerPipeOri.Position 2.0001 0.0 7.8415
SmallTopInnerPipeOri.Position 1.905 0.0 7.957
Shape Union InnerBottomPlusInnerSmTop
InnerBottomPlusInnerSmTop.Parameters BottomInnerPipe SmallTopInnerPipe SmallTopInnerPipeOri


# Make small pipe to connect the larger radius of the bottom pipe to the upper pipe
Shape CONE BigToSmallPipe
BigToSmallPipe.Parameters 0.635 0.7875 0.9525 0.70485 0.79375
Orientation BigToSmallPipeOri
#BigToSmallPipeOri.Position 3.6836 0.0 7.957
BigToSmallPipeOri.Position 3.499 0.0 7.957
BigToSmallPipeOri.Rotation 0.0 90.0 0.0
Shape Union InnerSmTopPlusCone
InnerSmTopPlusCone.Parameters InnerBottomPlusInnerSmTop BigToSmallPipe BigToSmallPipeOri

# Make the top pipe
Shape TUBS TopInnerPipe
TopInnerPipe.Parameters 0.70585 0.79375 6.0775 0.0 360.0
Orientation TopInnerPipeOri
#TopInnerPipeOri.Position 10.3961 0.0 7.8415
TopInnerPipeOri.Position 10.2115 0.0 7.957
TopInnerPipeOri.Rotation 0.0 90.0 0.0
Shape Union ConeAssemPlusTopInnerPipe
ConeAssemPlusTopInnerPipe.Parameters InnerSmTopPlusCone TopInnerPipe TopInnerPipeOri


# Now Make the chicken Feeder outerpipe
Shape TUBS BottomOuterPipe
BottomOuterPipe.Parameters 1.74 1.905 6.31855 0.0 360.0
Shape TUBS TopOuterPipe
TopOuterPipe.Parameters 1.74 1.905 5.499 0.0 360.0
Orientation TopOuterPipeOri
TopOuterPipeOri.Position -1.943 0.0 8.22355
TopOuterPipeOri.Rotation 0.0 90.0 0.0
Shape Union BottomOuterPipePlusTopOuterPipe
BottomOuterPipePlusTopOuterPipe.Parameters BottomOuterPipe TopOuterPipe TopOuterPipeOri

Orientation InnerPipePlusOuterPipeOri
InnerPipePlusOuterPipeOri.Position 0.0 0.0 0.0
Shape Union InnerPipePlusOuterPipe
InnerPipePlusOuterPipe.Parameters ConeAssemPlusTopInnerPipe BottomOuterPipePlusTopOuterPipe InnerPipePlusOuterPipeOri

Shape SPHERE BotAndTopOuterPipeConnec1
#BotAndTopOuterPipeConnec1.Parameters 1.74 1.905 0.0 180.0 85.0 120.0
BotAndTopOuterPipeConnec1.Parameters 1.475 1.6 0.0 180.0 85.0 120.0
Orientation BotAndTopOuterPipeConnec1Ori
BotAndTopOuterPipeConnec1Ori.Position 0.0 0.35 6.41855
BotAndTopOuterPipeConnec1Ori.Rotation 0.0 90.0 0.0

Shape Union PipesPlusOuterPipeConnector1
PipesPlusOuterPipeConnector1.Parameters InnerPipePlusOuterPipe BotAndTopOuterPipeConnec1 BotAndTopOuterPipeConnec1Ori

Shape SPHERE BotAndTopOuterPipeConnec2
BotAndTopOuterPipeConnec2.Parameters 1.475 1.6 0.0 180.0 85.0 120.0
Orientation BotAndTopOuterPipeConnec2Ori
BotAndTopOuterPipeConnec2Ori.Position 0.0 -0.35 6.41855
BotAndTopOuterPipeConnec2Ori.Rotation 180.0 90.0 0.0

Shape Union PipesPlusOuterPipeConnector2
PipesPlusOuterPipeConnector2.Parameters PipesPlusOuterPipeConnector1 BotAndTopOuterPipeConnec2 BotAndTopOuterPipeConnec2Ori

# Now add the Top Flange
Shape TUBS TopFlange
TopFlange.Parameters 0.9525 5.08 0.508 0.0 360.0
Orientation TopFlangeOri
TopFlangeOri.Position 0.0 0.0 -6.66

Shape Union PipesPlusTopFlange
PipesPlusTopFlange.Parameters PipesPlusOuterPipeConnector2 TopFlange TopFlangeOri

# Now add the Front Flange
Shape TUBS FrontFlange
FrontFlange.Parameters 1.905 5.3975 0.508 0.0 360.0
Orientation FrontFlangeOri
FrontFlangeOri.Rotation 0.0 90.0 0.0
FrontFlangeOri.Position 3.683 0.0 8.22355
#FrontFlangeOri.Position 3.682 0.0 8.22355

Shape Union PipesPlusFrontFlange
PipesPlusFrontFlange.Parameters PipesPlusTopFlange FrontFlange FrontFlangeOri

#Finally add the Conflate
Shape TUBS Conflate
Conflate.Parameters 1.905 3.4925 0.635 0.0 360.0
Orientation ConflateOri
ConflateOri.Position -6.9848 0.0 8.22355
ConflateOri.Rotation 0.0 90.0 0.0

Shape Union PipesPlusConflate
PipesPlusConflate.Parameters PipesPlusFrontFlange Conflate ConflateOri

Volume ColdFinger
ColdFinger.Material Aluminium
ColdFinger.Shape PipesPlusConflate
ColdFinger.Color 4
ColdFinger.Mother ColdFingerAssem
#ColdFinger.Position 7.8485 0.0 0.0
ColdFinger.Position 0.0 0.0 0.0
ColdFinger.Visibility 1
