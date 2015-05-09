# Statistics library for Swift

This library is a collection of functions that perform statistical calculations:

## Setup

Copy [Statistics.swift](https://github.com/evgenyneu/SwiftStatistics/blob/master/SwiftStatistics/Statistics.swift) file to your project.

### Setup with Carthage

Alternatively, you can set it up with Carthage. Add the following line to your Cartfile.

```
github "evgenyneu/SwiftStatistics" ~> 1.0
```

## Usage

### Average

```Swift
Statistics.average([1, 12, 19.5, -5, 3, 8])
// Result: 6.416666666666667
```

### Standard deviation

```Swift
Statistics.standardDeviation([1, 12, 19.5, -5, 3, 8])
// Result: 7.918420858282849
```
