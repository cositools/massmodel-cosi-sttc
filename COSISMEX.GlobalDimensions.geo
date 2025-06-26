# This file contains all GLOBAL dimensions important beyond individual sub-directories

#######################################################
# Cryostat

Constant SCTopEffectiveThickness  1.0
Constant SCSideEffectiveThickness     0.55
Constant SCBottomEffectiveThickness   0.55
Constant SCHeight  50.0
Constant SCRadius  55.0

Constant OuterRadius { SCRadius / cos(30*TMath::DegToRad()) } 

#######################################################
# Cryostat

# Fillers
# Defined this as the distance between the IRShield and the inner cryostat wall
# AJ - 4/30/23 Don't know the exact dimension for this, need to verify it and can then use it to define the cryostat distance. Assuming the cryostat outer wall and the IRshields are the right dimensions, it should be 3.4075
Constant CryostatXSpiel 2.195
Constant CryostatYSpiel 2.195
Constant CryostatZSpiel 0.1

# Exact
Constant CryostatXYFullThickness 0.158
# Exact
Constant CryostatZTopFullThickness 0.317
# Guesstimated
Constant CryostatZBottomFullThickness 1.651

# unsure of CryostatXSpiel dimension so I'm doing the cryostat dimensions based off what I know they should be
# Current 4/24/23 - Should be 33.02 / 2
#Constant CryostatOuterX { 0.5 * IRShieldX + CryostatXSpiel + CryostatXYFullThickness }
Constant CryostatOuterX { 33.02/2 }
# Current 4/24/23 - Should be: 29.451 / 2
#Constant CryostatOuterY { 0.5 * IRShieldY + CryostatYSpiel + CryostatXYFullThickness }
Constant CryostatOuterY { 29.451/2 }
# Current 4/24/23 - Should be 16.51 / 2
Constant CryostatOuterZ  { ( 16.192 + CryostatZTopFullThickness) / 2.0 }

# Cryostat baseplate
# Don't have the final cryostat design yet so these dimensions can't be directly tied to anything
# these are half dimensions
Constant CryoBaseX 22.86
Constant CryoBaseY 21.082
Constant CryoBaseZ 0.3175


Constant CryoLidZ 1.2075

#This is the lifted part on the cryostat base which makes up the bottom of the cryostat
# This is half dimensions
Constant CryoBaseStageX CryostatOuterX
Constant CryoBaseStageY CryostatOuterY
Constant CryoBaseStageZ 0.8255


Echo "Cryostat Outer X (16.9): CryostatOuterX"
Echo "Cryostat Outer Y (15.1): CryostatOuterY"
Echo "Cryostat Outer Z (9): CryostatOuterZ"

Constant BaseFill 0.0   // this was 1.5 for v1 with bottom electr.

Constant Cryostat_Interior_HalfHeigth { CryostatOuterZ - 0.5*(CryostatZTopFullThickness+CryostatZBottomFullThickness) }

Constant CryostatZPos { ShieldedHeight - 0.5*BGOWallFullThicknessTop - CryostatOuterZ }
Echo "Cryo Z: CryostatZPos"

#######################################################
# Detector Constants

Constant NLayers 4

Constant allDetX {2*5.3025 + 0.05}
Constant allDetY {2*0.4 + 2*4.791 + 0.05}
Constant allDetZ {NLayers * 2.54 * 0.5}

#Constant DetX {5.3025 - .6535}
Constant DetX {5.3025 - 0.53}
#Constant DetY {4.791 + 0.1035}
Constant DetY {4.791 + 0.474}

# Exact: 4.4
Constant DetXHalfGap { 1.4 + 0.5* ColdfingerDepth }
# Exact: 0.9
Constant DetYHalfGap 0.45

Echo "Detector X gap (2.2): DetXHalfGap"
Echo "Detector Y gap (0.45): DetYHalfGap"

Constant DetZPos { ColdfingerBasePosZ + ColdfingerBaseHeight + 0.5*2.54 -1.0165-.698}
Constant IngotRadius { 2* 2.54}
# Constant DetectorHalfHeight 0.7575 - Defined in the .geo.setup file for the individual detectors
Constant DetectorHalfWidth 4.025
Constant GuardRingSize      0.3

