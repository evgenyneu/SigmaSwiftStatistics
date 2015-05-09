//
// Collection of functions for statistical calculation.
//

import Foundation

public struct Statistics {
  //
  // Returns the maximum value in the array.
  //
  // Note: returns nil for an empty array.
  //
  // Example
  // -------
  //
  //  Statistics.max([3, 10, 6]) // 10
  //
  public static func max(values: [Double]) -> Double? {
    if values.isEmpty { return nil }
    return maxElement(values)
  }
  
  //
  // Returns the mimimum value in the array.
  //
  // Note: returns nil for an empty array.
  //
  // Example
  // -------
  //
  //  Statistics.min([5, 3, 10]) // 3
  //
  public static func min(values: [Double]) -> Double? {
    if values.isEmpty { return nil }
    return minElement(values)
  }
  
  //
  // Computes the sum of array values
  //
  // Example
  // -------
  //
  //  Statistics.sum([1, 3, 10]) // 14
  //
  public static func sum(values: [Double]) -> Double {
    return values.reduce(0, combine: +)
  }
  
  //
  // Computes arithmetic mean of values in the array.
  //
  // Note: returns nil for an empty array.
  //
  // http://en.wikipedia.org/wiki/Arithmetic_mean
  //
  // Formula
  // -------
  //
  //   A = Σ(x) / n
  //
  //   Where:
  //
  //     n is the number of values.
  //
  // Example
  // -------
  //
  //  Statistics.mean([1, 12, 19.5, -5, 3, 8]) // 6.416666666666667
  //
  public static func mean(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    return sum(values) / count
  }
  
  //
  // Returns the center value from the array after it is sorted.
  //
  // Note:
  //
  //   - Returns nil for an empty array.
  //   - Returns the mean of the two middle values if there is an even number of items in the array.
  //
  // http://en.wikipedia.org/wiki/Median
  //
  // Example
  // -------
  //
  //  Statistics.median([1, 12, 19.5, 3, -5]) // 3
  //
  public static func median(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    let sorted = values.sorted { $0 < $1 }
    
    if count % 2 == 0 {
      // Event number of items - return the mean of two middle values
      let leftIndex = Int(count / 2 - 1)
      let leftValue = sorted[leftIndex]
      let rightValue = sorted[leftIndex + 1]
      return (leftValue + rightValue) / 2
    } else {
      // Odd number of items - take the middle item.
      return sorted[Int(count / 2)]
    }
  }
  
  //
  // Computes standard deviation of a population sample.
  //
  // Note: returns nil when the array is empty or contains a single value.
  //
  // http://en.wikipedia.org/wiki/Standard_deviation
  //
  // Formula
  // -------
  // 
  //   s = sqrt( Σ(x - m) / (n - 1) )
  //
  //   Where:
  //
  //     m is the sample mean.
  //     n is the sample size.
  //
  // Example
  // -------
  //
  //   Statistics.standardDeviation.sampleStandardDeviation([1, 12, 19.5, -5, 3, 8]) // 8.674195447801869
  //
  public static func sampleStandardDeviation(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count < 2 { return nil }
    
    if let avgerageValue = mean(values) {
      let numerator = values.reduce(0) { total, value in
        total + pow(avgerageValue - value, 2)
      }
      
      return sqrt(numerator / (count - 1))
    }
    
    return nil
  }
  
  //
  // Computes standard deviation of entire population.
  //
  // Note: returns nil for an empty array.
  //
  // http://en.wikipedia.org/wiki/Standard_deviation
  //
  // Formula
  // -------
  //
  //   σ = sqrt( Σ(x - m) / n )
  //
  //   Where:
  //
  //     m is the population mean.
  //     n is the population size.
  //
  // Example
  // -------
  //
  //   Statistics.standardDeviation([1, 12, 19.5, -5, 3, 8]) // 8.67419544780187
  //
  public static func populationStandardDeviation(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    
    if let avgerageValue = mean(values) {
      let numerator = values.reduce(0) { total, value in
        total + pow(avgerageValue - value, 2)
      }
      
      return sqrt(numerator / count)
    }
  
    return nil
  }
  
  //
  // Computes covariance between two variables: x and y.
  //
  // Note:
  //
  //   * Returns nil if arrays x and y have different number of values.
  //   * Returns nil for empty arrays.
  //
  // http://en.wikipedia.org/wiki/Covariance
  //
  // Formula
  // -------
  //
  //   cov(x,y) = Σ(x - mx)(y - my) / n
  //
  //   Where:
  //
  //     x is the value of the first variable.
  //     mx is the population mean of the first variable.
  //     y is the value of the second variable.
  //     my is the population mean of the second variable.
  //     n is the total number of values.
  //
  // Example
  // -------
  //
  //   let x = [1, 2, 3.5, 3.7, 8, 12]
  //   let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
  //   Statistics.standardDeviation(x: x, y: y) // 4.19166666666667
  //
  public static func populationCovariance(#x: [Double], y: [Double]) -> Double? {
    let xCount = Double(x.count)
    let yCount = Double(y.count)

    if xCount == 0 { return nil }
    if xCount != yCount { return nil }
    
    if let xMean = mean(x),
      yMean = mean(y) {
      
      var sum:Double = 0
  
      for (index, xElement) in enumerate(x) {
        let yElement = y[index]
        
        sum += (xElement - xMean) * (yElement - yMean)
      }
        
      return sum / xCount
    }
    
    return nil
  }
}

typealias σ = Statistics