<img src='https://raw.githubusercontent.com/evgenyneu/SwiftStatistics/master/Graphics/logo.png' width='256' alt='Statistical library for Swift'>

# σ (sigma) - statistics library for Swift

This library is a collection of functions that perform statistical calculations in Swift.

## Setup

Simply add [Statistics.swift](https://github.com/evgenyneu/SwiftStatistics/blob/master/SwiftStatistics/Statistics.swift) file to your project.

### Setup with Carthage

Alternatively, you can set it up with Carthage. Add the following line to your Cartfile.

```
github "evgenyneu/SwiftStatistics" ~> 1.0
```

## Usage

### Max

Returns the maximum value in the array. Returns nil for an empty array.

```Swift
Statistics.max([1, 8, 3])
// Result: 8
```

### Min

Returns the minimum value in the array. Returns nil for an empty array.

```Swift
Statistics.min([7, 2, 3])
// Result: 2
```

### Sum

Computes sun of values from the array.

```Swift
Statistics.sum([1, 3, 8])
// Result: 12
```

### Mean

Computes arithmetic mean of values in the array.

```Swift
Statistics.mean([1, 3, 8])
// Result: 4
```

### Sample standard deviation

Computes standard deviation of a population sample.
Returns nil if the argument is an empty array or an array containing a single value.

```Swift
Statistics.sampleStandardDeviation([1, 12, 19.5, -5, 3, 8])
// Result: 8.674195447801869
```

### Population standard deviation

Computes standard deviation of entire population. Returns nil if the argument is an empty array.

```Swift
Statistics.populationStandardDeviation([1, 12, 19.5, -5, 3, 8])
// Result: 7.918420858282849
```

### Shorter syntax

You can type a sigma letter `σ` instead of `Statistics`. For example:

```
σ.mean([1, 2])
σ.sampleStandardDeviation([1, 2])
```

## Feedback is welcome

If you need help or want to extend the library feel free to create an issue or submit a pull request.
