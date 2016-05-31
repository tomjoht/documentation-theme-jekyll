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

Simply a JSON number (or JSON string "nan", "inf", "-inf" for non-finite values) representing the `entries`. This is the only aggregator whose JSON representation is not an object.

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
def fill(summing, datum, weight):
    if weight > 0.0:
        q = summing.quantity(datum)
        summing.entries += weight
        summing.sum += q * weight

def merge(one, two):
    return Sum.ed(one.entries + two.entries, one.sum + two.sum)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `sum` (JSON number, "nan", "inf", or "-inf")
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
def fill(averaging, datum, weight):
    if weight > 0.0:
        q = averaging.quantity(datum)
        averaging.entries += weight
        delta = q - averaging.mean
        shift = delta * weight / averaging.entries
        averaging.mean += shift

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

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `mean` (JSON number, "nan", "inf", or "-inf")
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "Average",
 "data": {"entries": 123.0, "mean": 3.14, "name": "myfunc"}}
```

## **Deviate:** mean and variance

Accumulate the weighted mean and weighted variance of a given quantity.

The variance is computed around the mean, not zero.

Uses the numerically stable weighted mean and weighted variance algorithms described in ["Incremental calculation of weighted mean and variance," Tony Finch, _Univeristy of Cambridge Computing Service,_ 2009.](http://www-uxsup.csx.cam.ac.uk/~fanf2/hermes/doc/antiforgery/stats.pdf)

### Deviating constructor and required members

```python
Deviate.ing(quantity)
```

  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `mean` (mutable double) is the running mean, initially 0.0. Note that this value contributes to the total mean with weight zero (because `entries` is initially zero), so this arbitrary choice does not bias the final result.
  * `variance` (mutable double) is the running variance, initially 0.0. Note that this also contributes nothing to the final result.

### Deviated constructor and required members

```python
Deviate.ed(entries, mean, variance)
```

  * `entries` (double) is the number of entries.
  * `mean` (double) is the mean.
  * `variance` (double) is the variance.

### Fill and merge algorithms

```python
def fill(deviating, datum, weight):
    if weight > 0.0:
        q = deviating.quantity(datum)
        varianceTimesEntries = deviating.variance * deviating.entries
        deviating.entries += weight
        delta = q - deviating.mean
        shift = delta * weight / deviating.entries
        deviating.mean += shift
        varianceTimesEntries += weight * delta * (q - deviating.mean)
        deviating.variance = varianceTimesEntries / deviating.entries

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

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `mean` (JSON number, "nan", "inf", or "-inf")
  * `variance` (JSON number, "nan", "inf", or "-inf")
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "Deviate",
 "data": {"entries": 123.0, "mean": 3.14, "variance": 0.1, "name": "myfunc"}}
```

## **AbsoluteErr:** mean-absolute-error

Accumulate the weighted mean absolute error (MAE) of a quantity around zero.

The MAE is sometimes used as a replacement for the standard deviation, associated with medians, rather than means. However, this aggregator makes no attempt to estimate a median. If used as an "error," it should be used on a quantity whose nominal value is zero, such as a residual.

### AbsoluteErring constructor and required members

```python
AbsoluteErr.ing(quantity)
```

  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `mae` (mutable double) is the mean absolute error.

### AbsoluteErred constructor and required members

```python
AbsoluteErr.ed(entries, mae)
```

  * `entries` (double) is the number of entries.
  * `mae` (double) is the mean absolute error.

### Fill and merge algorithms

```python
def fill(absoluteerring, datum, weight):
    if weight > 0.0:
        q = absoluteerring.quantity(datum)
        absoluteerring.entries += weight
        absoluteerring.absoluteSum += weight * abs(q)

def merge(one, two):
    entries = one.entries + two.entries
    mae = one.entries*one.mae + two.entries*two.mae
    return AbsoluteErr.ed(entries, mae)
```

**FIXME:** I have no theoretical reason to believe that a weighted mean is the right way to combine mean absolute errors.

### JSON format

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `mae` (JSON number, "nan", "inf", or "-inf")
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "AbsoluteErr",
 "data": {"entries": 123.0, "mae": 3.14, "name": "myfunc"}}
```

## **Minimize:** minimum value

Find the minimum value of a given quantity. If no data are observed, the result is NaN.

