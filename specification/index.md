---
title: Specification 0.7-prerelease
type: default
toc: true
custom_css: specification
summary: |
    <p>This page describes Histogrammar in detail, but without reference to any particular implementation, including the composable primitives, their required functions and argument lists, and their JSON representations.</p>
    
    <p>This is the normative specification; any implementations that don't adhere to the definitions on this page should be corrected.</p>
---

# General features

Histogrammar consists of two dozen aggregation primitives, each performing a simple task, that can be composed to solve complex aggregation problems. These primitives share the following properties.

### Reducers

The aggregators, individually and collectively, are reducers in the map-reduce sense. That is, they reduce a large table of data points to a small data structure that summarizes the whole. For instance, a traditional histogram is an array of counts, produced by incrementing array bins for each data point associated with it, and the resulting data structure approximates the probability density of the original distribution.

### Composable

A primitive that accepts a sub-aggregator as an argument to its constructor may accept _any_ sub-aggregator. The whole suite of primitives are given to the data analyst as building blocks to compute whatever complex statistics are needed.

### Commutative Monoids

Every primitive has a `combine` method, usually presented as the `+` operator, that allows sub-tallies to be combined into a grand total. This operation is associative and commutative, and has an identity: the aggregator's initial state. (Mathematically, this kind of algebra is known as a _commutative monoid_). Aggregation jobs can easily be distributed: sub-tallies are accumulated in parallel and, being much smaller than the original dataset, can be gathered to one location and combined for analysis.

### Serializable

Every filled aggregator has a language-independent JSON representation, allowing results to be transmitted across networks, co-processors, frameworks, and languages.

### Verbs

Each type of primitive has two forms:

  * the "present tense," which knows how to fill itself;
  * the "past tense," which has lost this information due to being serialized and reconstituted.

When constructing an aggregator, the data analyst defines functions for extracting the relevant quantities from the data. A present-tense aggregator uses these functions in its `fill` method to update its state. After serializing to and from JSON, an aggregator may have crossed to an entirely new language where the fill functions are no longer valid. It retains its data as a past-tense aggregator that can be combined but not filled.

As a mnemonic, each primitive is named as a verb, with the present-tense "-ing" form for mutable, fillable aggregators and the past-tense "-ed" form for immutable, filled aggregators. The infinitive is reserved for the factory that constructs both forms and interprets JSON.

### Exception-safe

The `fill` methods only update an aggregator's state _after_ the user-defined functions have all been evaluated. An exception in a user-defined function leaves a complex aggregator in its state prior to the fill attempt, not an inconsistent state.

## Data model

The input data for all aggregators is taken to be a stream, possibly an infinite stream, of _entries._ All user-defined functions map an entry to something an aggregator can use, such as a boolean for filtering, a floating point number for computing a mean or a bin, or a string.

A composite aggregator may contain many plotable data structures, such as histograms, profile plots, and scatter plots, but they must all draw from a single data source. For instance, data from one Monte Carlo sample can be plotted hundreds of different ways within a composite aggregator, revealing subtle relationships in that one dataset, but it cannot compare the Monte Carlo sample with another. For that, the data analyst needs to construct independent aggregators and run separate jobs.

It may be possible to merge data from multiple sources with the equivalent of an SQL `JOIN` operation, upstream of Histogrammar, but then Histogrammar's source becomes a single dataset and the same rules apply.

## Data weights

Selection functions in Histogrammar are "fuzzy." They could entirely keep or entirely drop whole entries, or they could keep an entry with partial weight, like 0.5 or 0.1. A weight of 0.0 is equivalent to dropping an entry, a weight of 1.0 is equivalent to not weighting, and a weight of 2.0 is equivalent to filling with two identical events, each with weight 1.0. Negative weights are treated as 0.0 and ignored. All primitives interpret weights this same way.

When two selection functions are nested, their weights multiply. Different parts of a composite aggregator may apply different selections, but all of the selections applied to a particular primitive can be deduced by following the path from the root of the tree to that primitive. Composite aggregators are in this way self-documenting.

Hisogrammar weights are metadata: though they are calculated from the data in user-defined functions, they are passed from one `fill` method to the next separately from the data entries themselves. Therefore, if a statistical procedure needs to make use of "negative weights," it can do so by calculating its own weights, which is simply data from Histogrammar's point of view.

For example, a Count primitive accumulates the sum of Histogrammar weights, which are always non-negative. To accumulate the sum of possibly negative weights, replace Count with Sum, and give the Sum an appropriate lambda function.

## User-defined functions

Each language has its own way of declaring functions; Histogrammar only assumes that functions (of some form) can be passed as arguments. For instance, Java technically does not have first class functions, but it can define objects in place with an `apply` method.

Histogrammar implementations must also be able to assign names to the functions as strings known at runtime. These names may be treated as metadata, carried separately from the functions themselves. When an aggregator is serialized as JSON, the functions are lost but their names are passed through for bookkeeping. For instance, a data analyst may define a function that extracts a distance in centimeters, label it as "x (cm)", and use it in a dozen histograms. After aggregating, serializing, transmitting, and reconstituting the histograms, they are still labeled as "x (cm)" and this label may be used on the axis of a plot.

Moreover, if the analyst ever changes the units, introducing a factor of 10 in the function and changing the label to "x (mm)", this calculation and its label are correctly updated in all the histograms in which it was used. The same would not be true if all histograms that use "x (mm)" were labeled independently.

### Function names in JSON

Aggregators that accept a function have a `"name"` attribute in their JSON representation to carry the function name. Some of these aggregators are copied many times, such as the bins of a histogram. In these situations, the sub-aggregators have no `"name"` attributes, but the parent aggregator has a `"values:name"` to express the name only once. Examples of this are included below.

## Conventions used in this specification

In the rest of this document, constructor arguments, required members, `fill`, `combine` algorithms, and JSON representations are given for each type of aggregator primitive. Histogrammar implementations should reproduce these names, calling structure, and data types exactly, though of course the notational syntax must differ.

The `fill` and `combine` algorithms are expressed in Python syntax for concreteness, with a goal of clarity, not performance. (In many cases, the Python version of Histogrammar is implemented differently for performance). The fact that each primitive has required members does not preclude implementations from defining more member functions and member data, even with semi-standard names and argument lists across implementations. But they are not _required._

Also, some arguments are represented here as being lists of values. If the language allows it, they may be varargs. Histogrammar implementations have a preference for varargs over explicit list types.

Many arguments are declared to be double precision, and that is the standard. In some environments, such as some models of GPUs, double precision is not available, and single-precision arithmetic must be used as a substitute. Even more restricted environments (FPGAs!) are limited to premultiplied integers. Such systems can be expected to yield only approximate results.

