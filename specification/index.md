---
title: Specification
type: default
toc: true
toc.minimumHeaders: 1
summary: |
    <p>This page describes Histogrammar detail, but without reference to any particular implementation. It describes the composable primitives, their required functions and argument lists, and their JSON representations.</p>
    
    <p>This is the normative specification; any implementations that don't adhere to the definitions on this page are wrong and should be corrected.</p>
---

# General features

weighted data

ing vs ed forms

methods shared by all primitives

Algorithms are expressed in Python syntax for concreteness.

# Zeroth kind: ignore data, depend only on weights
    
## **Count:** sum of weights

Count entries by accumulating the sum of all observed weights.

### Counting constructor and required members

```python
Count.ing()
```

  * `entries` (mutable double) is the number of entries.

### Counted constructor and required members

```python
Count.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(counting, datum, weight):
    if (weight > 0.0):
        counting.entries += weight

def merge(one, two):
    return Count.ed(one.entries + two.entries)
```

### JSON format

Simply a JSON number representing the `entries`. This is the only aggregator whose JSON representation is not an object.

**Example:**

```json
{"type": "Count", "data": 123.0}
```

# First kind: aggregate a quantity without sub-aggregators

## **Sum:** sum of a given quantity

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Average:** mean of a quantity

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Deviate:** mean and variance

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **AbsoluteErr:** mean-absolute-error

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Minimize:** minimum value

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Maximize:** maximum value

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Quantile:** such as median, quartiles, quintiles, etc.

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

# Second kind: group data by a quantity and pass to sub-aggregators

## **Bin:** regular binning for histograms

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **SparselyBin:** ignore zeros

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **CentrallyBin:** irregular but fully partitioning

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **AdaptivelyBin:** for unknown distributions

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Categorize:** string-valued bins, bar charts

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Fraction:** efficiency plots

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Stack:** cumulative filling

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Partition:** exclusive filling

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Select:** apply a cut

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

# Third kind: ignore data, pass to all sub-aggregators

## **Limit:** keep detail until entries is large

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Label:** directory with string-based keys

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **UntypedLabel:** directory of different types

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Index:** list with integer keys

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Branch:** tuple of different types

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

# Fourth kind: collect sets of raw data

## **Bag:** accumulate values for scatter plots

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

## **Sample:** accumulate with reservoir sampling

Purpose, short description

### Constructors

### Fill and merge algorithms

### JSON format

### Required methods

# Aliases: common combinations

## Histogram

## SparselyHistogram

