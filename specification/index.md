---
title: Specification
type: default
toc: true
toc.minimumHeaders: 1
custom_css: specification
summary: |
    <p>This page describes Histogrammar in detail, but without reference to any particular implementation, including the composable primitives, their required functions and argument lists, and their JSON representations.</p>
    
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

### Fill and add algorithms

```python
def fill(counting, datum, weight):
    if weight > 0.0:
        counting.entries += weight

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(summing, datum, weight):
    if weight > 0.0:
        q = summing.quantity(datum)
        summing.entries += weight
        summing.sum += q * weight

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(averaging, datum, weight):
    if weight > 0.0:
        q = averaging.quantity(datum)
        averaging.entries += weight
        delta = q - averaging.mean
        shift = delta * weight / averaging.entries
        averaging.mean += shift

def __add__(one, two):
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

### Fill and add algorithms

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

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(absoluteerring, datum, weight):
    if weight > 0.0:
        q = absoluteerring.quantity(datum)
        absoluteerring.entries += weight
        absoluteerring.absoluteSum += weight * abs(q)

def __add__(one, two):
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
  * `min` (double) is the lowest value of the quantity observed or NaN if no data were observed.

### Fill and add algorithms

```python
def fill(minimizing, datum, weight):
    if weight > 0.0:
        q = quantity(datum)
        entries += weight
        if math.isnan(minimizing.min) or q < minimizing.min:
            minimizing.min = q

def __add__(one, two):
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
  * `max` (double) is the highest value of the quantity observed or NaN if no data were observed.

### Fill and add algorithms

```python
def fill(maximizing, datum, weight):
    if weight > 0.0:
        q = quantity(datum)
        entries += weight
        if math.isnan(maximizing.max) or q > maximizing.max:
            maximizing.max = q

def __add__(one, two):
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

The quantile aggregator dynamically minimizes the mean absolute error between the current estimate and the target quantile, with a learning rate that depends on the cumulative deviations. The algorithm is deterministic: the same data always yields the same final estimate.

This statistic has the best accuracy for quantiles near the middle of the distribution, such as the median (0.5), and the worst accuracy for quantiles near the edges, such as the first or last percentile (0.01 or 0.99). Use the specialized aggregators for the [minimum](#minimize-minimum-value) (0.0) or [maximum](#maximize-maximum-value) (1.0) of a distribution, since those aggregators are exact.

Another alternative is to use [AdaptivelyBin](#adaptivelybin-for-unknown-distributions) to histogram the distribution and then estimate quantiles from the histogram bins. AdaptivelyBin with `tailDetail == 1.0` maximizes detail on the tails of the distribution (Yael Ben-Haim and Elad Tom-Tov's original algorithm), providing the best estimates of extreme quantiles like 0.01 and 0.99.

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

### Fill and add algorithms

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

def __add__(one, two):
    if one.target != two.target:
        raise Exception
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

**FIXME:** I have no theoretical reason to believe that a weighted mean is the right way to combine these estimates.

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `target` (JSON number)
  * `estimate` (JSON number, "nan", "inf", or "-inf")
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Example:**

```json
{"type": "Qantile",
 "data": {"entries": 123.0, "target": 0.5, "estimate": 3.14, "name": "myfunc"}}
