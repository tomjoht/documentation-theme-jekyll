---
title: Drawing plots in Scala with Bokeh
type: default
toc: false
summary: |
    <p>If you're working with Histogrammar in Scala and want to use <a href="https://github.com/bokeh/bokeh-scala">Bokeh</a> to draw plots, read this page.</p>
---

## Setting up

The examples on this page have been tested with Histogrammar 0.7. Any subsequent version should work. See the [Installation instructions](../install) if you need to install it.

It also uses the [CMS public dataset](scala-cmsdata) as sample data.

## Plotting a Histogram

Following is an example of plotting a simple histogram with `scala-bokeh` in the interactive spark-shell (Spark context and SQL context are available as `sc` and `sqlContext`). Following assumes that `Bokeh` and `histogrammar` jars are included in the classpath:	

```scala
import org.dianahep.histogrammar._
import org.dianahep.histogrammar.bokeh._
```

First, define case classes which would allow casting data to the desired type:

```scala
case class Mu(eta: Double,pt: Double)
case class MuWrapper(Muon: Array[Mu])
```

Next, define JSON schema to read only a subset of rows on demand (more advanced approaches use `Avro` or `Parquet`):
```scala
val jsonSchema = sqlContext.read.json(sc.parallelize(Array("""{"Muon": [{"pt": 93.9306, "eta": -1.02724}]}""")))
```
Now map the input data to your case classes and load it into Spark's Dataset.  Columns are automatically lined up by name, and the types are preserved:

```scala
import sqlContext.implicits._
val dataset = sqlContext.read.format("json").schema(jsonSchema.schema).load("QCD_HT1000to1500_13TeV_2_0.json").as[MuWrapper].cache()
```

In this example, data is first flattened using a `flatMap` transformation and then a set of selection requirements is applied using a `filter` statement:
```scala
val data_rdd = dataset.flatMap(muon => muon.Muon).filter(muon => (muon.eta < 2.4) & (muon.pt > 2.0)).rdd
```

After data extraction and transformation is completed, the histogram is booked and filled:

```scala
val pt_histogram = Histogram(100, 0, 200, {mu: Mu => mu.pt})
val final_histogram = data_rdd.aggregate(pt_histograms)(new Increment, new Combine)
```

Users are strongly encouraged to learn the syntax of `Bokeh` package, especially `Glyph` and `Plot` abstractions. Plotting a one dimensional histogram can be done in two simple lines of code:

```scala
val myfirstplot = final_histogram.bokeh().plot()
save(myfirstplot,"myfirstplot.html")
```

The resulting plot is saved in the HTML format and can be viewed in a browser.

#### Configuring Bokeh Glyph attributes

The above example used default parameters and styles for the histogrammers plotted. A number of the attributes can be configured on the plot, including plot style (line or a marker), marker style, widths and colors. 
Import Bokeh libraries to be able to configured the colors of objects plotted:

```scala
import io.continuum.bokeh._

val mysecondplot = final_histogram.bokeh(glyphType="circle",markerSize=3,fillColor=Color.Blue).plot()
save(mysecondplot,"mysecondplot.html")
```

### Example: superimposing Histogram plots

To superimpose two or more histograms on a single `Bokeh` plot one can simply create and customize glyphs
for each of the histograms, and then use `plot()` method passing all of the glyphs as arguments like: 
```scala
import io.continuum.bokeh._

val data_rdd1 = dataset.flatMap(muon => muon.Muon).filter(muon => (muon.eta < 2.4) & (muon.pt > 2.0)).rdd
val data_rdd2 = dataset.flatMap(muon => muon.Muon).filter(muon => (muon.eta < 0) & (muon.pt > 20.0)).rdd

val pt_histogram1 = Histogram(100, 0, 200, {mu: Mu => mu.pt})
val pt_histogram2 = Histogram(100, 0, 200, {mu: Mu => mu.pt})

val selection1= data_rdd1.aggregate(pt_histograms1)(new Increment, new Combine)
val selection2= data_rdd2.aggregate(pt_histograms2)(new Increment, new Combine)

val G1 = selection1.bokeh()
val G2 = selection2.bokeh(glyphType="circle",markerSize=3,fillColor=Color.Blue)

plot(G1,G2)
save(mythirdplot,"mythirdplot.html")
```

### Specifying a legend

Having a `Glyph` (a type of object returned by the `bokeh()` method) and `Plot` (a type of object returned by the `plot()` method) objects one can easily put a `Legend` onto the plot using built-in Scala Bokeh tools. For instance (given the histograms from the previous example):

```
val G1 = selection1.bokeh()
val G2 = selection2.bokeh(glyphType="circle",markerSize=3,fillColor=Color.Blue)
val legend = List("curve1" -> List(G1),"curve2" -> List(G2))

val plots = plot(G1,G2)
val leg = new Legend().plot(plots).legends(legend)
plots.renderers <<= (leg :: _)
save(plots,"myfourthplot.html")
```

## Stack

### Example: plotting a stack of histograms

```scala
import org.dianahep.histogrammar._
import org.dianahep.histogrammar.bokeh._

//define case classes to read data into Spark Dataset
case class Mu(eta: Double,pt: Double)
case class MuWrapper(Muon: Array[Mu])

import sqlContext.implicits._
//define JSON schema to read a subset of rows
val jsonSchema = sqlContext.read.json(sc.parallelize(Array("""{"Muon": [{"pt": 93.9306, "eta": -1.02724}]}""")))
val dataset = sqlContext.read.format("json").schema(jsonSchema.schema).load("QCD_HT1000to1500_13TeV_2_0.json").as[MuWrapper].cache()

import io.continuum.bokeh._

val data_rdd1 = dataset.flatMap(muon => muon.Muon).filter(muon => (muon.eta < 2.4) & (muon.pt > 2.0)).rdd
val data_rdd2 = dataset.flatMap(muon => muon.Muon).filter(muon => (muon.eta < 0) & (muon.pt > 20.0)).rdd

val pt_histogram1 = Histogram(100, 0, 200, {mu: Mu => mu.pt})
val pt_histogram2 = Histogram(100, 0, 200, {mu: Mu => mu.pt})

val sample1= data_rdd1.aggregate(pt_histograms1)(new Increment, new Combine)
val sample2= data_rdd2.aggregate(pt_histograms2)(new Increment, new Combine)

val s = Stack.build(sample1,sample2)
val mystackplot = s.bokeh().plot()
save(mystackplot,"stackplot.html")
```
