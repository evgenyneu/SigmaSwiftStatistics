# σ (sigma) - statistics library written in Swift

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/SigmaSwiftStatistics.svg?style=flat)](http://cocoadocs.org/docsets/SigmaSwiftStatistics)
[![License](https://img.shields.io/cocoapods/l/SigmaSwiftStatistics.svg?style=flat)](http://cocoadocs.org/docsets/SigmaSwiftStatistics)
[![Platform](https://img.shields.io/cocoapods/p/SigmaSwiftStatistics.svg?style=flat)](http://cocoadocs.org/docsets/SigmaSwiftStatistics)

This library is a collection of functions that perform statistical calculations in Swift. It can be used in Swift apps for Apple devices and in open source Swift programs on other platforms.

* [average](#average--mean)
* [centralMoment](#central-moment)
* [covariancePopulation](#covariance-of-a-population)
* [covarianceSample](#covariance-of-a-sample)
* [coefficientOfVariationSample](#coefficient-of-variation-of-a-sample)
* [frequencies](#frequencies)
* [kurtosisA](#kurtosis-a)
* [kurtosisB](#kurtosis-b)
* [max](#max)
* [median](#median)
* [medianHigh](#median-high)
* [medianLow](#median-low)
* [min](#min)
* [normalDistribution](#normal-distribution)
* [normalDensity](#normal-density)
* [normalQuantile](#normal-quantile)
* [pearson](#pearson-correlation-coefficient)
* [percentile](#percentile)
* [quantiles](#quantiles)
* [rank](#rank)
* [skewnessA](#skewness-a)
* [skewnessB](#skewness-b)
* [standardDeviationPopulation](#standard-deviation-of-a-population)
* [standardDeviationSample](#standard-deviation-of-a-sample)
* [standardErrorOfTheMean](#standard-error-of-the-mean)
* [sum](#sum)
* [uniqueValues](#unique-values)
* [variancePopulation](#variance-of-a-population)
* [varianceSample](#variance-of-a-sample)

<img src='https://raw.githubusercontent.com/evgenyneu/SwiftStatistics/master/Graphics/logo.png' width='256' alt='Statistical library for Swift'>

## Setup

There are four ways you can add Sigma to your project.

**Add source (iOS 7+)**

Simply add [SigmaDistrib.swift](https://github.com/evgenyneu/SigmaSwiftStatistics/blob/master/Distrib/SigmaDistrib.swift) file to your project.

#### Setup with Carthage (iOS 8+)

Alternatively, add `github "evgenyneu/SigmaSwiftStatistics" ~> 9.0` to your Cartfile and run `carthage update`.

#### Setup with CocoaPods (iOS 8+)

If you are using CocoaPods add this text to your Podfile and run `pod install`.

    use_frameworks!
    target 'Your target name'
    pod 'SigmaSwiftStatistics', '~> 9.0'


#### Setup with Swift Package Manager

Add the following text to your Package.swift file and run `swift build`.

```Swift
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "MyApp",
    dependencies: [
        .package(url: "https://github.com/evgenyneu/SigmaSwiftStatistics.git", from: "9.0.0")
    ],
    targets: [
        .target(
            name: "MyApp",
            dependencies: ["SigmaSwiftStatistics"],
            path: "Sources")
    ]
)
```



### Legacy Swift versions

Setup a [previous version](https://github.com/evgenyneu/SigmaSwiftStatistics/wiki/Legacy-Swift-versions) of the library if you use an older version of Swift.


## Usage

Add `import SigmaSwiftStatistics` to your source code unless you used the file setup method.


### Average / mean

Computes [arithmetic mean](http://en.wikipedia.org/wiki/Arithmetic_mean) of values in the array.

**Note**:

  * Returns nil for an empty array.
  * Same as AVERAGE in Microsoft Excel and Google Docs Sheets.

#### Formula

> A = Σ(x) / n

Where:

  * *n* is the number of values.

```Swift
Sigma.average([1, 3, 8])
// Result: 4
```



### Central moment

Computes [central moment](https://en.wikipedia.org/wiki/Central_moment) of the dataset.

Note:

  * Returns nil for an empty array.
  * Same as in Wolfram Alpha and "moments" R package.

#### Formula

> Σ(x - m)^k / n

Where:

  * *m* is the sample mean.
  * *k* is the order of the moment (0, 1, 2, 3, ...).
  * *n* is the sample size.

```Swift
Sigma.centralMoment([3, -1, 1, 4.1, 4.1, 0.7], order: 3)
// Result: -1.5999259259
```



### Covariance of a population

Computes [covariance](http://en.wikipedia.org/wiki/Covariance) of the entire population
between two variables: x and y.

**Note**:

  * Returns nil if arrays x and y have different number of values.
  * Returns nil for empty arrays.
  * Same as COVAR and COVARIANCE.P functions in Microsoft Excel and COVAR in Google Docs Sheets.

#### Formula

> cov(x,y) = Σ(x - mx)(y - my) / n

Where:

  * *mx* is the population mean of the first variable.
  * *my* is the population mean of the second variable.
  * *n* is the total number of values.

```Swift
let x = [1, 2, 3.5, 3.7, 8, 12]
let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
Sigma.covariancePopulation(x: x, y: y)
// Result: 4.19166666666667
```



### Covariance of a sample

Computes [sample covariance](http://en.wikipedia.org/wiki/Sample_mean_and_sample_covariance) between two variables: x and y.

Note:

  * Returns nil if arrays x and y have different number of values.
  * Returns nil for empty arrays or arrays containing a single element.
  * Same as COVARIANCE.S function in Microsoft Excel.

#### Formula

> cov(x,y) = Σ(x - mx)(y - my) / (n - 1)

Where:

  * *mx* is the sample mean of the first variable.
  * *my* is the sample mean of the second variable.
  * *n* is the total number of values.

```Swift
let x = [1, 2, 3.5, 3.7, 8, 12]
let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
Sigma.covarianceSample(x: x, y: y)
// Result: 5.03
```


### Coefficient of variation of a sample

Computes [coefficient of variation](https://en.wikipedia.org/wiki/Coefficient_of_variation) based on a sample.


Note:

  * Returns nil when the array is empty or contains a single value.
  * Returns `Double.infinity` if the mean is zero.
  * Same as in Wolfram Alfa and in "raster" R package (expressed as a percentage in "raster").

#### Formula

> CV = s / m

Where:

  * *s* is the sample standard deviation.
  * *m* is the mean.

```Swift
Sigma.coefficientOfVariationSample([1, 12, 19.5, -5, 3, 8])
// Result: 1.3518226672
```


### Frequencies

Returns a dictionary with the keys containing the numbers from the input array and the values corresponding to the frequencies of those numbers.


```Swift
Sigma.frequencies([1, 2, 3, 4, 5, 4, 4, 3, 5])
// Result: [2:1, 3:2, 4:3, 5:2, 1:1]
```


### Kurtosis A

Returns the [kurtosis](https://en.wikipedia.org/wiki/Kurtosis) of a series of numbers.

**Note**:

  * Returns nil if the dataset contains less than 4 values.
  * Returns nil if all the values in the dataset are the same.
  * Same as KURT in Microsoft Excel and Google Docs Sheets.

#### Formula


<img src='https://github.com/evgenyneu/SigmaSwiftStatistics/raw/master/Graphics/formulas/kurtosis_a.png' width='480' alt='Kurtosis formula'>


```Swift
Sigma.kurtosisA([2, 1, 3, 4.1, 19, 1.5])
// Result: 5.4570693277
```




### Kurtosis B

Returns the [kurtosis](https://en.wikipedia.org/wiki/Kurtosis) of a series of numbers.

**Note**:

  * Returns nil if the dataset contains less than 2 values.
  * Returns nil if all the values in the dataset are the same.
  * Same as in Wolfram Alpha and "moments" R package.

#### Formula


<img src='https://github.com/evgenyneu/SigmaSwiftStatistics/raw/master/Graphics/formulas/kurtosis_b.png' width='550' alt='Kurtosis formula'>


```Swift
Sigma.kurtosisB([2, 1, 3, 4.1, 19, 1.5])
// Result: 4.0138523409
```




### Max

Returns the maximum value in the array.

**Note**: returns nil for an empty array.

```Swift
Sigma.max([1, 8, 3])
// Result: 8
```


### Median

Returns the [median value](http://en.wikipedia.org/wiki/Median) from the array.

**Note**:

 * Returns nil when the array is empty.
 * Returns the mean of the two middle values if there is an even number of items in the array.
 * Same as MEDIAN in Microsoft Excel and Google Docs Sheets.

```Swift
Sigma.median([1, 12, 19.5, 3, -5])
// Result: 3
```


### Median high

Returns the [median value](http://en.wikipedia.org/wiki/Median) from the array.

**Note**:

* Returns nil when the array is empty.
* Returns the higher of the two middle values if there is an even number of items in the array.

```Swift
Sigma.medianHigh([1, 12, 19.5, 10, 3, -5])
// Result: 10
```



### Median low

Returns the [median value](http://en.wikipedia.org/wiki/Median) from the array.

**Note**:

* Returns nil when the array is empty.
* Returns the lower of the two middle values if there is an even number of items in the array.

```Swift
Sigma.medianLow([1, 12, 19.5, 10, 3, -5])
// Result: 3
```


### Min

Returns the minimum value in the array.

**Note**: returns nil for an empty array.

```Swift
Sigma.min([7, 2, 3])
// Result: 2
```



### Normal distribution

Returns the [normal distribution](https://en.wikipedia.org/wiki/Normal_distribution) for the given values of `x`, `μ` and `σ`. The returned value is the area under the normal curve to the left of the value `x`.

**Note**:

  * Returns nil if σ is zero or negative.
  * Defaults: `μ = 0`, `σ = 1`.
  * Same as NORM.S.DIST, NORM.DIST and NORMDIST Excel functions and NORMDIST function in Google Docs sheet with `cumulative` argument equal to `true`.

```Swift
Sigma.normalDistribution(x: -1, μ: 0, σ: 1)
// Result: 0.1586552539314570
```


### Normal density

Returns density of the [normal function](https://en.wikipedia.org/wiki/Normal_distribution) for the given values of `x`, `μ` and `σ`.

**Note**:

  * Returns nil if σ is zero or negative.
  * Defaults: `μ = 0`, `σ = 1`.
  * Same as NORM.S.DIST, NORM.DIST and NORMDIST Excel functions and NORMDIST function in Google Docs sheet with `cumulative` argument equal to `false`.


#### Formula

<img src='https://github.com/evgenyneu/SigmaSwiftStatistics/raw/master/Graphics/formulas/normal_density.png' width='150' alt='Nodemal density function'>

Where:

  * *x* is the input value of the normal density function.
  * *μ* is the mean.
  * *σ* is the standard deviation.


```Swift
Sigma.normalDensity(x: 0, μ: 0, σ: 1)
// Result: 0.3989422804014327
```


### Normal quantile

Returns the quantile function for the [normal distribution](https://en.wikipedia.org/wiki/Normal_distribution) (the inverse of normal distribution). The `p` argument is the probability, or the area under the normal curve to the left of the returned value.

**Note**:

  * Returns nil if σ is zero or negative.
  * Returns nil if p is negative or greater than one.
  * Returns `-Double.infinity` if p is zero, and `Double.infinity` if p is one.
  * Defaults: `μ = 0`, `σ = 1`.
  * Same as NORM.INV, NORM.S.INV and NORMINV Excel functions and NORMINV, NORMSINV Google Docs sheet functions.

```Swift
Sigma.normalQuantile(p: 0.025, μ: 0, σ: 1)
// -1.9599639845400538
```



### Pearson correlation coefficient

Calculates the
[Pearson product-moment correlation coefficient](http://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient)
between two variables: x and y.

**Note**:

  * Returns nil if arrays x and y have different number of values.
  * Returns nil for empty arrays.
  * Same as CORREL and PEARSON functions in Microsoft Excel and Google Docs Sheets.

#### Formula

> p(x,y) = cov(x,y) / (σx * σy)

Where:

  * *cov* is the population covariance.
  * *σ* is the population standard deviation.

```Swift
let x = [1, 2, 3.5, 3.7, 8, 12]
let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
Sigma.pearson(x: x, y: y)
// Result: 0.843760859352745
```



### Percentile

Calculates the [Percentile value](https://en.wikipedia.org/wiki/Percentile) for the given dataset.

**Note**:

 * Returns nil when the `values` array is empty.
 * Returns nil when supplied `percentile` parameter is negative or greater than 1.
 * Same as PERCENTILE or PERCENTILE.INC in Microsoft Excel and PERCENTILE in Google Docs Sheets.
 * Same as the 7th sample quantile method from the [Hyndman and Fan paper (1996)](https://www.jstor.org/stable/2684934).

See the [Percentile method](https://github.com/evgenyneu/SigmaSwiftStatistics/wiki/Percentile-1-method) documentation for more information.

```Swift
// Calculate 40th percentile
Sigma.percentile([35, 20, 50, 40, 15], percentile: 0.4)
// Result: 29

// Same as
Sigma.quantiles.method7([35, 20, 50, 40, 15], probability: 0.4)
```

### Quantiles

Collection of nine functions that calculate [sample quantiles](https://en.wikipedia.org/wiki/Quantile) corresponding to the given probability. This is an implementation of the nine algorithms described in the [Hyndman and Fan paper (1996)](https://www.jstor.org/stable/2684934). The documentation of the functions is based on [R](http://stat.ethz.ch/R-manual/R-devel/library/stats/html/quantile.html) and [Wikipedia](https://en.wikipedia.org/wiki/Quantile).

**Note**:

  * Returns nil if the dataset is empty.
  * Returns nil if the probability is outside the [0, 1] range.
  * Same as `quantile` function in R.


#### Quantile method 1

This method calculates quantiles using the inverse of the empirical distribution function.

```Swift
Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], probability: 0.5)
// Result: 3
```

#### Quantile method 2

This method uses inverted empirical distribution function with averaging.

```Swift
Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], probability: 0.5)
// Result: 5.5
```

#### Quantile method 3

```Swift
Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], probability: 0.5)
// Result: 3
```

#### Quantile method 4

The method uses linear interpolation of the empirical distribution function.

```Swift
Sigma.quantiles.method4([1, 12, 19.5, -5, 3, 8], probability: 0.17)
// Result: -4.88
```

#### Quantile method 5

This method uses a piecewise linear function where the knots are the values midway through the steps of the empirical distribution function.

```Swift
Sigma.quantiles.method5([1, 12, 19.5, -5, 3, 8], probability: 0.11)
// Result: -4.04
```

#### Quantile method 6

This method is implemented in Microsoft Excel (PERCENTILE.EXC), Minitab and SPSS. It uses linear interpolation of the expectations for the order statistics for the uniform distribution on [0,1].

```Swift
Sigma.quantiles.method6([1, 12, 19.5, -5, 3, 8], probability: 0.1999)
// Result: -2.6042
```

#### Quantile method 7

This method is implemented in S, Microsoft Excel (PERCENTILE or PERCENTILE.INC) and Google Docs Sheets (PERCENTILE). It uses linear interpolation of the modes for the order statistics for the uniform distribution on [0, 1].

```Swift
Sigma.quantiles.method7([1, 12, 19.5, -5, 3, 8], probability: 0.00001)
// Result: -4.9997
```

#### Quantile method 8

The quantiles returned by the method are approximately median-unbiased regardless of the distribution of x.

```Swift
Sigma.quantiles.method8([1, 12, 19.5, -5, 3, 8], probability: 0.11)
// Result: -4.82
```

#### Quantile method 9

The quantiles returned by this method are approximately unbiased for the expected order statistics if x is normally distributed.

```Swift
Sigma.quantiles.method9([1, 12, 19.5, -5, 3, 8], probability: 0.10001)
// Result: -4.999625
```


### Rank

Returns the [ranks](https://en.wikipedia.org/wiki/Ranking) of the values in the dataset.

**Note**:

  * Receives an optional `ties` parameter that determines how the ranks for the equal values ('ties') are calculated. Default value is `.average`. Possible values:

    * `.average`: uses the average rank. Same as RANK.AVG in Microsoft Excel and Google Docs Sheets.
    * `.min`, `.max`: uses the minimum/maximum rank. The value `.min` is the same as RANK and RANK.EQ in Microsoft Excel and Google Docs Sheets.
    * `.first`, `.last`: the ranks are incremented/decremented.

  * Same as rank function in R.


```Swift
Sigma.rank([2, 3, 6, 5, 3], ties: .average)
// Result: [1.0, 2.5, 5.0, 4.0, 2.5]
```



### Skewness A

Returns the [skewness](https://en.wikipedia.org/wiki/Skewness) of the dataset.

**Note**:

  * Returns nil if the dataset contains less than 3 values.
  * Returns nil if all the values in the dataset are the same.
  * Same as SKEW in Microsoft Excel and Google Docs Sheets.

#### Formula


<img src='https://github.com/evgenyneu/SigmaSwiftStatistics/raw/master/Graphics/formulas/skewness_a.png' width='450' alt='Skewness formula'>


```Swift
Sigma.skewnessA([4, 2.1, 8, 21, 1])
// Result: 1.6994131524
```



### Skewness B

Returns the [skewness](https://en.wikipedia.org/wiki/Skewness) of the dataset.

**Note**:

  * Returns nil if the dataset contains less than 3 values.
  * Returns nil if all the values in the dataset are the same.
  * Same as in Wolfram Alpha, SKEW.P in Microsoft Excel and `skewness` function in "moments" R package.

#### Formula


<img src='https://github.com/evgenyneu/SigmaSwiftStatistics/raw/master/Graphics/formulas/skewness_b.png' width='450' alt='Skewness formula'>


```Swift
Sigma.skewnessB([4, 2.1, 8, 21, 1])
// Result: 1.1400009992
```



### Standard deviation of a population

Computes [standard deviation](http://en.wikipedia.org/wiki/Standard_deviation) of entire population.

**Note**:

  * Returns nil for an empty array.
  * Same as STDEVP and STDEV.P in Microsoft Excel and STDEVP in Google Docs Sheets.

#### Formula

>  σ = sqrt( Σ( (x - m)^2 ) / n )

Where:

  * *m* is the population mean.
  * *n* is the population size.

```Swift
Sigma.standardDeviationPopulation([1, 12, 19.5, -5, 3, 8])
// Result: 7.918420858282849
```



### Standard deviation of a sample

Computes [standard deviation](http://en.wikipedia.org/wiki/Standard_deviation) based on a sample.

**Note**:

  * Returns nil when the array is empty or contains a single value.
  * Same as STDEV and STDEV.S in Microsoft Excel and STDEV in Google Docs Sheets.

#### Formula

>  s = sqrt( Σ( (x - m)^2 ) / (n - 1) )

Where:

  * *m* is the sample mean.
  * *n* is the sample size.

```Swift
Sigma.standardDeviationSample([1, 12, 19.5, -5, 3, 8])
// Result: 8.674195447801869
```


### Standard error of the mean

Computes [standard error](http://en.wikipedia.org/wiki/Standard_error) of the mean.

**Note**:

  * Returns nil when the array is empty or contains a single value.

#### Formula

>  SE = s / sqrt(n)

Where:

  * *s* is the sample standard deviation.
  * *n* is the sample size.

```Swift
Sigma.standardErrorOfTheMean([1, 12, 19.5, -5, 3, 8])
// Result: 3.5412254627
```



### Sum

Computes sum of values from the array.

```Swift
Sigma.sum([1, 3, 8])
// Result: 12
```


### Unique values

Returns an unsorted array containing all values that occur within the input array without the duplicates.


```Swift
Sigma.uniqueValues([2, 1, 3, 4, 5, 4, 3, 5])
// Result: [2, 3, 4, 5, 1]
```


### Variance of a population

Computes [variance](http://en.wikipedia.org/wiki/Variance) of entire population.

**Note**:

  * Returns nil when the array is empty.
  * Same as VAR.P or VARPA in Microsoft Excel and VARP or VARPA in Google Docs Sheets.

#### Formula

>  σ^2 = Σ( (x - m)^2 ) / n

Where:

  * *m* is the population mean.
  * *n* is the population size.

```Swift
Sigma.variancePopulation([1, 12, 19.5, -5, 3, 8])
// Result: 62.70138889
```


### Variance of a sample

Computes [variance](http://en.wikipedia.org/wiki/Variance) based on a sample.

**Note**:

  * Returns nil when the array is empty or contains a single value.
  * Same as VAR, VAR.S or VARA in Microsoft Excel and VAR or VARA in Google Docs Sheets.

#### Formula

>  s^2 = Σ( (x - m)^2 ) / (n - 1)

Where:

  * *m* is the sample mean.
  * *n* is the sample size.

```Swift
Sigma.varianceSample([1, 12, 19.5, -5, 3, 8])
// Result: 75.24166667
```




## Feedback is welcome

If you need help or want to extend the library feel free to create an issue or submit a pull request.

> Help will always be given at Hogwarts to those who ask for it.

-- J.K. Rowling, Harry Potter


## Contributors

* [John Clema](https://github.com/JohnClema)
* [Thomas Fankhauser](https://github.com/southdesign)
* [Alan J. Salmoni](https://github.com/salmoni)


## License

Sigma is released under the [MIT License](LICENSE).