```

# Second kind: group data by a quantity and pass to sub-aggregators

## **Bin:** regular binning for histograms

Split a quantity into equally spaced bins between a low and high threshold and fill exactly one bin per datum.

When combined with [Count](#count-sum-of-weights), this produces a standard histogram. Two nested Bin aggregators produces a two-dimensional histogram, etc.

### Binning constructor and required members

```python
Bin.ing(num, low, high, quantity, value=Count.ing(), underflow=Count.ing(), overflow=Count.ing(), nanflow=Count.ing())
```

  * `num` (32-bit integer) is the number of bins; must be at least one.
  * `low` (double) is the minimum-value edge of the first bin.
  * `high` (double) is the maximum-value edge of the last bin; must be strictly greater than `low`.
  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `value` (present-tense aggregator) generates sub-aggregators to put in each bin.
  * `underflow` (present-tense aggregator) is a sub-aggregator to use for data whose quantity is less than `low`.
  * `overflow` (present-tense aggregator) is a sub-aggregator to use for data whose quantity is greater than or equal to `high`.
  * `nanflow` (present-tense aggregator) is a sub-aggregator to use for data whose quantity is NaN.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `values` (list of present-tense aggregators) are the sub-aggregators in each bin.

### Binned constructor and required members

```python
Bin.ed(low, high, entries, values, underflow, overflow, nanflow)
```

  * `low` (double) is the minimum-value edge of the first bin.
  * `high` (double) is the maximum-value edge of the last bin; must be strictly greater than `low`.
  * `entries` (double) is the number of entries.
  * `values` (list of past-tense aggregators) is the filled sub-aggregators, one for each bin.
  * `underflow` (past-tense aggregator) is the filled underflow bin.
  * `overflow` (past-tense aggregator) is the filled overflow bin.
  * `nanflow` (past-tense aggregator) is the filled nanflow bin.

### Fill and add algorithms

```python
def fill(binning, datum, weight):
    if weight > 0.0:
        q = binning.quantity(datum)
        if math.isnan(q):
            binning.nanflow.fill(datum, weight)
        elif q < binning.low:
            binning.underflow.fill(datum, weight)
        elif q >= binning.high:
            binning.overflow.fill(datum, weight)
        else:
            bin = int(math.floor(binning.num * \
                (q - binning.low) / (binning.high - binning.low)))
            binning.values[bin].fill(datum, weight)
        binning.entries += weight

def __add__(one, two):
    if one.num != two.num or one.low != two.low or one.high != two.high:
        raise Exception
    return Bin.ed(one.low, one.high, \
                  one.entries + two.entries, \
                  [x + y for x, y in zip(one.values, two.values)], \
                  one.underflow + two.underflow, \
                  one.overflow + two.overflow, \
                  one.nanflow + two.nanflow)
```

### JSON format

JSON object containing

  * `low` (JSON number)
  * `high` (JSON number)
  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `values:type` (JSON string), name of the values sub-aggregator type
  * `values` (JSON array of sub-aggregators)
  * `underflow:type` (JSON string), name of the underflow sub-aggregator type
  * `underflow` sub-aggregator
  * `overflow:type` (JSON string), name of the overflow sub-aggregator type
  * `overflow` sub-aggregator
  * `nanflow:type` (JSON string), name of the nanflow sub-aggregator type
  * `nanflow` sub-aggregator
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `values:name` (JSON string), name of the `quantity` function used by each value. If specified here, it is _not_ specified in all the values, thereby streamlining the JSON.

**Examples:**

Here is a five bin histogram, whose bin centers are at -4, -2, 0, 2, and 4. It counts the number of measurements made at each position.

```json
{"type": "Bin",
 "data": {
   "low": -5.0,
   "high": 5.0,
   "entries": 123.0,
   "name": "position [cm]",
   "values:type": "Count",
   "values": [23.0, 20.0, 20.0, 30.0, 30.0],
   "underflow:type": "Count",
   "underflow": 5.0,
   "overflow:type": "Count",
   "overflow": 8.0,
   "nanflow:type": "Count",
   "nanflow": 0.0}}
```

Here is another five bin histogram on the same domain, this one quantifying an average value in each bin. The quantity measured by the average has a name (`"average time [s]"`), which would have been a `"name"` field in the JSON objects representing the averages if it had not been specified once in `"values:name"`.

```json
{"type": "Bin",
 "data": {
   "low": -5.0,
   "high": 5.0,
   "entries": 123.0,
   "name": "position [cm]",
   "values:type": "Average",
   "values:name": "average time [s]",
   "values": [
     {"entries": 23.0, "mean": 4.25},
     {"entries": 20.0, "mean": 16.21},
     {"entries": 20.0, "mean": 20.28},
     {"entries": 30.0, "mean": 16.19},
     {"entries": 30.0, "mean": 4.23}],
   "underflow:type": "Count",
   "underflow": 5.0,
   "overflow:type": "Count",
   "overflow": 8.0,
   "nanflow:type": "Count",
   "nanflow": 0.0}}
