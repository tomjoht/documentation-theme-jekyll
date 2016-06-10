---
title: Installation instructions
type: default
toc: true
custom_css: specification
summary: |
    <p>This page explains how to install Histogrammar or Histogrammar components in different ways. Use only the instructions relevant to your use-case.</p>
---

# Quick-install from a public repository

## Histogrammar-Python from PyPI (pip)

**FIXME:** when Histogrammar reaches v1.0, it will be ready to upload to PyPI.

## Histogrammar-Scala from Maven Central (sbt, Maven, Spark)

**FIXME:** when Histogrammar reaches v1.0, it will be ready to upload to Maven Central.

## Histogrammar-R from CRAN

**FIXME:** Histogrammar-R doesn't exist yet. Change that.

## Histogrammar-Javascript from npm

**FIXME:** Histogrammar-Javascript doesn't exist yet. Change that.

## Histogrammar-C++ from Spack

**FIXME:** when Histogrammar reaches v1.0, it will be ready to upload to [Spack](https://github.com/LLNL/spack) (C++ packaging system).

# Download and compile from GitHub

## Download source code from a fixed release

See Histogrammar's [GitHub release page](http://github.com/diana-hep/histogrammar/releases). Below the status message for each release (which includes a table of implemented primitives) is a zip and a tar.gz.

Fixed releases are stable, but in this early era are likely to be incomplete. The latest release as of this writing (0.6) is missing many of the features described in these tutorials.

## Download or clone source code from the bleeding edge

Here is a [zip file for downloading](https://github.com/diana-hep/histogrammar/archive/master.zip).

To clone the release, use

```sh
git clone https://github.com/diana-hep/histogrammar.git
```

If you are a GitHub user, you can also fork [the repository](http://github.com/diana-hep/histogrammar) to propose pull requests.

## Install Histogrammar-Python from source

### System-wide

Use the standard [Python](https://www.python.org/downloads/) install script:

```sh
cd histogrammar/python
sudo python setup.py install
```

Histogrammar is compatible with both Python 2.7 and Python 3.

### In a user directory

As usual with Python setup scripts, you can install software in your own directory without superuser access,

```sh
python setup.py install --home=~/my_installation_directory
```

but then you have to make sure that `PYTHONPATH` includes `my_installation_directory/lib`.

## Compile Histogrammar-Scala and all dependent projects

Run [Maven](https://maven.apache.org/download.cgi) from the base directory. The parent `pom.xml` will compile the sub-projects in the right order.

```sh
cd histogrammar
mvn install
```

As usual with Maven, the compiled JAR files go into a `target` directory for each project (with dependencies in `target/lib`) and are cached in your `~/.m2/repository`.

## Compile Histogrammar-Scala subprojects manually

If you need to compile and install them separately, here is the dependency order:

  * `scala` is the base package; you must `cd` to this directory and `mvn install` here first.
    * `scala-bokeh` depends on `scala`; you can `cd` to this directory and `mvn install` here after the first installation succeeded.
    * `scala-jit` depends on `scala`; you can `cd` to this directory and `mvn install` here after the first installation succeeded.
    * `scala-sparksql` depends on `scala`; you can `cd` to this directory and `mvn install` here after the first installation succeeded.

Thus, if one of the dependent projects doesn't compile on your system (`scala-jit` requires a C compiler and make tools) and you don't need it, you can compile the others manually.

Subprojects find the base project's JAR in your `~/.m2/repository`.
