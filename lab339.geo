//////////////////////
//
//
// Geometry for the table and wall in SSL Addition lab 339
// By: Felix Hagemann
// Date: 01/26/2026
// Email: hagemann@berkeley.edu
//
//
/////////////////////

# Virtual Volume for all parts to live in
Volume Lab339
Lab339.Material Air
Lab339.Virtual true
Lab339.Shape Brik 25.0 25.0 25.0

# Table plate (wood)
Volume Table
Table.Material Wood
Table.Visibility 1
Table.Shape BRIK 38.1  91.44  5.08
Table.Position   0.0   15.24  -22.0
Table.Mother Lab339

# Table feet
Volume TableFoot
TableFoot.Material Aluminium
TableFoot.Visibility 1
TableFoot.Color 15
TableFoot.Shape BRIK 2.54 2.54 38.735
TableFoot.Copy TableFoot1
TableFoot1.Position  33.02  101.6  -65.815
TableFoot1.Mother Lab339
TableFoot.Copy TableFoot2
TableFoot2.Position -33.02  101.6  -65.815
TableFoot2.Mother Lab339
TableFoot.Copy TableFoot3
TableFoot3.Position  33.02 -71.12  -65.815
TableFoot3.Mother Lab339
TableFoot.Copy TableFoot4
TableFoot4.Position -33.02 -71.12  -65.815
TableFoot4.Mother Lab339

Volume TableBarLong
TableBarLong.Material Aluminium
TableBarLong.Visibility 1
TableBarLong.Color 15
TableBarLong.Shape BRIK 2.54 83.82 2.54
TableBarLong.Copy TableBarLong1
TableBarLong1.Position  33.02  15.24 -29.62
TableBarLong1.Mother Lab339
TableBarLong.Copy TableBarLong2
TableBarLong2.Position -33.02  15.24 -29.62
TableBarLong2.Mother Lab339

Volume TableBarShort
TableBarShort.Material Aluminium
TableBarShort.Visibility 1
TableBarShort.Color 15
TableBarShort.Shape BRIK 30.48 2.54 2.54
TableBarShort.Copy TableBarShort1
TableBarShort1.Position  0.0  101.6 -29.62
TableBarShort1.Mother Lab339
TableBarShort.Copy TableBarShort2
TableBarShort2.Position  0.0 -71.12 -29.62
TableBarShort2.Mother Lab339

# Place the room wall
Volume RoomWall
RoomWall.Material Concrete
RoomWall.Visibility 1
RoomWall.Shape BRIK 200.0 7.62 200.0
RoomWall.Position 0.0 228.6  80.21
RoomWall.Mother Lab339

Volume RoomFloor
RoomFloor.Material Concrete
RoomFloor.Visibility 1
RoomFloor.Shape BRIK 200.0 220.98 7.62
RoomFloor.Position 0.0 0.0 -112.17
RoomFloor.Mother Lab339