import json
import math
import zlib

# handle with Python 3
try:
    import urllib2
except ImportError:
    import urllib.request as urllib2

# class definitions

class LorentzVector(object):
    @property
    def pt(self):
        return math.sqrt(self.px**2 + self.py**2)
    @property
    def p(self):
        return math.sqrt(self.px**2 + self.py**2 + self.pz**2)
    @property
    def mass(self):
        return math.sqrt(self.E**2 - self.px**2 - self.py**2 - self.pz**2)
    @property
    def eta(self):
        return 0.5*math.log((self.p + self.pz)/(self.p - self.pz))
    @property
    def phi(self): math.atan2(self.py, self.px)
    def __add__(self, other):
        out = LorentzVector()
        out.px = self.px + other.px
        out.py = self.py + other.py
        out.pz = self.pz + other.pz
        out.E = self.E + other.E
        return out
    def __repr__(self):
        return "LorentzVector({}, {}, {}, {})".format(self.px, self.py, self.pz, self.E)

class Jet(LorentzVector):
    def __init__(self, px, py, pz, E, btag):
        self.px = px
        self.py = py
        self.pz = pz
        self.E = E
        self.btag = btag
    def __repr__(self):
        return "Jet({}, {}, {}, {}, {})".format(self.px, self.py, self.pz, self.E, self.btag)
    @staticmethod
    def fromJson(params):
        return Jet(params["px"],
                   params["py"],
                   params["pz"],
                   params["E"],
                   params["btag"])
                   
class Muon(LorentzVector):
    def __init__(self, px, py, pz, E, q, iso):
        self.px = px
        self.py = py
        self.pz = pz
        self.E = E
        self.q = q
        self.iso = iso
    def __repr__(self):
        return "Muon({}, {}, {}, {}, {}, {})".format(self.px, self.py, self.pz, self.E, self.q, self.iso)
    @staticmethod
    def fromJson(params):
        return Muon(params["px"],
                    params["py"],
                    params["pz"],
                    params["E"],
                    params["q"],
                    params["iso"])

class Electron(LorentzVector):
    def __init__(self, px, py, pz, E, q, iso):
        self.px = px
        self.py = py
        self.pz = pz
        self.E = E
        self.q = q
        self.iso = iso
    def __repr__(self):
        return "Electron({}, {}, {}, {}, {}, {})".format(self.px, self.py, self.pz, self.E, self.q, self.iso)
    @staticmethod
    def fromJson(params):
        return Electron(params["px"],
                        params["py"],
                        params["pz"],
                        params["E"],
                        params["q"],
                        params["iso"])

class Photon(LorentzVector):
    def __init__(self, px, py, pz, E, iso):
        self.px = px
        self.py = py
        self.pz = pz
        self.E = E
        self.iso = iso
    def __repr__(self):
        return "Photon({}, {}, {}, {}, {})".format(self.px, self.py, self.pz, self.E, self.iso)
    @staticmethod
    def fromJson(params):
        return Photon(params["px"],
                      params["py"],
                      params["pz"],
                      params["E"],
                      params["iso"])

class MET(object):
    def __init__(self, px, py):
        self.px = px
        self.py = py
    def __repr__(self):
        return "MET({}, {})".format(self.px, self.py)
    @property
    def pt(self):
        return math.sqrt(self.px**2 + self.py**2)
    @staticmethod
    def fromJson(params):
        return MET(params["px"], params["py"])

class Event(object):
    def __init__(self, jets, muons, electrons, photons, met, numPrimaryVertices):
        self.jets = jets
        self.muons = muons
        self.electrons = electrons
        self.photons = photons
        self.met = met
        self.numPrimaryVertices = numPrimaryVertices
    def __repr__(self):
        return "Event({}, {}, {}, {}, {}, {})".format(self.jets, self.muons, self.electrons, self.photons, self.met, self.numPrimaryVertices)
    @staticmethod
    def fromJson(params):
        return Event(list(map(Jet.fromJson, params["jets"])),
                     list(map(Muon.fromJson, params["muons"])),
                     list(map(Electron.fromJson, params["electrons"])),
                     list(map(Photon.fromJson, params["photons"])),
                     MET.fromJson(params["MET"]),
                     params["numPrimaryVertices"])

# event data iterator
def EventIterator(location):
    READ_BLOCK_SIZE = 1024*8
    webreader = urllib2.urlopen(location)
    gzipUnzipper = zlib.decompressobj(16 + zlib.MAX_WBITS)
    remainder = b""
    eventsBatch = []
    while True:
        if len(eventsBatch) == 0:
            compressedData = webreader.read(READ_BLOCK_SIZE)
            data = remainder + gzipUnzipper.decompress(compressedData)
            if len(data) == 0:
                raise StopIteration
            index = data.rfind(b"\n")
            if index >= 0:
                data, remainder = data[:index + 1], data[index + 1:]
            else:
                remainder = b""
            eventsBatch = [Event.fromJson(json.loads(line.decode()))
                               for line in reversed(data.split(b"\n"))
                               if line != b""]
        yield eventsBatch.pop()

events = EventIterator("http://histogrammar.org/docs/data/triggerIsoMu24_50fb-1.json.gz")