#######################################################
# Detector Holder Base
Constant DHB_HalfWidth   {0.5*1.27}
#The side along x has a larger bigger width than the other side so I added another constant
Constant DHB_HalfWidth_AlongY   {0.5*0.635}
Constant DHB_HalfWidth_AlongX   {0.5*0.752}
Constant DHB_HalfHeight  {0.5*ColdfingerBaseHeight}
Constant DHB_IRShield_Gap  0.05
Constant DHB_CentStrucBase_HalfHeight 1.429
Constant DHB_CentStrucBase_HalfWidth 0.7935
Constant DHB_CentStrucArms_HalfHeight {5.1435-.0028}
Constant DHB_CentStrucArms_HalfLength 1.7465
Constant DHB_CentStrucArmsTabs_HalfHeight 1.397
Constant DHB_CentStrucArmsTabs_HalfLength 0.3745
Constant DHB_DetSidePost_HalfWidth 0.476
Constant DHB_DetSidePost_HalfLength 0.343
Constant DHB_DetSidePost_HalfHeight 4.7435


#######################################################
# IRShield

Constant IRShieldMaterial al6061
#Not sure what IRShieldGapZ is so it has not been updated
Constant IRShieldGapZ 0.7
Constant IRShieldPosZ { -Cryostat_Interior_HalfHeigth + IRShieldGapZ }
Constant IRShieldThickness 0.0702
#Constant IRShieldX  26.09 05/01
Constant IRShieldX  26.63
#Constant IRShieldY  22.382 05/01
Constant IRShieldY  22.9822
#Constant IRShieldZ  14.6 05/01
Constant IRShieldZ  13.072
Constant IRShieldHoleX 8.017
Constant IRShieldHoleZ 0.317
Constant IRShieldSideY_Hole1_Zpos 0.927
Constant IRShieldSideY_Zspace 2.223
Constant IRShieldSideY_Xpos 2.774
Constant IRShieldSideY_Hole2_Zpos 2.619
Constant IRShield_TopTabX 11.965
Constant IRShield_TopTabY 1.041
Constant IRShield_CircHole_Rad 0.7145
Constant IRShield_CircHole_ZPos 0.8545
Constant IRShield_RecHoleX 2.619
Constant IRShield_RecHoleZ 0.159
Constant IRShieldSideX_Xpos 2.514
Constant IRShieldX_CircHole_Zpos 0.0225
Constant IRShieldSideX_TopTabX 0.5205
Constant IRShieldSideX_TopTabY 10.16
Constant IRShieldSideY_TopTabX 5.868
Constant IRShieldSideX_BotTabX 0.977
Constant IRShieldSideY_BotTabX 13.275
Constant IRShieldBot_CentHoleRad 2.064
Constant IRShieldBot_CircsRad 0.7145



#IR Side Shield Tabs on the IR shields along Y. The Y dimension will be the thickness of the IR shield
Constant IRShieldSideX 1.041
Constant IRShieldSideZ 12.596
#######################################################
# The cold finger


Constant ColdfingerDepth        1.6
#Constant ColdfingerSpireHeight 10.1
Constant ColdfingerSpireHeight 9.487
#Constant ColdfingerBaseHeight   3.3
Constant ColdfingerBaseHeight   2.032
Constant ColdfingerLength      20.9 
Constant ColdfingerSpireLength  3.5 

#Constant ColdfingerBasePosZ  { -Cryostat_Interior_HalfHeigth + IRShieldGapZ + IRShieldThickness }
# Constant ColdfingerBasePosZ  { -Cryostat_Interior_HalfHeigth + IRShieldGapZ + IRShieldThickness +1.2}
Constant ColdfingerBasePosZ  { -Cryostat_Interior_HalfHeigth + IRShieldGapZ + IRShieldThickness + 1.0165}


#######################################################
# Radiators

Constant LowerRadiatorHalfDepth    { 0.5 * 0.2 * 2.54 + 0.06 * 2.54 }
Constant LowerRadiatorHalfHeight   { 0.5 * 4.5 * 2.54 }
Constant RadiatorHalfWidth         { 0.5 * 11 * 2.54 }
Constant LowerRadiatorZPos         { DetZPos + 1.5*2.54 }

Constant UpperRadiatorHalfDepth    { 0.5 * 0.06 * 2.54 }
Constant UpperRadiatorHalfHeight   { 0.5 * ( 6.74 - 6.0 ) * 2.54 }
Constant UpperRadiatorZPos         { LowerRadiatorZPos + LowerRadiatorHalfHeight + UpperRadiatorHalfHeight }