```

## **SparselyBin:** ignore zeros

Split a quantity into equally spaced bins, creating them whenever their `entries` would be non-zero. Exactly one sub-aggregator is filled per datum.

Use this when you have a distribution of known scale (bin width) but unknown domain (lowest and highest bin index).

Unlike fixed-domain binning, this aggregator has the potential to use unlimited memory. A large number of _distinct_ outliers can generate many unwanted bins.

Like fixed-domain binning, the bins are indexed by integers, though they are 64-bit and may be negative.

### SparselyBinning constructor and required members

```python
SparselyBin.ing(binWidth, quantity, value=Count.ing(), nanflow=Count.ing(), origin=0.0)
```

  * `binWidth` (double) is the width of a bin; must be strictly greater than zero.
  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `value` (present-tense aggregator) generates sub-aggregators to put in each bin.
  * `nanflow` (present-tense aggregator) is a sub-aggregator to use for data whose quantity is NaN.
  * `origin` (double) is the left edge of the bin whose index is 0.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `bins` (mutable map from 64-bit integer to present-tense aggregator) is the map, probably a hashmap, to fill with values when their `entries` become non-zero.

### SparselyBinned constructor and required members

```python
SparselyBin.ed(binWidth, entries, contentType, bins, nanflow, origin)
```

  * `binWidth` (double) is the width of a bin.
  * `entries` (double) is the number of entries.
  * `contentType` (string) is the value's sub-aggregator type (must be provided to determine type for the case when `bins` is empty).
  * `bins` (map from 64-bit integer to past-tense aggregator), the non-zero bin indexes and their values.
  * `nanflow` (past-tense aggregator) is the filled nanflow bin.
  * `origin` (double) is the left edge of the bin whose index is zero.

### Fill and add algorithms

```python
def fill(sparselybinning, datum, weight):
    if weight > 0.0:
        q = sparselybinning.quantity(datum)
        if math.isnan(q):
            sparselybinning.nanflow.fill(datum, weight)
        else:
            bin = long(math.floor(binning.num * \
                (q - binning.low) / (binning.high - binning.low)))
            if bin in binning.bins:
                binning.bins[bin] = binning.value.copy()
            binning.bins[bin].fill(datum, weight)
            binning.entries += weight

def __add__(one, two):
    if one.binWidth != two.binWidth or one.origin != two.origin:
        raise Exception
    entries = one.entries + two.entries
    if len(one.bins) > 0:
        contentType = list(one.bins.values())[0].factory.name
    elif len(two.bins) > 0:
        contentType = list(two.bins.values())[0].factory.name
    else:
        contentType = one.contentType
    bins = {}
    for key in set(one.bins.keys()).union(set(two.bins.keys())):
        if key in one.bins and key in two.bins:
            bins[key] = one.bins[key] + two.bins[key]
        elif key in one.bins:
            bins[key] = one.bins[key].copy()
        elif key in two.bins:
            bins[key] = two.bins[key].copy()
    nanflow = one.nanflow + two.nanflow
    return SparselyBin.ed(one.binWidth, entries, contentType, \
                          bins, nanflow, one.origin)
```

### JSON format

JSON object containing

  * `binWidth` (JSON number)
  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `bins:type` (JSON string), name of the values sub-aggregator type
  * `bins` (JSON object), keys are string representations of the bin indexes (decimal, no leading zeros) and values are sub-aggregators
  * `nanflow:type` (JSON string), name of the nanflow sub-aggregator type
  * `nanflow` sub-aggregator
  * `origin` (JSON number)
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `values:name` (JSON string), name of the `quantity` function used by each value. If specified here, it is _not_ specified in all the values, thereby streamlining the JSON.

**Example:**

```json
{"type": "SparselyBin",
 "data": {
   "binWidth": 2.0,
   "entries": 123.0,
   "bins:type": "Count",
   "bins": {"-999": 5.0, "-4": 23.0, "-2": 20.0, "0": 20.0, "2": 30.0, "4": 30.0, "12345": 8.0},
   "nanflow:type": "Count",
   "nanflow": 0.0,
   "origin": 0.0,
   "name": "myfunc"}}
