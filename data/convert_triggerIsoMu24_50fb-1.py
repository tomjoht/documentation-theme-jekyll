import json

import ROOT

tfile = ROOT.TFile("data.root")
ttree = tfile.Get("events")

f = open("triggerIsoMu24_50fb-1.json", "w")

for event in ttree:
    e = {"jets": [], "muons": [], "electrons": [], "photons": []}
    for i in xrange(event.NJet):
        p = {}
        p["px"] = event.Jet_Px[i]
        p["py"] = event.Jet_Py[i]
        p["pz"] = event.Jet_Pz[i]
        p["E"] = event.Jet_E[i]
        p["btag"] = event.Jet_btag[i]
        p["id"] = event.Jet_ID[i]
        e["jets"].append(p)
    for i in xrange(event.NMuon):
        p = {}
        p["px"] = event.Muon_Px[i]
        p["py"] = event.Muon_Py[i]
        p["pz"] = event.Muon_Pz[i]
        p["E"] = event.Muon_E[i]
        p["q"] = event.Muon_Charge[i]
        p["iso"] = event.Muon_Iso[i]
        e["muons"].append(p)
    for i in xrange(event.NElectron):
        p = {}
        p["px"] = event.Electron_Px[i]
        p["py"] = event.Electron_Py[i]
        p["pz"] = event.Electron_Pz[i]
        p["E"] = event.Electron_E[i]
        p["q"] = event.Electron_Charge[i]
        p["iso"] = event.Electron_Iso[i]
        e["electrons"].append(p)
    for i in xrange(event.NPhoton):
        p = {}
        p["px"] = event.Photon_Px[i]
        p["py"] = event.Photon_Py[i]
        p["pz"] = event.Photon_Pz[i]
        p["E"] = event.Photon_E[i]
        p["iso"] = event.Photon_Iso[i]
        e["photons"].append(p)
    e["MET"] = {"px": event.MET_px, "py": event.MET_py}
    e["numPrimaryVertices"] = event.NPrimaryVertices

    f.write(json.dumps(e))
    f.write("\n")

# {"NJet": {"extractor": "TLeaf", "dimensions": [], "type": "int"},
#  "Jet_Px": {"extractor": "TLeaf", "dimensions": [{"counter": "NJet"}], "type": "float"},
#  "Jet_Py": {"extractor": "TLeaf", "dimensions": [{"counter": "NJet"}], "type": "float"},
#  "Jet_Pz": {"extractor": "TLeaf", "dimensions": [{"counter": "NJet"}], "type": "float"},
#  "Jet_E": {"extractor": "TLeaf", "dimensions": [{"counter": "NJet"}], "type": "float"},
#  "Jet_btag": {"extractor": "TLeaf", "dimensions": [{"counter": "NJet"}], "type": "float"},
#  "Jet_ID": {"extractor": "TLeaf", "dimensions": [{"counter": "NJet"}], "type": "bool"},
#  "NMuon": {"extractor": "TLeaf", "dimensions": [], "type": "int"},
#  "Muon_Px": {"extractor": "TLeaf", "dimensions": [{"counter": "NMuon"}], "type": "float"},
#  "Muon_Py": {"extractor": "TLeaf", "dimensions": [{"counter": "NMuon"}], "type": "float"},
#  "Muon_Pz": {"extractor": "TLeaf", "dimensions": [{"counter": "NMuon"}], "type": "float"},
#  "Muon_E": {"extractor": "TLeaf", "dimensions": [{"counter": "NMuon"}], "type": "float"},
#  "Muon_Charge": {"extractor": "TLeaf", "dimensions": [{"counter": "NMuon"}], "type": "int"},
#  "Muon_Iso": {"extractor": "TLeaf", "dimensions": [{"counter": "NMuon"}], "type": "float"},
#  "NElectron": {"extractor": "TLeaf", "dimensions": [], "type": "int"},
#  "Electron_Px": {"extractor": "TLeaf", "dimensions": [{"counter": "NElectron"}], "type": "float"},
#  "Electron_Py": {"extractor": "TLeaf", "dimensions": [{"counter": "NElectron"}], "type": "float"},
#  "Electron_Pz": {"extractor": "TLeaf", "dimensions": [{"counter": "NElectron"}], "type": "float"},
#  "Electron_E": {"extractor": "TLeaf", "dimensions": [{"counter": "NElectron"}], "type": "float"},
#  "Electron_Charge": {"extractor": "TLeaf", "dimensions": [{"counter": "NElectron"}], "type": "int"},
#  "Electron_Iso": {"extractor": "TLeaf", "dimensions": [{"counter": "NElectron"}], "type": "float"},
#  "NPhoton": {"extractor": "TLeaf", "dimensions": [], "type": "int"},
#  "Photon_Px": {"extractor": "TLeaf", "dimensions": [{"counter": "NPhoton"}], "type": "float"},
#  "Photon_Py": {"extractor": "TLeaf", "dimensions": [{"counter": "NPhoton"}], "type": "float"},
#  "Photon_Pz": {"extractor": "TLeaf", "dimensions": [{"counter": "NPhoton"}], "type": "float"},
#  "Photons_E": {"extractor": "TLeaf", "dimensions": [{"counter": "NPhoton"}], "type": "float"},
#  "Photon_Iso": {"extractor": "TLeaf", "dimensions": [{"counter": "NPhoton"}], "type": "float"},
#  "MET_px": {"extractor": "TLeaf", "dimensions": [], "type": "float"},
#  "MET_py": {"extractor": "TLeaf", "dimensions": [], "type": "float"},
#  "NPrimaryVertices": {"extractor": "TLeaf", "dimensions": [], "type": "int"},
