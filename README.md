# σ (sigma) - statistics library for Swift

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)][carthage]
[![CocoaPods Version](https://img.shields.io/cocoapods/v/SigmaSwiftStatistics.svg?style=flat)][cocoadocs]
[![License](https://img.shields.io/cocoapods/l/SigmaSwiftStatistics.svg?style=flat)][cocoadocs]
[![Platform](https://img.shields.io/cocoapods/p/SigmaSwiftStatistics.svg?style=flat)][cocoadocs]
[cocoadocs]: http://cocoadocs.org/docsets/SigmaSwiftStatistics
[carthage]: https://github.com/Carthage/Carthage

This library is a collection of functions that perform statistical calculations in Swift.

<img src='https://raw.githubusercontent.com/evgenyneu/SwiftStatistics/master/Graphics/logo.png' width='256' alt='Statistical library for Swift'>

## Setup

There are three ways you can add SigmaSwiftStatistics to your Xcode project.

**Add source (iOS 7+)**

Simply add [Sigma.swift](https://github.com/evgenyneu/SwiftStatistics/blob/master/SwiftStatistics/Sigma.swift) file to your project.

**Setup with Carthage (iOS 8+)**

Alternatively, add `github "evgenyneu/SigmaSwiftStatistics" ~> 1.0` to your Cartfile and run `carthage update`.

**Setup with CocoaPods (iOS 8+)**

If you are using CocoaPods add this text to your Podfile and run `pod install`.

    use_frameworks!
    pod 'SigmaSwiftStatistics', '~> 1.0'

## Usage

Add `import SigmaSwiftStatistics` to your source code if you used Carthage or CocoaPods setup methods.

### Max

Returns the maximum value in the array.

**Note**: returns nil for an empty array.

```Swift
Sigma.max([1, 8, 3])
// Result: 8
```

### Min

Returns the minimum value in the array.

**Note**: returns nil for an empty array.

```Swift
Sigma.min([7, 2, 3])
// Result: 2
```

### Sum

Computes sum of values from the array.

```Swift
Sigma.sum([1, 3, 8])
// Result: 12
```

### Average

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

### Sample standard deviation

Computes [standard deviation](http://en.wikipedia.org/wiki/Standard_deviation) of a population sample.

**Note**:

  * Returns nil when the array is empty or contains a single value.
  * Same as STDEV and STDEV.S in Microsoft Excel and STDEV in Google Docs Sheets.

#### Formula

>  σ = sqrt( Σ(x - m) / (n - 1) )

Where:

  * *m* is the population mean.
  * *n* is the population size.

```Swift
Sigma.standardDeviationSample([1, 12, 19.5, -5, 3, 8])
// Result: 8.674195447801869
```

### Population standard deviation

Computes [standard deviation](http://en.wikipedia.org/wiki/Standard_deviation) of entire population.

**Note**:

  * Returns nil for an empty array.
  * Same as STDEVP and STDEV.P in Microsoft Excel and STDEVP in Google Docs Sheets.

#### Formula

>  σ = sqrt( Σ(x - m) / n )

Where:

  * *m* is the population mean.
  * *n* is the population size.

```Swift
Sigma.standardDeviationPopulation([1, 12, 19.5, -5, 3, 8])
// Result: 7.918420858282849
```

### Sample covariance

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

### Population covariance

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

### Pearson correlation coefficient

Calculates the
[Pearson product-moment correlation coefficient](http://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient)
between two variables: x and y.

**Note**:

  * Returns nil if arrays x and y have different number of values.
  * Returns nil for empty arrays.
  * Same as CORREL and PERSON functions in Microsoft Excel and Google Docs Sheets.

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

## Shorter syntax

You can type a sigma letter `σ` instead of `Statistics`. For example:

```
σ.average([1, 2])
σ.standardDeviationSample([1, 12, 19.5, -5, 3, 8])
```

## Feedback is welcome

If you need help or want to extend the library feel free to create an issue or submit a pull request.

## License

SigmaSwiftStatistics is released under the [MIT License](LICENSE).