```

## **CentrallyBin:** irregular but fully partitioning

Split a quantity into bins defined by irregularly spaced bin centers, with exactly one sub-aggregator filled per datum (the closest one).

Unlike irregular bins defined by explicit ranges, irregular bins defined by bin centers are guaranteed to fully partition the space with no gaps and no overlaps. It could be viewed as cluster scoring in one dimension.

The first and last bins cover semi-infinite domains, so it is unclear how to interpret them as part of the probability density function (PDF). Finite-width bins approximate the PDF in piecewise steps, but the first and last bins could be taken as zero (an underestimate) or as uniform from the most extreme point to the inner bin edge (an overestimate, but one that is compensated by underestimating the region just beyond the extreme point). For the sake of the latter interpretation, the minimum and maximum values are accumulated along with the bin values.

### CentrallyBinning constructor and required members

```python
CentrallyBin.ing(centers, quantity, value=Count.ing(), nanflow=Count.ing())
```

  * `centers` (list of doubles) is the centers of all bins
  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `value` (present-tense aggregator) generates sub-aggregators to put in each bin.
  * `nanflow` (present-tense aggregator) is a sub-aggregator to use for data whose quantity is NaN.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `bins` (list of double, present-tense aggregator pairs) are the bin centers and sub-aggregators in each bin.
  * `min` (mutable double) is the lowest value of the quantity observed, initially NaN.
  * `max` (mutable double) is the highest value of the quantity observed, initially NaN.

### CentrallyBinned constructor and required members

```python
CentrallyBin.ed(entries, bins, min, max, nanflow)
```

  * `entries` (double) is the number of entries.
  * `bins` (list of double, past-tense aggregator pairs) is the list of bin centers and their accumulated data.
  * `min` (double) is the lowest value of the quantity observed or NaN if no data were observed.
  * `max` (double) is the highest value of the quantity observed or NaN if no data were observed.
  * `nanflow` (past-tense aggregator) is the filled nanflow bin.

### Fill and add algorithms

```python
def fill(centrallybinning, datum, weight):
    if weight > 0.0:
        q = centrallybinning.quantity(datum)
        if math.isnan(q):
            centrallybinning.nanflow(datum, weight)
        else:
            dist, closest = min((abs(c - q), v) for c, v in centrallybinning.bins)
            closest.fill(datum, weight)
        centrallybinning.entries += weight
        if math.isnan(centrallybinning.min) or q < centrallybinning.min:
            centrallybinning.min = q
        if math.isnan(centrallybinning.max) or q > centrallybinning.max:
            centrallybinning.max = q

def __add__(one, two):
    if set(one.centers) != set(two.centers):
        raise Exception
    entries = one.entries + two.entries
    bins = []
    for c1, v1 in one.bins:
        v2 = [v for c2, v in two.bins if c1 == c2][0]
        bins.append((c1, v1 + v2))

    if math.isnan(one.min):
        min = two.min
    elif math.isnan(two.min):
        min = one.min
    elif one.min < two.min:
        min = one.min
    else:
        min = two.min

    if math.isnan(one.max):
        max = two.max
    elif math.isnan(two.max):
        max = one.max
    elif one.max > two.max:
        max = one.max
    else:
        max = two.max

    nanflow = one.nanflow + two.nanflow
    return CentrallyBin.ed(entries, bins, min, max, nanflow)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `bins:type` (JSON string), name of the values sub-aggregator type
  * `bins` (JSON array of JSON objects containing `center` (JSON number) and `value` (sub-aggregator)), collection of bin centers and their associated data
  * `min` (JSON number, "nan", "inf", or "-inf")
  * `max` (JSON number, "nan", "inf", or "-inf")
  * `nanflow:type` (JSON string), name of the nanflow sub-aggregator type
  * `nanflow` sub-aggregator
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `bins:name` (JSON string), name of the `quantity` function used by each value. If specified here, it is _not_ specified in all the values, thereby streamlining the JSON.

**Examples:**

```json
{"type": "CentrallyBin",
 "data": {
   "entries": 123.0,
   "bins:type": "Count",
   "bins": [
     {"center": -999.0, "value": 5.0},
     {"center": -4.0, "value": 23.0},
     {"center": -2.0, "value": 20.0},
     {"center": 0.0, "value": 20.0},
     {"center": 2.0, "value": 30.0},
     {"center": 4.0, "value": 30.0},
     {"center": 12345.0, "value": 8.0}],
   "min": -999.0,
   "max": 12345.0,
   "nanflow:type": "Count",
   "nanflow": 0.0,
   "name": "myfunc"}}
```

Note that the bins type does not apply to `min` and `max` because they quantify the domain, not the range. Here is an example with `Average` sub-aggregators:

```json
{"type": "CentrallyBin",
 "data": {
   "entries": 123.0,
   "bins:type": "Average",
   "bins": [
     {"center": -999.0, "value": 5.0, "mean": -1.0},
     {"center": -4.0, "value": 23.0, "mean": 4.25},
     {"center": -2.0, "value": 20.0, "mean": 16.21},
     {"center": 0.0, "value": 20.0, "mean": 20.28},
     {"center": 2.0, "value": 20.0, "mean": 16.19},
     {"center": 4.0, "value": 30.0, "mean": 4.23},
     {"center": 12345.0, "value": 8.0, "mean": -1.0}],
   "min": -999.0,
   "max": 12345.0,
   "nanflow:type": "Count",
   "nanflow": 0.0,
   "name": "myfunc",
   "bins:name": "myfunc2"}}
```

## **AdaptivelyBin:** for unknown distributions

Adaptively partition a domain into bins and fill them at the same time using a clustering algorithm. Each input datum contributes to exactly one final bin.

The algorithm is based on ["A streaming parallel decision tree algorithm," Yael Ben-Haim and Elad Tom-Tov, _J. Machine Learning Research 11,_ 2010.](http://www.jmlr.org/papers/volume11/ben-haim10a/ben-haim10a.pdf) with a small modification for display histograms.

Yael Ben-Haim and Elad Tom-Tov's algorithm adds each new data point as a new bin containing a single value, then merges the closest bins if the total number of bins exceeds a maximum (like hierarchical clustering in one dimension).

This tends to provide the most detail on the tails of a distribution (which have the most widely spaced bins), and is therefore a good alternative to [quantile](#quantile-such-as-median-quartiles-quintiles-etc) for estimating extreme quantiles like 0.01 and 0.99.

However, a histogram binned this way is less interesting for visualizing a distribution. Usually, the least interesting bins are the ones with the fewest entries, so one can consider merging the bins with the fewest entries, giving no detail on the tails.

As a compromise, we introduce a "tail detail" hyperparameter that strikes a balance between the two extremes: the bins that are merged minimize

```
tailDetail*(pos2 - pos1)/(max - min) + (1.0 - tailDetail)*(entries1 + entries2)/entries
```

where `pos1` and `pos2` are the (ordered) positions of the two bins, `min` and `max` are the minimum and maximum positions of all entries, `entries1` and `entries2` are the number of entries in the two bins, and `entries` is the total number of entries in all bins. The denominators normalize the scales of domain position and number of entries so that `tailDetail` may be unitless and between 0.0 and 1.0 (inclusive).

A value of `tailDetail = 0.2` is a good default.

This algorithm is deterministic; the same input data yield the same histogram.

### AdaptivelyBinning constructor and required members

```python
AdaptivelyBin.ing(quantity, num=100, tailDetail=0.2, value=Count.ing(), nanflow=Count.ing())
```

  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `num` (32-bit integer) specifies the maximum number of bins before merging.
  * `tailDetail` (double) is a value between 0.0 and 1.0 (inclusive) for choosing the pair of bins to merge (see above).
  * `value` (present-tense aggregator) generates sub-aggregators to put in each bin.
  * `nanflow` (present-tense aggregator) is a sub-aggregator to use for data whose quantity is NaN.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `bins` (mutable list of double, present-tense aggregator pairs) is the list of bin centers and bin contents. The domain of each bin is determined as in [CentrallyBin](http://127.0.0.1:4005/docs/specification/#centrallybin-irregular-but-fully-partitioning).
  * `min` (mutable double) is the lowest value of the quantity observed, initially NaN.
  * `max` (mutable double) is the highest value of the quantity observed, initially NaN.

### AdaptivelyBinned constructor and required members

```python
AdaptivelyBin.ed(entries, num, tailDetail, contentType, bins, min, max, nanflow)
```

  * `entries` (double) is the number of entries.
  * `num` (32-bit integer) specifies the maximum number of bins before merging.
  * `tailDetail` (double) is a value between 0.0 and 1.0 (inclusive) for choosing the pair of bins to merge (see above).
  * `contentType` (string) is the value's sub-aggregator type (must be provided to determine type for the case when `bins` is empty).
  * `bins` (list of double, past-tense aggregator pairs) is the list of bin centers and bin contents. The domain of each bin is determined as in [CentrallyBin](http://127.0.0.1:4005/docs/specification/#centrallybin-irregular-but-fully-partitioning).
  * `min` (double) is the lowest value of the quantity observed or NaN if no data were observed.
  * `max` (double) is the highest value of the quantity observed or NaN if no data were observed.
  * `nanflow` (past-tense aggregator) is the filled nanflow bin.

### Fill and add algorithms

```python
def mergeMetric(pos1, pos2, min, max, entries1, entries2, entries, tailDetail):
    return tailDetail*(pos2 - pos1)/(max - min) + (1.0 - tailDetail)*(entries1 + entries2)/entries

def merge(hist):
    bestMetric = None
    hist.bins.sort()
    for i in range(0, len(hist.bins) - 1):
        c1, v1 = hist.bins[i]
        c2, v2 = hist.bins[i + 1]
        q = mergeMetric(c1, c2, hist.min, hist.max, v1.entries, v2.entries, hist.entries, hist.tailDetail)
        if bestMetric is None or q < bestMetric:
            bestMetric = q
            leftToMerge = i
            rightToMerge = i + 1
    c1, v1 = hist.bins[leftToMerge]
    c2, v2 = hist.bins[rightToMerge]
    newc = (c1 * v1.entries + c2 * v2.entries) / (v1.entries + v2.entries)
    newv = v1 + v2
    hist.bins[leftToMerge] = newv
    del hist.bins[rightToMerge]

def fill(adaptivelybinning, datum, weight):
    if weight > 0.0:
        q = adaptivelybinning.quantity(datum)
        adaptivelybinning.bins.append((q, weight))
        while len(adaptivelybinning.bins) > adaptivelybinning.num:
            merge(adaptivelybinning)

        adaptivelybinning.entries += weight

        if math.isnan(adaptivelybinning.min) or q < adaptivelybinning.min:
            adaptivelybinning.min = q
        if math.isnan(adaptivelybinning.max) or q > adaptivelybinning.max:
            adaptivelybinning.max = q

def __add__(one, two):
    if one.num != two.num or one.tailDetail != two.tailDetail:
        raise Exception
    entries = one.entries + two.entries

    bins1 = dict(one.bins)
    bins2 = dict(two.bins)
    bins = []
    for c in set(bins1.keys()).union(set(bins2.keys())):
        if c in bins1 and c in bins2:
            bins.append((c, bins1[c] + bins2[c]))
        elif c in bins1:
            bins.append((c, bins1[c].copy()))
        elif c in bins2:
            bins.append((c, bins2[c].copy()))

    if math.isnan(one.min):
        min = two.min
    elif math.isnan(two.min):
        min = one.min
    elif one.min < two.min:
        min = one.min
    else:
        min = two.min

    if math.isnan(one.max):
        max = two.max
    elif math.isnan(two.max):
        max = one.max
    elif one.max > two.max:
        max = one.max
    else:
        max = two.max

    nanflow = one.nanflow + two.nanflow
    out = AdaptivelyBin.ed(entries, num, tailDetail, contentType, bins, min, max, nanflow)
    while len(out.bins) > out.num:
        merge(out)
    return out
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `num` (JSON number, must be an integer)
  * `bins:type` (JSON string), name of the values sub-aggregator type
  * `bins` (JSON array of JSON objects containing `center` (JSON number) and `value` (sub-aggregator)), collection of bin centers and their associated data
  * `min` (JSON number, "nan", "inf", or "-inf")
  * `max` (JSON number, "nan", "inf", or "-inf")
  * `nanflow:type` (JSON string), name of the nanflow sub-aggregator type
  * `nanflow` sub-aggregator
  * `tailDetail` (JSON number)
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `bins:name` (JSON string), name of the `quantity` function used by each value. If specified here, it is _not_ specified in all the values, thereby streamlining the JSON.

**Examples:**

```json
{"type": "AdaptivelyBin",
 "data": {
   "entries": 123.0,
   "num": 5,
   "bins:type": "Count",
   "bins": [
     {"center": -181.68, "value": 8.0},
     {"center": -2.0, "value": 20.0},
     {"center": 0.0, "value": 20.0},
     {"center": 2.0, "value": 30.0},
     {"center": 2602.11, "value": 38.0}],
   "min": -999.0,
   "max": 12345.0,
   "nanflow:type": "Count",
   "nanflow": 0.0,
   "tailDetail": 0.2,
   "name": "myfunc"}}
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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

# Third kind: pass to all sub-aggregators

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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
```

### JSON format

DESCRIPTION

**Example:**

```json
{"type": "XXX", "data": YYY}
```

## **Sample:** reservoir sampling

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

### Fill and add algorithms

```python
def fill(ING, datum, weight):

def __add__(one, two):
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