Constant TopRadiatorHalfLength   { 0.5 * 6.82 * 2.54 }
Constant TopRadiatorZPos         { LowerRadiatorZPos  + LowerRadiatorHalfHeight + 2*UpperRadiatorHalfHeight + UpperRadiatorHalfDepth }



#######################################################
# FrontEndElectronics

Constant ElectronicsDepth 1.2
Constant ElectronicsHeight 5.5
Constant ElectronicsWidth 2.5  



#######################################################
# ACS

Constant BGOMaterial bgo

# Space fromt Cryostat to inner ACS Walls
Constant CryoToACS 0.76

# ACS inner dimensions defined by what's inside
Constant BGOinnerX { CryostatOuterX + CryoToACS }  
Constant BGOinnerY { CryostatOuterY + CryoToACS }  
Constant BGOinnerZ {allDetZ+2.0+BaseFill}          

# ACS outer dimensions:
Constant BGOouterX { BGOinnerX + 2*BGOsideThick + BGOWallFullThickness + BGOWallFullThicknessOutside }  
Constant BGOouterY { BGOinnerY + 2*BGOsideThick + BGOWallFullThickness + BGOWallFullThicknessOutside }  
#Constant BGOouterY { 2*BGOWallSideThickness + 2*BGOWallFullThickness + 4*BGOsideThick + 2*BGOinnerY }

// Outer BGO shield (HALF thicknesses & half heigths given)

# Active BGO thicknesses
Constant BGObottomThick 1.25
Constant BGOsideThick 1.15
Constant BGOsideHigh {0.5 * 19.73}
Constant BGOXLength {0.5 * 11.176}
Constant BGOYLength {0.5 * 11.858}


# No longer used (was not BGO but plastic)
Constant BGOtopThick  0.0

# ACS holes
Constant BGOBottomRoundHoleRadius 1.0 
Constant BGOBottomDogHouseHoleHalfXY  2.9

# ACS cover thickness 
#Constant BGOWallFullThickness 0.305
Constant BGOWallFullThickness 0.254
Constant BGOWallSideThickness 0.64
Constant BGOWallFullThicknessTop 1.44
Constant BGOWallFullThicknessOutside 1.5
Constant BGOWallFullThicknessBottom 0.4

# PMT information
Constant PMTlength 8.3   
Constant PMTthick  2.80  

# Rename: ShieldedHalfHeight
#Constant ShieldedHeight { 0.5 *(BGOWallFullThicknessTop + 2*BGOsideHigh + BGOWallFullThickness + BGOWallFullThickness + 2*BGObottomThick + BGOWallFullThicknessBottom) }
Constant ShieldedHeight { 1.605+BGOWallFullThickness+BGOsideHigh+CryoBaseZ+0.535 }


# Bottom Shield BGO crystals 
# These are all different sizes which makes this not very fun... sincerely, Alyson
# These are in half lengths
Constant BotBGOWidth1 3.545
Constant BotBGOLength1 8.055
Constant BotBGOWidth2 3.485 
Constant BotBGOLength2 8.055
Constant BotBGOWidth3 2.36
Constant BotBGOLength3 8.35
Constant BotBGOWidth4 4.405
Constant BotBGOLength4 5.87
Constant BotBGOWidth5 3.615 
Constant BotBGOLength5 8.055
Constant BotBGOWidth6 3.545
Constant BotBGOLength6 11.62
Constant BotBGOWidth7 3.485
Constant BotBGOLength7 11.62
Constant BotBGOWidth8 2.84
Constant BotBGOLength8 8.35
Constant BotBGOWidth9 3.925
Constant BotBGOLength9 11.62
Constant BotBGOWidth10 3.615 
Constant BotBGOLength10 11.62

# Thickness of teflon wrapping on crystals on all sides
# This is a full thickness but is easier this way since it is on all sides
Constant CrystalWrapping 0.1

# Hole for Cold strap through bottom shield
Constant ColdStrapHoleLength 2.025

# Hole for the frangibolt
Constant FrangBoltHoleRad 2.62

# Gaps from the BGO to the edge of the housing for the bottom shield
Constant BotBGOtoHouseGapY 3.16 
Constant BotBGOtoHouseGapX 3.06

# Gaps between the crystals
# Full distance
Constant BGOcrystalGap .254
