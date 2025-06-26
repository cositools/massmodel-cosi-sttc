//////////////////////
//
//
// Geometry for the cold finger L bracket in the STTC
// By: Alyson Joens
// Date: 10/19/22
// Email: ajoens@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume LBracket
LBracket.Material Vacuum
LBracket.Virtual true
LBracket.Shape Brik 15.0 15.0 15.0

# The longer side of the L bracket
Volume LBracketLong
LBracketLong.Material Aluminium
LBracketLong.Shape BRIK 8.763 0.216 1.905
LBracketLong.Position 0.0 5.4615 0.0
LBracketLong.Mother LBracket
LBracketLong.Color 6
LBracketLong.Visibility 1

# The additional random block of material at 
# the junction between the long and short side of the L Bracket
#Volume LBracBloc
#LBracBloc.Material Aluminium
#LBracBloc.Shape BRIK 0.673 0.399 1.905
#LBracBloc.Position 6.261 4.8465 0.0
#LBracBloc.Mother LBracket
#LBracBloc.Color 6
#LBracBloc.Visibility 1

# The shorter side of the L bracket
# This will be the base of the L bracket which will require a boolean shape
Shape BRIK LBracketBaseBlock
LBracketBaseBlock.Parameters 0.9145 5.2455 1.905
Shape BRIK LBracSquareWin
LBracSquareWin.Parameters 0.9147 1.956 0.928
Orientation LBracSquareWinOri
LBracSquareWinOri.Position 0.0 0.0 -0.978

Shape Subtraction LBracBaseBlocMinusLBracSquareWin
LBracBaseBlocMinusLBracSquareWin.Parameters LBracketBaseBlock LBracSquareWin LBracSquareWinOri

# Create the semi-circle hole in the L Bracket base
Shape TUBS LBracCircWin
LBracCircWin.Parameters 0.0 0.832 0.9147 0.0 360.0
Orientation LBracCircWinOri
LBracCircWinOri.Position 0.0 0.0 0.049
LBracCircWinOri.Rotation 0.0 90.0 0.0

Shape Subtraction LBracBaseBlocPlusLBracCircWin
LBracBaseBlocPlusLBracCircWin.Parameters LBracBaseBlocMinusLBracSquareWin LBracCircWin LBracCircWinOri

# Place the L Bracket Base
Volume LBracketBase
LBracketBase.Material Aluminium
LBracketBase.Shape LBracBaseBlocPlusLBracCircWin
LBracketBase.Color 6
LBracketBase.Mother LBracket
LBracketBase.Position 7.8485 0.0 0.0
LBracketBase.Visibility 1
