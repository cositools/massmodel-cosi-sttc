//////////////////////
//
//
// Geometry for the right Radiation shield
// By: Alyson Joens
// Date: 10/31/22
// Email: ajoens@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume IRShieldRight
IRShieldRight.Material Vacuum
IRShieldRight.Virtual true
IRShieldRight.Shape Brik 25.0 25.0 5.0


# Making the main wall of the IR Shield
# Determining the IR shield wall size is a bit finicky so if something is off, look here
Shape BRIK IRWallR
#IRWallR.Parameters 10.25 0.051 5.932
IRWallR.Parameters 10.25 0.051 5.918
Shape BRIK IRSideWallR
IRSideWallR.Parameters 0.051 0.344 5.715
Orientation IRSideWallROri
IRSideWallROri.Position -10.301 0.344 .203

Shape UNION IRWallRPlusSideWallR
IRWallRPlusSideWallR.Parameters IRWallR IRSideWallR IRSideWallROri

Shape BRIK IRSideWallR2
IRSideWallR2.Parameters 10.16 0.9157 0.051
Orientation IRSideWallR2Ori
IRSideWallR2Ori.Position 0.09 0.9157 -5.969
#IRSideWallR2Ori.Position 0.09 0.9157 5.983

Shape UNION IRWallPlusSideWallR2
IRWallPlusSideWallR2.Parameters IRWallRPlusSideWallR IRSideWallR2 IRSideWallR2Ori

# Make hole in the sidewall 2
Shape BRIK IRSideWallHoleR
#The y parameter should really be .5715 but padding it to make sure it is all subtracted
IRSideWallHoleR.Parameters 5.0165 0.58 0.1
Orientation IRSideWallHoleROri
IRSideWallHoleROri.Position 2.958 1.2599 -5.969
#IRSideWallHoleROri.Position 2.958 1.2599 5.983

Shape SUBTRACTION IRSideWallMinusHoleR
IRSideWallMinusHoleR.Parameters IRWallPlusSideWallR2 IRSideWallHoleR IRSideWallHoleROri

# Place the Shell Front Support
Volume IRRight
IRRight.Material Alu6061
IRRight.Shape IRSideWallMinusHoleR
IRRight.Color 8
IRRight.Mother IRShieldRight
IRRight.Position 0.0 0.0 0.0
IRRight.Visibility 0

