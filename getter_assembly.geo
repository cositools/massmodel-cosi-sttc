//////////////////////
//
//
// Geometry for the getter assembly
// By: Alyson Joens
// Date: 10/31/22
// Email: ajoens@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume GetterAssem
GetterAssem.Material Vacuum
GetterAssem.Virtual true
GetterAssem.Shape Brik 25.0 25.0 5.0


# Making the overall mass of the getter assembly and one of the indents
Shape BRIK GetterBlock
GetterBlock.Parameters 7.3025 1.905 0.527
Shape BRIK GetterBlockIndent1
GetterBlockIndent1.Parameters 3.46075 1.651 0.5
Orientation GetterBlockIndent1Ori
GetterBlockIndent1Ori.Position -3.58775 0.0 0.05075

Shape SUBTRACTION GetterBlockMinusIndent
GetterBlockMinusIndent.Parameters GetterBlock GetterBlockIndent1 GetterBlockIndent1Ori

# Make the second Indent
Shape BRIK GetterBlockIndent2
GetterBlockIndent2.Parameters 3.46075 1.651 0.5
Orientation GetterBlockIndent2Ori
GetterBlockIndent2Ori.Position 3.58775 0.0 0.05075

Shape SUBTRACTION GetterBlockMinusIndent2
GetterBlockMinusIndent2.Parameters GetterBlockMinusIndent GetterBlockIndent2 GetterBlockIndent2Ori

# Now add the tabs at the ends that allow for the getter assembly to screw into whatever
Shape BRIK FastenerTab1
FastenerTab1.Parameters 0.4765 0.4765 0.159
Orientation FastenerTab1Ori
FastenerTab1Ori.Position -7.779 0.0 -0.368

Shape UNION GetterPlusFastenerTab
GetterPlusFastenerTab.Parameters GetterBlockMinusIndent2 FastenerTab1 FastenerTab1Ori

Shape BRIK FastenerTab2
FastenerTab2.Parameters 0.4765 0.4765 0.159
Orientation FastenerTab2Ori
FastenerTab2Ori.Position 7.779 0.0 -0.368

Shape UNION GetterPlusFastenerTab2
GetterPlusFastenerTab2.Parameters GetterPlusFastenerTab FastenerTab2 FastenerTab2Ori



# Place the Shell Front Support
Volume Getter
Getter.Material Alu6061
Getter.Shape GetterPlusFastenerTab2
Getter.Color 11
Getter.Mother GetterAssem
Getter.Position 0.0 0.0 0.0
Getter.Visibility 1

