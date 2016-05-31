---
title: Specification
type: default
toc: true
toc.minimumHeaders: 1
custom_css: specification
summary: |
    <p>This page describes Histogrammar detail, but without reference to any particular implementation. It describes the composable primitives, their required functions and argument lists, and their JSON representations.</p>
    
    <p>This is the normative specification; any implementations that don't adhere to the definitions on this page are wrong and should be corrected.</p>
---

# General features

weighted data

ing vs ed forms

methods shared by all primitives

named functions

rollback

general strategy for JSON encoding

Algorithms are expressed in Python syntax for concreteness.

# Zeroth kind: depend only on weights
    
## **Count:** sum of weights

Count entries by accumulating the sum of all observed weights.

### Counting constructor and required members

```python
Count.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### Counted constructor and required members

```python
Count.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(counting, datum, weight):
    if weight > 0.0:
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

Accumulate the (weighted) sum of a given quantity, calculated from the data.

### Summing constructor and required members

```python
Sum.ing(quantity)
```

  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `sum` (mutable double) is the running sum, initially 0.0.

### Summed constructor and required members

```
Sum.ed(entries, sum)
```

  * `entries` (double) is the number of entries.
  * `sum` (double) is the sum.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):
    if weight > 0.0:
        q = quantity(datum)
        entries += weight
        sum += q * weight

def merge(one, two):
    return Sum.ed(one.entries + two.entries, one.sum + two.sum)
```

### JSON format

JSON object containing

  * `entries` (JSON number)
  * `sum` (JSON number)
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "Sum",
 "data": {"entries": 123.0, "sum": 3.14, "name": "myfunc"}}
```

## **Average:** mean of a quantity

Accumulate the weighted mean of a given quantity.

Uses the numerically stable weighted mean algorithm described in ["Incremental calculation of weighted mean and variance," Tony Finch, _Univeristy of Cambridge Computing Service,_ 2009.](http://www-uxsup.csx.cam.ac.uk/~fanf2/hermes/doc/antiforgery/stats.pdf)

### Averaging constructor and required members

```python
Average.ing(quantity)
```

  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `mean` (mutable double) is the running mean, initially 0.0. Note that this value contributes to the total mean with weight zero (because `entries` is initially zero), so this arbitrary choice does not bias the final result.

### Averaged constructor and required members

```python
Average.ed(entries, mean)
```

  * `entries` (double) is the number of entries.
  * `mean` (double) is the mean.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):
    if weight > 0.0:
        q = quantity(datum)
        entries += weight
        delta = q - mean
        shift = delta * weight / entries
        mean += shift

def merge(one, two):
    entries = one.entries + two.entries
    if entries == 0.0:
        mean = (one.mean + two.mean) / 2.0
    else:
        mean = (one.entries*one.mean + two.entries*two.mean)/entries
    return Average.ed(entries, mean)
```

### JSON format

JSON object containing

  * `entries` (JSON number)
  * `mean` (JSON number)
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "Average",
 "data": {"entries": 123.0, "mean": 3.14, "name": "myfunc"}}
```

## **Deviate:** mean and variance

Accumulate the weighted mean and weighted variance of a given quantity.

Uses the numerically stable weighted mean and weighted variance algorithms described in ["Incremental calculation of weighted mean and variance," Tony Finch, _Univeristy of Cambridge Computing Service,_ 2009.](http://www-uxsup.csx.cam.ac.uk/~fanf2/hermes/doc/antiforgery/stats.pdf)

### ING constructor and required members

```python
Deviate.ing(quantity)
```

  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `mean` (mutable double) is the running mean, initially 0.0. Note that this value contributes to the total mean with weight zero (because `entries` is initially zero), so this arbitrary choice does not bias the final result.
  * `variance` (mutable double) is the running variance, initially 0.0. Note that this also contributes nothing to the final result.

### ED constructor and required members

```python
Deviate.ed(entries, mean, variance)
```

  * `entries` (double) is the number of entries.
  * `mean` (double) is the mean.
  * `variance` (double) is the variance.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):
    if weight > 0.0:
        q = quantity(datum)
        varianceTimesEntries = variance * entries
        entries += weight
        delta = q - mean
        shift = delta * weight / entries
        mean += shift
        varianceTimesEntries += weight * delta * (q - mean)
        variance = varianceTimesEntries / entries

def merge(one, two):
    entries = one.entries + two.entries
    if entries == 0.0:
        mean = (one.mean + two.mean) / entries
    else:
        mean = (one.entries*one.mean + two.entries*two.mean) / entries
    varianceTimesEntries = one.entries*one.variance + two.entries*two.variance \
                           + one.entries*one.mean**2 + two.entries*two.mean**2 \
                           - 2.0*mean*(one.entries*one.mean + two.entries*two.mean) \
                           + entries*mean**2
    variance = varianceTimesEntries / entries
    return Deviate.ed(entries, mean, variance)
```

**Note:** the `merge` function is not explicitly defined in Tony Finch's paper, but it's derivable from the algebra.

**FIXME:** the last two terms in `varianceTimesEntries` can be simplified. But now that we've added a special case for `mean` when `entries` is zero, which of the factors of `mean` and `(one.entries*one.mean + two.entries*two.mean)` should use the unweighted value?

This is only relevant for `Deviated` objects constructed by hand: `Deviating` objects aggregated in the normal way would _always_ have `mean` and `variance` in their initial state if `entries == 0.0` (because negative weights cannot contribute).

### JSON format

JSON object containing

  * `entries` (JSON number)
  * `mean` (JSON number)
  * `variance` (JSON number)
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "Deviate",
 "data": {"entries": 123.0, "mean": 3.14, "variance": 0.1, "name": "myfunc"}}
```

## **AbsoluteErr:** mean-absolute-error

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Minimize:** minimum value

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Maximize:** maximum value

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Quantile:** such as median, quartiles, quintiles, etc.

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

# Second kind: group data by a quantity and pass to sub-aggregators

## **Bin:** regular binning for histograms

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **SparselyBin:** ignore zeros

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **CentrallyBin:** irregular but fully partitioning

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **AdaptivelyBin:** for unknown distributions

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Categorize:** string-valued bins, bar charts

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Fraction:** efficiency plots

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Stack:** cumulative filling

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Partition:** exclusive filling

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Select:** apply a cut

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

# Third kind: pass to all sub-aggregators

## **Limit:** keep detail until entries is large

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Label:** directory with string-based keys

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **UntypedLabel:** directory of different types

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Index:** list with integer keys

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Branch:** tuple of different types

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

# Fourth kind: collect sets of raw data

## **Bag:** accumulate values for scatter plots

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Sample:** accumulate with reservoir sampling

DESCRIPTION

### ING constructor and required members

```python
.ing()
```

  * `entries` (mutable double) is the number of entries, initially 0.0.

### ED constructor and required members

```python
.ed(entries)
```

  * `entries` (double) is the number of entries.

### Fill and merge algorithms

```python
def fill(ING, datum, weight):

def merge(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

# Aliases: common combinations

## Histogram

## SparselyHistogram