All but one of the primitives ([Sample](#sample-reservoir-sampling)) are deterministic. They should always yield the same result on the same data at the level of JSON equality. (JSON equality ignores the order of key-value pairs in maps and may truncate the least significant digits of numbers.) Implementations in different languages should also yield the same results, at the level of JSON equality.

If this document disagrees with the behavior of a Histogrammar implementation, this document should be taken as normative. Ultimately, disagreements would be decided in favor of the specification. For the time being, however, the specification needs to be debugged just as much as the existing implementations, so corrections on both sides are expected.

Happy histogramming!

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

### Fill and combine algorithms

```python
def fill(counting, datum, weight):
    if weight > 0.0:
        counting.entries += weight

def combine(one, two):
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

### Fill and combine algorithms

```python
def fill(summing, datum, weight):
    if weight > 0.0:
        q = summing.quantity(datum)
        summing.entries += weight
        summing.sum += q * weight

def combine(one, two):
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

### Fill and combine algorithms

```python
def fill(averaging, datum, weight):
    if weight > 0.0:
        q = averaging.quantity(datum)
        averaging.entries += weight
        delta = q - averaging.mean
        shift = delta * weight / averaging.entries
        averaging.mean += shift

def combine(one, two):
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

### Fill and combine algorithms

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

def combine(one, two):
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

### Fill and combine algorithms

```python
def fill(absoluteerring, datum, weight):
    if weight > 0.0:
        q = absoluteerring.quantity(datum)
        absoluteerring.entries += weight
        absoluteerring.absoluteSum += weight * abs(q)

def combine(one, two):
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

Unlike [Quantile](#quantile-such-as-median-quartiles-quintiles-etc) with a target of 0, Minimize is exact.

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

### Fill and combine algorithms

```python
def fill(minimizing, datum, weight):
    if weight > 0.0:
        q = quantity(datum)
        entries += weight
        if math.isnan(minimizing.min) or q < minimizing.min:
            minimizing.min = q

def combine(one, two):
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

Unlike [Quantile](#quantile-such-as-median-quartiles-quintiles-etc) with a target of 1, Maximize is exact.

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

### Fill and combine algorithms

```python
def fill(maximizing, datum, weight):
    if weight > 0.0:
        q = quantity(datum)
        entries += weight
        if math.isnan(maximizing.max) or q > maximizing.max:
            maximizing.max = q

def combine(one, two):
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

This statistic has the best accuracy for quantiles near the middle of the distribution, such as the median (0.5), and the worst accuracy for quantiles near the edges, such as the first or last percentile (0.01 or 0.99). Use the specialized aggregators for the [Minimum](#minimize-minimum-value) (0.0) or [Maximum](#maximize-maximum-value) (1.0) of a distribution, since those aggregators are exact.

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

### Fill and combine algorithms

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

def combine(one, two):
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

When composed with [Count](#count-sum-of-weights), this produces a standard histogram:

```python
Bin.ing(100, 0, 10, fill_x, Count.ing())
```

and when nested, it produces a two-dimensional histogram:

```python
Bin.ing(100, 0, 10, fill_x,
  Bin.ing(100, 0, 10, fill_y, Count.ing()))
```

Combining with [Deviate](#deviate-mean-and-variance) produces a physicist's "profile plot:"

```python
Bin.ing(100, 0, 10, fill_x, Deviate.ing(fill_y))
```

and so on.

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

### Fill and combine algorithms

```python
def fill(binning, datum, weight):
    if weight > 0.0:
        q = binning.quantity(datum)
        if math.isnan(q):
            fill(binning.nanflow, datum, weight)
        elif q < binning.low:
            fill(binning.underflow, datum, weight)
        elif q >= binning.high:
            fill(binning.overflow, datum, weight)
        else:
            bin = int(math.floor(binning.num * \
                (q - binning.low) / (binning.high - binning.low)))
            fill(binning.values[bin], datum, weight)
        binning.entries += weight

def combine(one, two):
    if one.num != two.num or one.low != two.low or one.high != two.high:
        raise Exception
    entries = one.entries + two.entries
    values = [combine(x, y) for x, y in zip(one.values, two.values)]
    underflow = combine(one.underflow, two.underflow)
    overflow = combine(one.overflow, two.overflow)
    nanflow = combine(one.nanflow, two.nanflow)
    return Bin.ed(one.low, one.high, entries, values, underflow, overflow, nanflow)
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
  * `nanflow` (sub-aggregator)
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `values:name` (JSON string), name of the `quantity` function used by each value. If specified here, it is _not_ specified in all the values, thereby streamlining the JSON.

**Examples:**

Here is a five-bin histogram, whose bin centers are at -4, -2, 0, 2, and 4. It counts the number of measurements made at each position.

```json
{"type": "Bin",
 "data": {
   "low": -5.0,
   "high": 5.0,
   "entries": 123.0,
   "name": "position [cm]",
   "values:type": "Count",
   "values": [10.0, 20.0, 20.0, 30.0, 30.0],
   "underflow:type": "Count",
   "underflow": 5.0,
   "overflow:type": "Count",
   "overflow": 8.0,
   "nanflow:type": "Count",
   "nanflow": 0.0}}
```

Here is another five-bin histogram on the same domain, this one quantifying an average value in each bin. The quantity measured by the average has a name (`"average time [s]"`), which would have been a `"name"` field in the JSON objects representing the averages if it had not been specified once in `"values:name"`.

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
     {"entries": 10.0, "mean": 4.25},
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
  * `bins` (map from 64-bit integer to past-tense aggregator) is the non-empty bin indexes and their values.
  * `nanflow` (past-tense aggregator) is the filled nanflow bin.
  * `origin` (double) is the left edge of the bin whose index is zero.

### Fill and combine algorithms

```python
def fill(sparselybinning, datum, weight):
    if weight > 0.0:
        q = sparselybinning.quantity(datum)
        if math.isnan(q):
            fill(sparselybinning.nanflow, datum, weight)
        else:
            bin = long(math.floor(binning.num * \
                (q - binning.low) / (binning.high - binning.low)))
            if bin in binning.bins:
                binning.bins[bin] = binning.value.copy()
            fill(binning.bins[bin], datum, weight)
            binning.entries += weight

def combine(one, two):
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
            bins[key] = combine(one.bins[key], two.bins[key])
        elif key in one.bins:
            bins[key] = one.bins[key].copy()
        elif key in two.bins:
            bins[key] = two.bins[key].copy()
    nanflow = combine(one.nanflow, two.nanflow)
    return SparselyBin.ed(one.binWidth, entries, contentType, \
                          bins, nanflow, one.origin)
```

### JSON format

JSON object containing

  * `binWidth` (JSON number)
  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `bins:type` (JSON string), name of the bins sub-aggregator type
  * `bins` (JSON object), keys are string representations of the bin indexes (decimal, no leading zeros) and values are sub-aggregators
  * `nanflow:type` (JSON string), name of the nanflow sub-aggregator type
  * `nanflow` (sub-aggregator)
  * `origin` (JSON number)
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `values:name` (JSON string), name of the `quantity` function used by each bin value. If specified here, it is _not_ specified in all the values, thereby streamlining the JSON.

**Example:**

```json
{"type": "SparselyBin",
 "data": {
   "binWidth": 2.0,
   "entries": 123.0,
   "bins:type": "Count",
   "bins": {"-999": 5.0, "-4": 10.0, "-2": 20.0, "0": 20.0, "2": 30.0, "4": 30.0, "12345": 8.0},
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

### Fill and combine algorithms

```python
def fill(centrallybinning, datum, weight):
    if weight > 0.0:
        q = centrallybinning.quantity(datum)
        if math.isnan(q):
            centrallybinning.nanflow(datum, weight)
        else:
            dist, closest = min((abs(c - q), v) for c, v in centrallybinning.bins)
            fill(closest, datum, weight)
        centrallybinning.entries += weight
        if math.isnan(centrallybinning.min) or q < centrallybinning.min:
            centrallybinning.min = q
        if math.isnan(centrallybinning.max) or q > centrallybinning.max:
            centrallybinning.max = q

def combine(one, two):
    if set(one.centers) != set(two.centers):
        raise Exception
    entries = one.entries + two.entries
    bins = []
    for c1, v1 in one.bins:
        v2 = [v for c2, v in two.bins if c1 == c2][0]
        bins.append((c1, combine(v1, v2)))

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

    nanflow = combine(one.nanflow, two.nanflow)
    return CentrallyBin.ed(entries, bins, min, max, nanflow)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `bins:type` (JSON string), name of the bins sub-aggregator type
  * `bins` (JSON array of JSON objects containing `center` (JSON number) and `value` (sub-aggregator)), collection of bin centers and their associated data
  * `min` (JSON number, "nan", "inf", or "-inf")
  * `max` (JSON number, "nan", "inf", or "-inf")
  * `nanflow:type` (JSON string), name of the nanflow sub-aggregator type
  * `nanflow` (sub-aggregator)
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `bins:name` (JSON string), name of the `quantity` function used by each bin value. If specified here, it is _not_ specified in all the values, thereby streamlining the JSON.

**Examples:**

```json
{"type": "CentrallyBin",
 "data": {
   "entries": 123.0,
   "bins:type": "Count",
   "bins": [
     {"center": -999.0, "value": 5.0},
     {"center": -4.0, "value": 10.0},
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
     {"center": -4.0, "value": 10.0, "mean": 4.25},
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

This tends to provide the most detail on the tails of a distribution (which have the most widely spaced bins), and is therefore a good alternative to [Quantile](#quantile-such-as-median-quartiles-quintiles-etc) for estimating extreme quantiles like 0.01 and 0.99.

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

### Fill and combine algorithms

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
            leftToCombine = i
            rightToCombine = i + 1
    c1, v1 = hist.bins[leftToCombine]
    c2, v2 = hist.bins[rightToCombine]
    newc = (c1 * v1.entries + c2 * v2.entries) / (v1.entries + v2.entries)
    newv = combine(v1, v2)
    hist.bins[leftToCombine] = newv
    del hist.bins[rightToCombine]

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

def combine(one, two):
    if one.num != two.num or one.tailDetail != two.tailDetail:
        raise Exception
    entries = one.entries + two.entries

    bins1 = dict(one.bins)
    bins2 = dict(two.bins)
    bins = []
    for c in set(bins1.keys()).union(set(bins2.keys())):
        if c in bins1 and c in bins2:
            bins.append((c, combine(bins1[c], bins2[c])))
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

    nanflow = combine(one.nanflow, two.nanflow)
    out = AdaptivelyBin.ed(entries, num, tailDetail, contentType, bins, min, max, nanflow)
    while len(out.bins) > out.num:
        merge(out)
    return out
```

The only difference between this and Yael Ben-Haim and Elad Tom-Tov's algorithm is `mergeMetric`, which is

```python
def mergeMetric(pos1, pos2, min, max, entries1, entries2, entries, tailDetail):
    return pos2 - pos1
```

in the original algorithm.

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `num` (JSON number, must be an integer)
  * `bins:type` (JSON string), name of the bins sub-aggregator type
  * `bins` (JSON array of JSON objects containing `center` (JSON number) and `value` (sub-aggregator)), collection of bin centers and their associated data
  * `min` (JSON number, "nan", "inf", or "-inf")
  * `max` (JSON number, "nan", "inf", or "-inf")
  * `nanflow:type` (JSON string), name of the nanflow sub-aggregator type
  * `nanflow` (sub-aggregator)
  * `tailDetail` (JSON number)
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `bins:name` (JSON string), name of the `quantity` function used by each bin value. If specified here, it is _not_ specified in all the values, thereby streamlining the JSON.

**Examples:**

```json
{"type": "AdaptivelyBin",
 "data": {
   "entries": 123.0,
   "num": 5,
   "bins:type": "Count",
   "bins": [
     {"center": -335.67, "value": 15.0},
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

Split a given quantity by its categorical value and fill only one category per datum.

A bar chart may be thought of as a histogram with string-valued (categorical) bins, so this is the equivalent of [Bin](#bin-regular-binning-for-histograms) for bar charts. The order of the strings is deferred to the visualization stage.

Unlike [SparselyBin](#sparselybin-ignore-zeros), this aggregator has the potential to use unlimited memory. A large number of _distinct_ categories can generate many unwanted bins.

### Categorizing constructor and required members

```python
Categorize.ing(quantity, value=Count.ing())
```

  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `value` (present-tense aggregator) generates sub-aggregators to put in each bin.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `pairs` (mutable map from string to present-tense aggregator) is the map, probably a hashmap, to fill with values when their `entries` become non-zero.

### Categorized constructor and required members

```python
Categorize.ed(entries, contentType, pairs)
```

  * `entries` (double) is the number of entries.
  * `contentType` (string) is the value's sub-aggregator type (must be provided to determine type for the case when `bins` is empty).
  * `pairs` (map from string to past-tense aggregator) is the non-empty bin categories and their values.

### Fill and combine algorithms

```python
def fill(categorizing, datum, weight):
    if weight > 0.0:
        q = categorizing.quantity(datum)
        if q not in categorizing.pairs:
            categorizing.pairs[q] = value.copy()
        fill(categorizing.pairs[q], datum, weight)
        categorizing.entries += weight

def combine(one, two):
    entries = one.entries + two.entries
    if len(one.pairs) > 0:
        contentType = list(one.pairs.values())[0].factory.name
    elif len(two.pairs) > 0:
        contentType = list(two.pairs.values())[0].factory.name
    else:
        contentType = one.contentType
    pairs = {}
    for key in set(one.pairs.keys()).union(set(two.pairs.keys())):
        if key in one.pairs and key in two.pairs:
            pairs[key] = combine(one.pairs[key], two.pairs[key])
        elif key in one.pairs:
            pairs[key] = one.pairs[key].copy()
        elif key in two.pairs:
            pairs[key] = two.pairs[key].copy()
    return Categorize.ed(entries, contentType, pairs)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `type` (JSON string), name of the sub-aggregator type
  * `data` (JSON object), keys are the string-valued categories and values are sub-aggregators
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `bins:name` (JSON string), name of the `quantity` function used by each bin value. If specified here, it is _not_ specified in all the values, thereby streamlining the JSON.

**Example:**

```json
{"type": "Categorize",
 "data": {
   "entries": 123.0,
   "type": "Count",
   "data": {"one": 23.0, "two": 20.0, "three": 20.0, "four": 30.0, "five": 30.0},
   "name": "myfunc"}}
```

## **Fraction:** efficiency plots

Accumulate two aggregators, one containing only entries that pass a given selection (numerator) and another that contains all entries (denominator).

The aggregator may be a simple [Count](#count-sum-of-weights) to measure the efficiency of a cut, a [Bin](#bin-regular-binning-for-histograms) to plot a turn-on curve, or anything else to be tested with and without a cut.

As a side effect of NaN values returning false for any comparison, a NaN return value from the selection is treated as a failed cut (the denominator is filled but the numerator is not).

### Fractioning constructor and required members

```python
Fraction.ing(quantity, value=Count.ing())
```

  * `quantity` (function returning boolean or double) computes the quantity of interest from the data and interprets it as a selection (multiplicative factor on weight).
  * `value` (present-tense aggregator) generates sub-aggregators for the numerator and denominator.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `numerator` (present-tense aggregator) is the sub-aggregator of entries that pass the selection.
  * `denominator` (present-tense aggregator) is the sub-aggregator of all entries.

### Fractioned constructor and required members

```python
Fraction.ed(entries, numerator, denominator)
```

  * `entries` (double) is the number of entries.
  * `numerator` (past-tense aggregator) is the filled numerator.
  * `denominator` (past-tense aggregator) is the filled denominator.

### Fill and combine algorithms

```python
def fill(fractioning, datum, weight):
    w = weight * fractioning.quantity(datum)
    if weight > 0.0:
        fill(fractioning.denominator, datum, weight)
    if w > 0.0:
        fill(fractioning.numerator, datum, w)
    fractioning.entries += weight

def combine(one, two):
    entries = one.entries + two.entries
    numerator = combine(one.numerator, two.numerator)
    denominator = combine(one.denominator, two.denominator)
    return Fraction.ed(entries, numerator, denominator)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `type` (JSON string), name of the numerator/denominator type
  * `numerator` (sub-aggregator)
  * `denominator` (sub-aggregator)
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `sub:name` (JSON string), name of the `quantity` function used by the numerator and denominator. If specified here, it is _not_ specified in all the sub-aggregators, thereby streamlining the JSON.

**Example:**

```json
{"type": "Fraction",
 "data": {
   "entries": 123.0,
   "name": "trigger",
   "sub:name": "energy [GeV]",
   "type": "Bin",
   "numerator": {
     "low": -5.0,
     "high": 5.0,
     "entries": 98.0,
     "values:type": "Count",
     "values": [2.0, 15.0, 18.0, 25.0, 30.0],
     "underflow:type": "Count",
     "underflow": 0.0,
     "overflow:type": "Count",
     "overflow": 8.0,
     "nanflow:type": "Count",
     "nanflow": 0.0},
   "denominator": {
     "low": -5.0,
     "high": 5.0,
     "entries": 123.0,
     "values:type": "Count",
     "values": [10.0, 20.0, 20.0, 30.0, 30.0],
     "underflow:type": "Count",
     "underflow": 5.0,
     "overflow:type": "Count",
     "overflow": 8.0,
     "nanflow:type": "Count",
     "nanflow": 0.0}}}
```

## **Stack:** cumulative filling

Accumulates a suite of aggregators, each filtered with a tighter selection on the same quantity.

This is a generalization of [Fraction](#fraction-efficiency-plots), which fills two aggregators, one with a cut, the other without. Stack fills `N + 1` aggregators with `N` successively tighter cut thresholds. The first is always filled (like the denominator of Fraction), the second is filled if the computed quantity exceeds its threshold, the next is filled if the computed quantity exceeds a higher threshold, and so on.

The thresholds are presented in increasing order and the computed value must be greater than or equal to a threshold to fill the corresponding bin, and therefore the number of entries in each filled bin is greatest in the first and least in the last.

Although this aggregation could be visualized as a stack of histograms, stacked histograms usually represent a different thing: data from different sources, rather than different cuts on the same source. For example, it is common to stack Monte Carlo samples from different backgrounds to show that they add up to the observed data. The Stack aggregator does not make plots of this type because aggregation trees in Histogrammar draw data from exactly one source.

To make plots from different sources in Histogrammar, one must perform separate aggregation runs. It may then be convenient to stack the results of those runs as though they were created with a Stack aggregation, so that plotting code can treat both cases uniformly. For this reason, Stack has an alternate constructor to build a Stack manually from distinct aggregators, even if those aggregators came from different aggregation runs.

### Stacking constructor and required members

```python
Stack.ing(thresholds, quantity, value, nanflow)
```

  * `thresholds` (list of doubles) specifies `N` cut thresholds, so the Stack will fill `N + 1` aggregators, each overlapping the last.
  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `value` (present-tense aggregator) generates sub-aggregators for each bin.
  * `nanflow` (present-tense aggregator) is a sub-aggregator to use for data whose quantity is NaN.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `cuts` (list of double, present-tense aggregator pairs) are the `N + 1` thresholds and sub-aggregators. (The first threshold is minus infinity; the rest are the ones specified by `thresholds`).

### Stacked constructor and required members

```python
Stack.ed(entries, cuts, nanflow)
```

  * `entries` (double) is the number of entries.
  * `cuts` (list of double, past-tense aggregator pairs) are the `N + 1` thresholds and sub-aggregator pairs.
  * `nanflow` (past-tense aggregator) is the filled nanflow bin.

### Stacked alternate constructor

```python
Stack.build(aggregators)
```

  * `aggregators` (list of aggregators of the same type from any source); the algorithm will attempt to add them, so they must also have the same binning/bounds/etc.

This constructor will make a past-tense Stacked object with NaN as cut thresholds and `Count.ed(0.0)` as `nanflow`.

### Fill, combine, and alternate constructor algorithms

```python
def fill(stacking, datum, weight):
    if weight > 0.0:
        q = stacking.quantity(datum)
        if math.isnan(q):
            fill(stacking.nanflow, datum, weight)
        else:
            for threshold, sub in stacking.cuts:
                if q >= threshold:
                    fill(sub, datum, weight)
        stacking.entries += weight

def combine(one, two):
    if [c for c, v in one.cuts] != [c for c, v in two.cuts]:
        raise Exception
    entries = one.entries + two.entries
    cuts = []
    for (c, v1), (_, v2) in zip(one.cuts, two.cuts):
        cuts.append((c, combine(v1, v2)))
    nanflow = combine(one.nanflow, two.nanflow)
    return Stack.ed(entries, cuts, nanflow)

def build(aggregators):
    entries = sum(x.entries for x in aggregators)
    cuts = []
    for i in range(len(aggregators)):
        stackedAggregators = reduce(lambda a, b: combine(a, b), aggregators[i:])
        cuts.append((float("nan"), stackedAggregators))
    return Stack.ed(entries, cuts, Count.ed(0.0))
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `type` (JSON string), name of the sub-aggregator type
  * `data` (JSON array of JSON objects containing `atleast` (JSON number or "-inf") and `data` (sub-aggregator)), collection of cut thresholds and their associated data
  * `nanflow:type` (JSON string), name of the nanflow sub-aggregator type
  * `nanflow` (sub-aggregator)
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `data:name` (JSON string), name of the `quantity` function used by the sub-aggregators. If specified here, it is _not_ specified in all the sub-aggregators, thereby streamlining the JSON.

**Examples:**

```json
{"type": "Stack",
 "data": {
   "entries": 123.0,
   "type": "Count",
   "data": [
     {"atleast": "-inf", "data": 123.0},
     {"atleast": 1.0, "data": 100.0},
     {"atleast": 2.0, "data": 82.0},
     {"atleast": 3.0, "data": 37.0},
     {"atleast": 4.0, "data": 4.0}],
   "nanflow:type": "Count",
   "nanflow": 0.0,
   "name": "myfunc"}}
```

```json
{"type": "Stack",
 "data": {
   "entries": 123.0,
   "type": "Average",
   "data": [
     {"atleast": "-inf", "data": {"entries": 123.0, "mean": 3.14}},
     {"atleast": 1.0, "data": {"entries": 100.0, "mean": 2.28}},
     {"atleast": 2.0, "data": {"entries": 82.0, "mean": 1.16}},
     {"atleast": 3.0, "data": {"entries": 37.0, "mean": 8.9}},
     {"atleast": 4.0, "data": {"entries": 4.0, "mean": 22.7}}],
   "nanflow:type": "Count",
   "nanflow": 0.0}}
```

## **Partition:** exclusive filling

Accumulate a suite of aggregators, each between two thresholds, filling exactly one per datum.

This is a variation on [Stack](#stack-cumulative-filling), which fills `N + 1` aggregators with `N` successively tighter cut thresholds. Partition fills `N + 1` aggregators in the non-overlapping intervals between `N` thresholds.

Partition is also similar to [CentrallyBin](#centrallybin-irregular-but-fully-partitioning), in that they both partition a space into irregular subdomains with no gaps and no overlaps. However, CentrallyBin is defined by bin centers and Partition is defined by bin edges, the first and last of which are at negative and positive infinity.

### Partitioning constructor and required members

```python
Partition.ing(thresholds, quantity, value, nanflow)
```

  * `thresholds` (list of doubles) specifies `N` cut thresholds, so the Partition will fill `N + 1` aggregators in distinct intervals.
  * `quantity` (function returning double) computes the quantity of interest from the data.
  * `value` (present-tense aggregator) generates sub-aggregators for each bin.
  * `nanflow` (present-tense aggregator) is a sub-aggregator to use for data whose quantity is NaN.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `cuts` (list of double, present-tense aggregator pairs) are the `N + 1` thresholds and sub-aggregators. (The first threshold is minus infinity; the rest are the ones specified by `thresholds`).

### Partitioned constructor and required members

```python
Partition.ed(entries, cuts, nanflow)
```

  * `entries` (double) is the number of entries.
  * `cuts` (list of double, past-tense aggregator pairs) are the `N + 1` thresholds and sub-aggregator pairs.
  * `nanflow` (past-tense aggregator) is the filled nanflow bin.

### Fill and combine algorithms

```python
def fill(partitioning, datum, weight):
    if weight > 0.0:
        q = partitioning.quantity(datum)
        if math.isnan(q):
            fill(partitioning.nanflow, datum, weight)
        else:
            lowEdges = partitioning.cuts
            highEdges = partitioning.cuts[1:] + [(float("nan"), None)]
            for (low, sub), (high, _) in zip(lowEdges, highEdges):
                if low <= q < high:
                    fill(sub, datum, weight)
                    break
            partitioning.entries += weight

def combine(one, two):
    if one.thresholds != two.thresholds:
        raise Exception
    entries = one.entries + two.entries
    cuts = [(c, combine(v1, v2)) for (c, v1), (_, v2) in zip(one.cuts, two.cuts)]
    nanflow = combine(one.nanflow, two.nanflow)
    return Partition.ed(entries, cuts, nanflow)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `type` (JSON string), name of the sub-aggregator type
  * `data` (JSON array of JSON objects containing `atleast` (JSON number or "-inf") and `data` (sub-aggregator)), collection of cut thresholds and their associated data
  * `nanflow:type` (JSON string), name of the nanflow sub-aggregator type
  * `nanflow` (sub-aggregator)
  * optional `name` (JSON string), name of the `quantity` function, if provided.
  * optional `data:name` (JSON string), name of the `quantity` function used by the sub-aggregators. If specified here, it is _not_ specified in all the sub-aggregators, thereby streamlining the JSON.

**Examples:**

```json
{"type": "Partition",
 "data": {
   "entries": 123.0,
   "type": "Count",
   "data": [
     {"atleast": "-inf", "data": 23.0},
     {"atleast": 1.0, "data": 20.0},
     {"atleast": 2.0, "data": 20.0},
     {"atleast": 3.0, "data": 30.0},
     {"atleast": 4.0, "data": 30.0}],
   "nanflow:type": "Count",
   "nanflow": 0.0,
   "name": "myfunc"}}
```

```json
{"type": "Partition",
 "data": {
   "entries": 123.0,
   "type": "Average",
   "data": [
     {"atleast": "-inf", "data": {"entries": 23.0, "mean": 3.14}},
     {"atleast": 1.0, "data": {"entries": 20.0, "mean": 2.28}},
     {"atleast": 2.0, "data": {"entries": 20.0, "mean": 1.16}},
     {"atleast": 3.0, "data": {"entries": 30.0, "mean": 8.9}},
     {"atleast": 4.0, "data": {"entries": 30.0, "mean": 22.7}}],
   "nanflow:type": "Count",
   "nanflow": 0.0}}
```

## **Select:** apply a cut

Filter or weight data according to a given selection.

This primitive is a basic building block, intended to be used in conjunction with anything that needs a user-defined cut. In particular, a standard histogram often has a custom selection, and this can be built by nesting Select &rarr; Bin &rarr; Count.

Select also resembles [Fraction](#fraction-efficiency-plots), but without the `denominator`.

The efficiency of a cut in a Select aggregator named `x` is simply `x.cut.entries / x.entries` (because all aggregators have an `entries` member).

### Selecting constructor and required members

```python
Select.ing(quantity, cut)
```

  * `quantity` (function returning boolean or double) computes the quantity of interest from the data and interprets it as a selection (multiplicative factor on weight).
  * `cut` (present-tense aggregator) will only be filled with data that pass the cut, and which are weighted by the cut.
  * `entries` (mutable double) is the number of entries, initially 0.0.

### Selected constructor and required members

```python
Select.ed(entries, cut)
```

  * `entries` (double) is the number of entries.
  * `cut` (past-tense aggregator) is the filled sub-aggregator.

### Fill and combine algorithms

```python
def fill(selecting, datum, weight):
    w = weight * selecting.quantity(datum)
    if w > 0.0:
        fill(selecting.cut, datum, w)
    selecting.entries += weight

def combine(one, two):
    entries = one.entries + two.entries
    cut = combine(one.cut, two.cut)
    return Select.ed(entries, cut)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `type` (JSON string), name of the sub-aggregator type
  * `data` (sub-aggregator)
  * optional `name` (JSON string), name of the `quantity` function, if provided.

**Examples:**

```json
{"type": "Select",
 "data": {
   "entries": 123.0,
   "name": "trigger",
   "type": "Count",
   "data": 98.0}}
```

```json
{"type": "Select",
 "data": {
   "entries": 123.0,
   "name": "trigger",
   "sub:name": "energy [GeV]",
   "type": "Bin",
   "data": {
     "low": -5.0,
     "high": 5.0,
     "entries": 98.0,
     "values:type": "Count",
     "values": [2.0, 15.0, 18.0, 25.0, 30.0],
     "underflow:type": "Count",
     "underflow": 0.0,
     "overflow:type": "Count",
     "overflow": 8.0,
     "nanflow:type": "Count",
     "nanflow": 0.0}}}
```

## **Limit:** keep detail until entries is large

Accumulate an aggregator until its number of entries reaches a predefined limit.

Limit is intended to roll high-detail descriptions of small datasets over into low-detail descriptions of large datasets. For instance, a scatter plot is useful for small numbers of data points and heatmaps are useful for large ones. The following construction

```python
Bin(xbins, xlow, xhigh, lambda d: d.x,
  Bin(ybins, ylow, yhigh, lambda d: d.y,
    Limit(10.0, Bag(lambda d: [d.x, d.y]))))
```

fills a scatter plot in all x-y bins that have fewer than 10 entries and only a number of entries above that. Postprocessing code would use the bin-by-bin numbers of entries to color a heatmap and the raw data points to show outliers in the nearly empty bins.

Limit can effectively swap between two descriptions if it is embedded in a collection, such as [Branch](#branch-tuple-of-different-types). All elements of the collection would be filled until the Limit saturates, leaving only the low-detail one. For instance, one could aggregate several [SparselyBin](#sparselybin-ignore-zeros) histograms, each with a different `binWidth`, and progressively eliminate them in order of increasing `binWidth`.

Note that Limit saturates when it reaches a specified _total weight,_ not the number of data points in a [Bag](#bag-accumulate-values-for-scatter-plots), so it is not certain to control memory use. However, the total weight is of more use to data analysis. ([Sample](#sample-reservoir-sampling) puts a strict limit on memory use.)

### Limiting constructor and required members

```python
Limit.ing(limit, value)
```

  * `limit` (double) is the maximum number of entries (inclusive) before deleting the `value`.
  * `value` (present-tense aggregator) will only be filled until its number of entries exceeds the `limit`.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `contentType` (string) is the value's sub-aggregator type (must be provided to determine type for the case when `value` has been deleted).

### Limited constructor and required members

```python
Limit.ed(entries, limit, contentType, value)
```

  * `entries` (double) is the number of entries.
  * `limit` (double) is the maximum number of entries (inclusive).
  * `contentType` (string) is the value's sub-aggregator type (must be provided to determine type for the case when `value` has been deleted).
  * `value` (past-tense aggregator or null) is the filled sub-aggregator if unsaturated, null if saturated.

### Fill and combine algorithms

```python
def fill(limiting, datum, weight):
    if limiting.entries + weight > limiting.limit:
        limiting.value = None
    else:
        fill(limiting.value, datum, weight)

def combine(one, two):
    if one.limit != two.limit or one.contentType != two.contentType:
        raise Exception
    entries = one.entries + two.entries
    if entries > one.limit:
        value = None
    else:
        value = combine(one.value, two.value)
    return Limit.ed(entries, one.limit, one.contentType, value)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `limit` (JSON number)
  * `type` (JSON string), name of the sub-aggregator type
  * `data` (sub-aggregator or JSON null)

**Examples:**

```json
{"type": "Limit",
 "data": {
   "entries": 98.0,
   "limit": 100.0,
   "type": "Bag",
   "data": {
     "entries": 98.0,
     "values": [
       {"w": 2.0, "v": [1.0, 2.0, 3.0]},
       {"w": 15.0, "v": [3.14, 3.14, 3.14]},
       {"w": 18.0, "v": [99.0, 50.0, 1.0]},
       {"w": 25.0, "v": [7.0, 2.2, 9.8]},
       {"w": 30.0, "v": [33.3, 66.6, 99.9]}]}}}
```

```json
{"type": "Limit",
 "data": {
   "entries": 123.0,
   "limit": 100.0,
   "type": "Bag",
   "data": null}}
```

# Third kind: pass to all sub-aggregators

## **Label:** directory with string-based keys

Accumulate any number of aggregators of the same type and label them with strings. Every sub-aggregator is filled with every input datum.

This primitive simulates a directory of aggregators. For sub-directories, nest collections within the Label collection.

Note that all sub-aggregators within a Label must have the _same type_ (e.g. histograms of different binnings, but all histograms). To collect objects of _different types_ with string-based look-up keys, use [UntypedLabel](#untypedlabel-directory-of-different-types).

To collect aggregators of the _same type_ without naming them, use [Index](#index-list-with-integer-keys). To collect aggregators of _different types_ without naming them, use [Branch](#branch-tuple-of-different-types).

In strongly typed languages, the restriction to a single type allows nested objects to be extracted without casting.

### Labeling constructor and required members

```python
Label.ing(pairs)
```

  * `pairs` (list of string, present-tense aggregator pairs) is the collection of aggregators to fill.
  * `pairsMap` (map of the above, probably a hashmap) is intended for fast look-ups.
  * `entries` (mutable double) is the number of entries, initially 0.0.

### Labeled constructor and required members

```python
Label.ed(entries, pairs)
```

  * `entries` (double) is the number of entries.
  * `pairs` (list of string, past-tense aggregator pairs) is the collection of filled aggregators.
  * `pairsMap` (map of the above, probably a hashmap) is intended for fast look-ups.

### Fill and combine algorithms

```python
def fill(labeling, datum, weight):
    for _, v in labeling.pairs:
        fill(v, datum, weight)
    labeling.entries += weight

def combine(one, two):
    if set(one.pairsMap.keys()) != set(two.pairsMap.keys()):
        raise Exception
    entries = one.entries + two.entries
    pairs = []
    for l, v1 in one.pairs:
        v2 = two.pairsMap[l]
        pairs.append((l, combine(v1, v2)))
    return Label.ed(entries, pairs)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `type` (JSON string), name of the sub-aggregator type
  * `data` (JSON object), keys are the labels and values are sub-aggregators

The fact that Label requires all contents to have a single type allows the `type` to be specified once here, instead of once for every item in the collection. [UntypedLabel](#untypedlabel-directory-of-different-types) is more verbose.

**Example:**

```json
{"type": "Label",
 "data": {
   "entries": 123.0,
   "type": "Average",
   "data": {
     "one": {"entries": 123.0, "mean": 3.14},
     "two": {"entries": 123.0, "mean": 6.28},
     "three": {"entries": 123.0, "mean": 99.9}}}}
```

## **UntypedLabel:** directory of different types

Accumulate any number of aggregators of any type and label them with strings. Every sub-aggregator is filled with every input datum.

This primitive simulates a directory of aggregators. For sub-directories, nest collections within the UntypedLabel.

Note that sub-aggregators within an UntypedLabel may have _different types_. In strongly typed languages, this flexibility poses a problem: nested objects must be type-cast before they can be used. To collect objects of the _same type_ with string-based look-up keys, use [Label](#label-directory-with-string-based-keys).

To collect aggregators of the _same type_ without naming them, use [Index](#index-list-with-integer-keys). To collect aggregators of _different types_ without naming them, use [Branch](#branch-tuple-of-different-types).

### UntypedLabeling constructor and required members

```python
UntypedLabel.ing(pairs)
```

  * `pairs` (list of string, present-tense aggregator pairs) is the collection of aggregators to fill.
  * `pairsMap` (map of the above, probably a hashmap) is intended for fast look-ups.
  * `entries` (mutable double) is the number of entries, initially 0.0.

### UntypedLabeled constructor and required members

```python
UntypedLabel.ed(entries, pairs)
```

  * `entries` (double) is the number of entries.
  * `pairs` (list of string, past-tense aggregator pairs) is the collection of filled aggregators.
  * `pairsMap` (map of the above, probably a hashmap) is intended for fast look-ups.

### Fill and combine algorithms

```python
def fill(untypedlabeling, datum, weight):
    for _, v in untypedlabeling.pairs:
        fill(v, datum, weight)
    untypedlabeling.entries += weight

def combine(one, two):
    if set(one.pairsMap.keys()) != set(two.pairsMap.keys()):
        raise Exception
    entries = one.entries + two.entries
    pairs = []
    for l, v1 in one.pairs:
        v2 = two.pairsMap[l]
        pairs.append((l, combine(v1, v2)))
    return UntypedLabel.ed(entries, pairs)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `data` (JSON object mapping labels to JSON objects containing `type` (JSON string), name of sub-aggregator type and `data` (sub-aggregator))

The fact that UntypedLabel allows each element to have a different type forces the `type` annotation to be nested with the sub-aggregator. For collections that actually contain only one type, [Label](#label-directory-with-string-based-keys) avoids this redundancy.

**Example:**

```json
{"type": "UntypedLabel",
 "data": {
   "entries": 123.0,
   "data": {
     "one": {"type": "Count", "data": 123.0},
     "two": {"type": "Average", "data": {
       "entries": 123.0,
       "mean": 3.14}},
     "three": {"type": "Bin", "data": {
       "low": -5.0,
       "high": 5.0,
       "entries": 123.0,
       "name": "position [cm]",
       "values:type": "Count",
       "values": [10.0, 20.0, 20.0, 30.0, 30.0],
       "underflow:type": "Count",
       "underflow": 5.0,
       "overflow:type": "Count",
       "overflow": 8.0,
       "nanflow:type": "Count",
       "nanflow": 0.0}}}}}
```

## **Index:** list with integer keys

Accumulate any number of aggregators of the same type in a list. Every sub-aggregator is filled with every input datum.

This primitive provides an anonymous collection of aggregators (unless the integer index is taken to have special meaning, but generally such bookkeeping should be encoded in strings). Indexes can be nested to create two-dimensional ordinal grids of aggregators. (Use [Bin](#bin-regular-binning-for-histograms) if the space is to have a metric interpretation.)

Note that all sub-aggregators within an Index must have the _same type_ (e.g. histograms of different binnings, but all histograms). To collect objects of _different types,_ still indexed by integer, use [Branch](#branch-tuple-of-different-types).

To collect aggregators of the _same type_ with string-based labels, use [Label](#label-directory-with-string-based-keys). To collect aggregators of _different types_ with string-based labels, use [UntypedLabel](#untypedlabel-directory-of-different-types).

In strongly typed languages, the restriction to a single type allows nested objects to be extracted without casting.

### Indexing constructor and required members

```python
Index.ing(values)
```

  * `values` (list of present-tense aggregators) is the collection of aggregators to fill.
  * `entries` (mutable double) is the number of entries, initially 0.0.

### Indexed constructor and required members

```python
Index.ed(entries, values)
```

  * `entries` (double) is the number of entries.
  * `values` (list of past-tense aggregators) is the collection of filled aggregators.

### Fill and combine algorithms

```python
def fill(indexing, datum, weight):
    for v in indexing.values:
        fill(v, datum, weight)
    indexing.entries += weight

def combine(one, two):
    if len(one.values) != len(two.values):
        raise Exception
    entries = one.entries + two.entries
    values = []
    for v1, v2 in zip(one.values, two.values):
        values.append(combine(v1, v2))
    return Index.ed(entries, values)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `type` (JSON string), name of the sub-aggregator type
  * `data` (JSON array of aggregators)

The fact that Index requires all contents to have a single type allows the `type` to be specified once here, instead of once for every item in the collection. [Branch](#branch-tuple-of-different-types) is more verbose.

**Example:**

```json
{"type": "Index",
 "data": {
   "entries": 123.0,
   "type": "Average",
   "data": [
     {"entries": 123.0, "mean": 3.14},
     {"entries": 123.0, "mean": 6.28},
     {"entries": 123.0, "mean": 99.9}]}}
```

## **Branch:** tuple of different types

Accumulate aggregators of different types, indexed by i0 through i9. Every sub-aggregator is filled with every input datum.

This primitive provides an anonymous collection of aggregators of _different types,_ usually for gluing together various statistics. For instance, if the following associates a sum of weights to every bin in a histogram,

```python
Bin.ing(100, 0, 1, lambda d: d.x,
  Sum.ing(lambda d: d.weight))
```

the following would associate the sum of weights and the sum of squared weights to every bin:

```python
Bin.ing(100, 0, 1, lambda d: d.x,
  Branch.ing(Sum.ing(lambda d: d.weight),
             Sum.ing(lambda d: d.weight**2)))
```

Branch is a basic building block for complex aggregators. The limitation to ten branches, indexed from i0 to i9, is a concession to type inference in statically typed languages. It is not a fundamental limit, but the type-metaprogramming becomes increasingly complex as branches are added. Error messages may be convoluted as the compiler presents internals of the type-metaprogramming in response to a user's simple mistake.

Therefore, individual implementations may allow more than ten branches, but the Histogrammar standard only requires ten.

To collect an unlimited number of aggregators of the _same type_ without naming them, use [Index](#index-list-with-integer-keys). To collect aggregators of the _same type_ with string-based labels, use [Label](#label-directory-with-string-based-keys). To collect aggregators of _different types_ with string-based labels, use [UntypedLabel](#untypedlabel-directory-of-different-types).

### Branching constructor and required members

```python
Branch.ing(values)
```

  * `values` (list of present-tense aggregators) is the collection of aggregators to fill.
  * `entries` (mutable double) is the number of entries, initially 0.0.

### Branched constructor and required members

```python
Branch.ed(entries, values)
```

  * `entries` (double) is the number of entries.
  * `values` (list of past-tense aggregators) is the collection of filled aggregators.

### Fill and combine algorithms

```python
def fill(branching, datum, weight):
    for v in branching.values:
        fill(v, datum, weight)
    branching.entries += weight

def combine(one, two):
    if len(one.values) != len(two.values):
        raise Exception
    entries = one.entries + two.entries
    values = []
    for v1, v2 in zip(one.values, two.values):
        values.append(combine(v1, v2))
    return Branch.ed(entries, values)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `data` (JSON array of JSON objects containing `type` (JSON string), name of sub-aggregator type and `data` (sub-aggregator))

**Example:**

```json
{"type": "Branch",
 "data": {
   "entries": 123.0,
   "data": [
     {"type": "Count", "data": 123.0},
     {"type": "Average", "data": {
       "entries": 123.0,
       "mean": 3.14}},
     {"type": "Bin", "data": {
       "low": -5.0,
       "high": 5.0,
       "entries": 123.0,
       "name": "position [cm]",
       "values:type": "Count",
       "values": [10.0, 20.0, 20.0, 30.0, 30.0],
       "underflow:type": "Count",
       "underflow": 5.0,
       "overflow:type": "Count",
       "overflow": 8.0,
       "nanflow:type": "Count",
       "nanflow": 0.0}}]}}
```

# Fourth kind: collect sets of raw data

## **Bag:** accumulate values for scatter plots

Accumulate raw numbers, vectors of numbers, or strings, with identical values merged.

A bag is the appropriate data type for scatter plots: a container that collects raw values, maintaining multiplicity but not order. (A "bag" is also known as a "multiset.") Conceptually, it is a mapping from distinct raw values to the number of observations: when two instances of the same raw value are observed, one key is stored and their weights add.

Although the user-defined function may return scalar numbers, fixed-dimension vectors of numbers, or categorical strings, it may not mix types. Different Bag primitives in an analysis tree may collect different types.

Consider using Bag with [Limit](#limit-keep-detail-until-entries-is-large) for collections that roll over to a mere count when they exceed a limit, or [Sample](#sample-reservoir-sampling) for reservoir sampling.

### Bagging constructor and required members

```python
Bag.ing(quantity)
```
  * `quantity` (function returning a double, a vector of doubles, or a string) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `values` (mutable map from quantity return type to double) is the number of entries for each unique item.

### Bagged constructor and required members

```python
Bag.ed(entries, values)
```

  * `entries` (double) is the number of entries.
  * `values` (map from double, vector of doubles, or string to double) is the number of entries for each unique item.

### Fill and combine algorithms

```python
def fill(bagging, datum, weight):
    if weight > 0.0:
        q = bagging.quantity(datum)
        bagging.entries += weight
        if q in bagging.values:
            bagging.values[q] += weight
        else:
            bagging.values[q] = weight

def combine(one, two):
    entries = one.entries + two.entries
    values = {}
    for v in set(one.values.keys()).union(set(two.values.keys())):
        if v in one.values and v in two.values:
            values[v] = combine(one.values[v], two.values[v])
        elif v in one.values:
            values[v] = one.values[v].copy()
        elif v in two.values:
            values[v] = two.values[v].copy()
    return Bag.ed(entries, values)
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `values` (JSON array of JSON objects containing `w` (JSON number), the total weight of entries for a unique value and `v` (JSON number, array of numbers, or string), the value), which should be sorted by `v` (lexicographically)

**Examples:**

```json
{"type": "Bag",
 "data": {
   "entries": 123.0,
   "values": [
     {"w": 23.0, "v": -999.0},
     {"w": 20.0, "v": -4.0},
     {"w": 20.0, "v": -2.0},
     {"w": 30.0, "v": 0.0},
     {"w": 30.0, "v": 2.0}]}}
```

```json
{"type": "Bag",
 "data": {
   "entries": 123.0,
   "values": [
     {"w": 23.0, "v": [1.0, 2.0, 3.0]},
     {"w": 20.0, "v": [3.14, 3.14, 3.14]},
     {"w": 20.0, "v": [99.0, 50.0, 1.0]},
     {"w": 30.0, "v": [7.0, 2.2, 9.8]},
     {"w": 30.0, "v": [33.3, 66.6, 99.9]}]}}
```

```json
{"type": "Bag",
 "data": {
   "entries": 123.0,
   "values": [
     {"w": 23.0, "v": "five"},
     {"w": 20.0, "v": "four"},
     {"w": 20.0, "v": "one"},
     {"w": 30.0, "v": "three"},
     {"w": 30.0, "v": "two"}]}}
```

## **Sample:** reservoir sampling

Accumulate raw numbers, vectors of numbers, or strings, randomly replacing them with Reservoir Sampling when the number of values exceeds a limit.

Sample collects raw values without attempting to group them by distinct value (as [Bag](#bag-accumulate-values-for-scatter-plots) does), up to a given maximum _number_ of entries (unlike [Limit](#limit-keep-detail-until-entries-is-large), which rolls over at a given total weight). The reason for the limit on Sample is purely to conserve memory.

The maximum number of entries and the data type together determine the size of the working set. If new values are added after this set is full, individual values will be randomly chosen for replacement. The probability of replacement is proportional to an entry's weight and it decreases with time, such that the final sample is a representative subset of all observed values, without preference for early values or late values.

This algorithm is known as weighted Reservoir Sampling, and it is non-deterministic. Each evaluation will likely result in a different final set.

Specifically, the algorithm implemented here was described in ["Weighted random sampling with a reservoir," Pavlos S. Efraimidis and Paul G. Spirakis, _Information Processing Letters 97 (5): 181–185,_ 2005 (doi:10.1016/j.ipl.2005.11.003)](http://www.sciencedirect.com/science/article/pii/S002001900500298X).

Although the user-defined function may return scalar numbers, fixed-dimension vectors of numbers, or categorical strings, it may not mix types. Different Sample primitives in an analysis tree may collect different types.

### Sampling constructor and required members

```python
Sample.ing(limit, quantity)
```

  * `limit` (32-bit integer) is the maximum number of entries to store before replacement. This is a strict _number_ of entries, unaffected by weights.
  * `quantity` (function returning a double, a vector of doubles, or a string) computes the quantity of interest from the data.
  * `entries` (mutable double) is the number of entries, initially 0.0.
  * `values` (mutable, sorted list of quantity return type, double, double triplets) is the set of collected values with their weights and a random number (see algorithm below). Its size is at most `limit` and it may contain duplicates.

### Sampled constructor and required members

```python
Sample.ed(entries, limit, values)
```

  * `entries` (double) is the number of entries.
  * `limit` (32-bit integer) is the maximum number of entries to store before replacement. This is a strict _number_ of entries, unaffected by weights.
  * `values` (sorted list of quantity return type, double, double pairs) is the set of collected values with their weights. Its size is at most `limit` and it may contain duplicates.

### Fill and combine algorithms

```python
def merge(values, datum, weight, limit):
    r = random.uniform(0.0, 1.0)**(1.0/weight)
    if len(values) < limit:
        values.append((r, datum, weight))
        values.sort()
    elif values[0][0] < r:
        values.append((r, datum, weight))
        values.sort()
        del values[0]

def fill(sampling, datum, weight):
    merge(sampling.values, datum, weight, sampling.limit)
    sampling.entries += weight

def combine(one, two):
    if one.limit != two.limit:
        raise Exception
    entries = one.entries + two.entries
    values = []
    for r, datum, weight in one.values:
        merge(values, datum, weight, one.limit)
    for r, datum, weight in two.values:
        merge(values, datum, weight, one.limit)
    return Sample.ed(entries, one.limit, [(d, w) for r, d, w in values])
```

### JSON format

JSON object containing

  * `entries` (JSON number, "nan", "inf", or "-inf")
  * `limit` (JSON number, must be an integer)
  * `values` (JSON array of JSON objects containing `w` (JSON number), the weight of a value and `v` (JSON number, array of numbers, or string), the value), which should be sorted by `v` (lexicographically)

**Examples:**

```json
{"type": "Sample",
 "data": {
   "entries": 123.0,
   "limit": 5,
   "values": [
     {"w": 23.0, "v": -999.0},
     {"w": 20.0, "v": -4.0},
     {"w": 20.0, "v": -2.0},
     {"w": 30.0, "v": 0.0},
     {"w": 30.0, "v": 2.0}]}}
```

```json
{"type": "Sample",
 "data": {
   "entries": 123.0,
   "limit": 5,
   "values": [
     {"w": 23.0, "v": [1.0, 2.0, 3.0]},
     {"w": 20.0, "v": [3.14, 3.14, 3.14]},
     {"w": 20.0, "v": [99.0, 50.0, 1.0]},
     {"w": 30.0, "v": [7.0, 2.2, 9.8]},
     {"w": 30.0, "v": [33.3, 66.6, 99.9]}]}}
```

```json
{"type": "Sample",
 "data": {
   "entries": 123.0,
   "limit": 5,
   "values": [
     {"w": 23.0, "v": "five"},
     {"w": 20.0, "v": "four"},
     {"w": 20.0, "v": "one"},
     {"w": 30.0, "v": "three"},
     {"w": 30.0, "v": "two"}]}}
```

# Aliases: common compositions

Although the following could be constructed by hand, they are so often used in data analyses that they have their own constructors. They are not distinct types, though: an aggregator created by explicit construction is completely interchangeable with an aggregator created by one of the following convenience functions.

## Unweighted function

A function named `"unweighted"` exists in the Histogrammar namespace with the following definition:

```python
def unweighted(datum):
    return 1.0
```

## Histogram

```python
def Histogram(num, low, high, quantity, selection=unweighted):
    return Select.ing(selection, Bin.ing(num, low, high, quantity,
      Count.ing(), Count.ing(), Count.ing(), Count.ing()))
```
### Example: plotting a Histogram

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


## SparselyHistogram

```python
def SparselyHistogram(binWidth, quantity, selection=unweighted, origin=0.0):
    return Select.ing(selection, SparselyBin.ing(binWidth, quantity,
      Count.ing(), Count.ing(), origin))
```

## Profile

```python
def Profile(num, low, high, x, y, selection=unweighted):
    return Select.ing(selection, Bin.ing(num, low, high, x,
      Deviate.ing(y), Count.ing(), Count.ing(), Count.ing()))
```

## SparselyProfile

```python
def SparselyProfile(binWidth, x, y, selection=unweighted, origin=0.0):
    return Select.ing(selection, SparselyBin.ing(binWidth, x,
      Deviate.ing(y), Count.ing(), origin))
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
