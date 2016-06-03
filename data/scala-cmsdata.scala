import org.dianahep.histogrammar.json._

// class definitions

trait LorentzVector {
  // abstract members; must be defined by subclasses
  def px: Double
  def py: Double
  def pz: Double
  def E: Double

  // methods common to all LorentzVectors
  def pt = Math.sqrt(px*px + py*py)
  def p = Math.sqrt(px*px + py*py + pz*pz)
  def mass = Math.sqrt(E*E - px*px - py*py - pz*pz)
  def eta = 0.5*Math.log((p + pz)/(p - pz))
  def phi = Math.atan2(py, px)

  // addition operator is a method named "+"
  def +(two: LorentzVector) = {
    val one = this
    // create a subclass and an instance in one block
    new LorentzVector {
      def px = one.px + two.px
      def py = one.py + two.py
      def pz = one.pz + two.pz
      def E = one.E + two.E
      override def toString() = s"LorentzVector($px, $py, $pz, $E)"
    }
  }
}

// particle class definitions are now one-liners

case class Jet(px: Double, py: Double, pz: Double, E: Double, btag: Double) extends LorentzVector

case class Muon(px: Double, py: Double, pz: Double, E: Double, q: Int, iso: Double) extends LorentzVector

case class Electron(px: Double, py: Double, pz: Double, E: Double, q: Int, iso: Double) extends LorentzVector

case class Photon(px: Double, py: Double, pz: Double, E: Double, iso: Double) extends LorentzVector

case class MET(px: Double, py: Double) {
  def pt = Math.sqrt(px*px + py*py)
}

case class Event(jets: Seq[Jet], muons: Seq[Muon], electrons: Seq[Electron], photons: Seq[Photon], met: MET, numPrimaryVertices: Long)

// functions for reading from JSON, each packaged up in a namespace
object Jet {
  def fromJson(params: Map[String, JsonNumber]) =
    Jet(params("px").toDouble,
        params("py").toDouble,
        params("pz").toDouble,
        params("E").toDouble,
        params("btag").toDouble)
}
object Muon {
  def fromJson(params: Map[String, JsonNumber]) =
    Muon(params("px").toDouble,
         params("py").toDouble,
         params("pz").toDouble,
         params("E").toDouble,
         params("q").toInt,
         params("iso").toDouble)
}
object Electron {
  def fromJson(params: Map[String, JsonNumber]) =
    Electron(params("px").toDouble,
             params("py").toDouble,
             params("pz").toDouble,
             params("E").toDouble,
             params("q").toInt,
             params("iso").toDouble)
}
object Photon {
  def fromJson(params: Map[String, JsonNumber]) =
    Photon(params("px").toDouble,
           params("py").toDouble,
           params("pz").toDouble,
           params("E").toDouble,
           params("iso").toDouble)
}
object MET {
  def fromJson(params: Map[String, JsonNumber]): MET =
    MET(params("px").toDouble, params("py").toDouble)
}
object Event {
  def fromJson(params: JsonObject) = {
    val JsonArray(jets @ _*) = params("jets")
    val JsonArray(muons @ _*) = params("muons")
    val JsonArray(electrons @ _*) = params("electrons")
    val JsonArray(photons @ _*) = params("photons")
    val met = params("MET").asInstanceOf[JsonObject]
    val JsonInt(numPrimaryVertices) = params("numPrimaryVertices")
    Event(
      jets collect {case j: JsonObject => Jet.fromJson(j.to[JsonNumber].toMap)},
      muons collect {case j: JsonObject => Muon.fromJson(j.to[JsonNumber].toMap)},
      electrons collect {case j: JsonObject => Electron.fromJson(j.to[JsonNumber].toMap)},
      photons collect {case j: JsonObject => Photon.fromJson(j.to[JsonNumber].toMap)},
      MET.fromJson(met.to[JsonNumber].toMap),
      numPrimaryVertices)
  }
}

// event data iterator
case class EventIterator(location: String) extends Iterator[Event] {
  // use Java libraries to stream and decompress data on-the-fly
  val scanner = new java.util.Scanner(
    new java.util.zip.GZIPInputStream(
      new java.net.URL(location).openStream))

  // read one ahead so that hasNext can effectively "peek"
  private def getNext() = Json.parse(scanner.nextLine) collect {
    case event: JsonObject => Event.fromJson(event)
  }
  private var theNext = getNext()

  // iterator interface
  def hasNext = !theNext.isEmpty
  def next() = {
    val out = theNext.get
    theNext = getNext()
    out
  }
}

val events = EventIterator("http://histogrammar.org/docs/data/triggerIsoMu24_50fb-1.json.gz")
