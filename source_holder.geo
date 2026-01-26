//////////////////////
//
//
// Geometry for the cold finger clamp
// By: Felix Hageman
// Date: 01/26/2026
// Email: hagemann@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume SourceHolderVolume
SourceHolderVolume.Material Vacuum
SourceHolderVolume.Virtual true
SourceHolderVolume.Shape Brik 5.0 5.0 5.0

# Making the main mass of the source capsule
Shape TUBS SourceCapsuleShape
SourceCapsuleShape.Parameters 0.0 1.2 0.5 0.0 360.0


# Place the Source Capsule
Volume SourceCapsule
SourceCapsule.Material Plastic_Isolation
SourceCapsule.Shape SourceCapsuleShape
SourceCapsule.Color 2
SourceCapsule.Mother SourceHolderVolume
SourceCapsule.Position 0.0 0.0 0.0
SourceCapsule.Rotation 90.0 0.0 0.0
SourceCapsule.Visibility 1

# Making the main mass of the source holder
Shape TUBS SourceHolderShape
SourceHolderShape.Parameters 1.35 1.85 0.5 0.0 360.0

# Place the Source Holder
Volume SourceHolder
SourceHolder.Material Alu6061
SourceHolder.Shape SourceHolderShape
SourceHolder.Color 15
SourceHolder.Mother SourceHolderVolume
SourceHolder.Position 0.0 0.0 0.0
SourceHolder.Rotation 90.0 0.0 0.0
SourceHolder.Visibility 1


# Making the main mass of the source holder
Shape TUBS SourceRodShape
SourceRodShape.Parameters 0 0.25 3.3 0.0 360.0

# Place the Source Holder
Volume SourceRod
SourceRod.Material Alu6061
SourceRod.Shape SourceRodShape
SourceRod.Color 15
SourceRod.Mother SourceHolderVolume
SourceRod.Position 0.0 0.0 -5.15
SourceRod.Visibility 1






