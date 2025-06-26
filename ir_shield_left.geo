//////////////////////
//
//
// Geometry for the left Radiation shield
// By: Alyson Joens
// Date: 10/31/22
// Email: ajoens@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume IRShieldLeft
IRShieldLeft.Material Vacuum
IRShieldLeft.Virtual true
IRShieldLeft.Shape Brik 25.0 25.0 5.0


# Making the main wall of the IR Shield
# Determining the IR shield wall size is a bit finicky so if something is off, look here
Shape BRIK IRWall
IRWall.Parameters 10.2605 0.051 5.9195
Shape BRIK IRSideWall
IRSideWall.Parameters 0.051 0.6885 5.9055
Orientation IRSideWallOri
IRSideWallOri.Position -10.3115 0.6885 0.05

Shape UNION IRWallPlusSideWall
IRWallPlusSideWall.Parameters IRWall IRSideWall IRSideWallOri

Shape BRIK IRSideWall2
IRSideWall2.Parameters 10.16 1.2965 0.051
Orientation IRSideWall2Ori
#IRSideWall2Ori.Position 0.1005 1.2965 -5.9705
IRSideWall2Ori.Position 0.1005 1.2965 5.9705

Shape UNION IRWallPlusSideWall2
IRWallPlusSideWall2.Parameters IRWallPlusSideWall IRSideWall2 IRSideWall2Ori

# Make hole in the sidewall 2
Shape BRIK IRSideWallHole
IRSideWallHole.Parameters 4.1275 1.143 0.1
Orientation IRSideWallHoleOri
#IRSideWallHoleOri.Position 2.958 1.45 -5.9705
IRSideWallHoleOri.Position 2.958 1.45 5.9705

Shape SUBTRACTION IRSideWallMinusHole
IRSideWallMinusHole.Parameters IRWallPlusSideWall2 IRSideWallHole IRSideWallHoleOri

# Place the Shell Front Support
Volume IRLeft
IRLeft.Material Alu6061
IRLeft.Shape IRSideWallMinusHole
IRLeft.Color 9
IRLeft.Mother IRShieldLeft
IRLeft.Position 0.0 0.0 0.0
IRLeft.Visibility 1 

