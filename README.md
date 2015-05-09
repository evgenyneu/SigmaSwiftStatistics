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

### Shorter syntax

You can type a sigma letter `σ` instead of `Statistics`. For example:

```
σ.average([1, 2])
σ.standardDeviation([1, 2])
```