Unlike [quantile](#quantile-such-as-median-quartiles-quintiles-etc) with a target of 0, Minimize is exact.

### Minimizing constructor and required members

```python
Minimize.ing(quantity)
```

  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `min` (mutable double) is the lowest value of the quantity observed, initially NaN.

### Minimized constructor and required members

```python
Minimize.ed(entries, min)
```

  * `entries` (double) is the number of entries.
  * `min` (double) is the lowest value of the quantity observed or NaN if no data are observed.

### Fill and merge algorithms

```python
def fill(minimizing, datum, weight):
    if weight > 0.0:
        q = quantity(datum)
        entries += weight
        if math.isnan(minimizing.min) or q < minimizing.min:
            minimizing.min = q

def merge(one, two):
    entries = one.entries + two.entries
    if math.isnan(one.min):
        min = two.min
    elif math.isnan(two.min):
        min = one.min
    elif one.min < two.min:
        min = one.min
    else:
        min = two.min
    return Minimize.ed(entries, min)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `min` (JSON number, "nan", "inf", or "-inf")
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "Minimize",
 "data": {"entries": 123.0, "min": 3.14, "name": "myfunc"}}
```

## **Maximize:** maximum value

Find the maximum value of a given quantity. If no data are observed, the result is NaN.

Unlike [quantile](#quantile-such-as-median-quartiles-quintiles-etc) with a target of 1, Maximize is exact.

### Maximizing constructor and required members

```python
Maximize.ing(quantity)
```

  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `max` (mutable double) is the highest value of the quantity observed, initially NaN.

### Maximized constructor and required members

```python
Maximize.ed(entries, min)
```

  * `entries` (double) is the number of entries.
  * `max` (double) is the highest value of the quantity observed or NaN if no data are observed.

### Fill and merge algorithms

```python
def fill(maximizing, datum, weight):
    if weight > 0.0:
        q = quantity(datum)
        entries += weight
        if math.isnan(maximizing.max) or q > maximizing.max:
            maximizing.max = q

def merge(one, two):
    entries = one.entries + two.entries
    if math.isnan(one.max):
        max = two.max
    elif math.isnan(two.max):
        max = one.max
    elif one.max > two.max:
        max = one.max
    else:
        max = two.max
    return Maximize.ed(entries, max)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `max` (JSON number, "nan", "inf", or "-inf")
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "Maximize",
 "data": {"entries": 123.0, "max": 3.14, "name": "myfunc"}}
```

## **Quantile:** such as median, quartiles, quintiles, etc.

Estimate a quantile, such as 0.5 for median, (0.25, 0.75) for quartiles, or (0.2, 0.4, 0.6, 0.8) for quintiles, etc.

**Note:** this is an inexact heuristic! In general, it is not possible to derive an exact quantile in a single pass over a dataset (without accumulating a large fraction of the dataset in memory). To interpret this statistic, refer to the fill and merge algorithms below.

This statistic has the best accuracy for quantiles near the middle of the distribution, such as the median (0.5), and the worst accuracy for quantiles near the edges, such as the first or last percentile (0.01 or 0.99). Use the specialized aggregators for the [minimum](#minimize-minimum-value) (0.0) or [maximum](#maximize-maximum-value) (1.0) of a distribution, since those aggregators are exact.

Another alternative is to use [AdaptivelyBin](#adaptivelybin-for-unknown-distributions) to histogram the distribution and then estimate quantiles from the histogram bins.

### Quantiling constructor and required members

```python
Quantile.ing(target, quantity)
```

  * `target` (double) is a value between 0.0 and 1.0 (inclusive), indicating the quantile to approximate.
  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `estimate` (mutable double) is the best estimate of where `target` of the distribution is below this value and `1.0 - target` of the distribution is above. Initially, this value is NaN.
  * `cumulativeDeviation` (mutable double) is the sum of absolute error between observed values and the current `estimate` (which moves). Initially, this value is 0.0.

### Quantiled constructor and required members

```python
Quantile.ed(entries, target, estimate)
```

  * `entries` (double) is the number of entries.
  * `target` (double) is the value between 0.0 and 1.0 (inclusive), indicating the quantile approximated.
  * `estimate` (double) is the best estimate of where `target` of the distribution is below this value and `1.0 - target` of the distribution is above.

### Fill and merge algorithms

```python
def fill(quantiling, datum, weight):
    if weight > 0.0:
        q = quantiling.quantity(datum)
        quantiling.entries += weight
        if math.isnan(quantiling.estimate):
            quantiling.estimate = q
        else:
            quantiling.cumulativeDeviation += abs(q - quantiling.estimate)
            learningRate = 1.5*quantiling.cumulativeDeviation/quantiling.entries**2
            quantiling.estimate = weight * learningRate * \
                (cmp(q, quantiling.estimate) + 2.0*quantiling.target - 1.0)

def merge(one, two):
    entries = one.entries + two.entries
    if math.isnan(one.estimate) and math.isnan(two.estimate):
        estimate = float("nan")
    elif math.isnan(one.estimate):
        estimate = two.estimate
    elif math.isnan(two.estimate):
        estimate = one.estimate
    elif entries == 0.0:
        estimate = (one.estimate + two.estimate) / 2.0
    else:
        estimate = (one.entries*one.estimate + two.entries*two.estimate) / entries
    return Quantile.ed(entries, one.target, estimate)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `target` (JSON number, "nan", "inf", or "-inf")
  * `estimate` (JSON number, "nan", "inf", or "-inf")
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "Qantile",
 "data": {"entries": 123.0, "target": 0.5, "estimate": 3.14, "name": "myfunc"}}
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

