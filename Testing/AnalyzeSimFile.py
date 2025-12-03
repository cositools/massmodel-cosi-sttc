import ROOT as M

# Load MEGAlib into ROOT
M.gSystem.Load("$(MEGALIB)/lib/libMEGAlib.so")

# Initialize MEGAlib
G = M.MGlobal()
G.Initialize()

# We are good to go ...


GeometryName = "../View.COSISMEX.Ge.geo.setup"
FileName = "COSI.inc1.id1.sim.gz"

# Load geometry:
Geometry = M.MDGeometryQuest()
if Geometry.ScanSetupFile(M.MString(GeometryName)) == True:
  print("Geometry " + GeometryName + " loaded!")
else:
  print("Unable to load geometry " + GeometryName + " - Aborting!")
  quit()
    

Reader = M.MFileEventsSim(Geometry)
if Reader.Open(M.MString(FileName)) == False:
  print("Unable to open file " + FileName + ". Aborting!")
  quit()

while True: 
  Event = Reader.GetNextEvent()
  if not Event:
    break
  M.SetOwnership(Event, True)
  
  if Event.GetNHTs() > 0:
    HT = Event.GetHTAt(0)
    L = HT.GetVolumeSequence().GetPositionInSensitiveVolume()
    print(f"Position in sensitive volume: ({L[0]}, {L[1]}, {L[2]}) cm")

