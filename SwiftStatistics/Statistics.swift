//
// Collection of functions for statistical calculation.
//

import Foundation

public struct Statistics {
  //
  // Computes arithmetic mean of values in the array.
  //
  // Wikipedia: http://en.wikipedia.org/wiki/Arithmetic_mean
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
  //  σ.mean([1, 12, 19.5, -5, 3, 8]) // 6.416666666666667
  //
  public static func mean(values: [Double]) -> Double {
    let count = Double(values.count)
    if count == 0 { return 0 }
    return values.reduce(0, combine: +) / count
  }
  
  //
  // Computes standard deviation of a population sample.
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
  //
  // Example
  // -------
  //
  //   σ.sampleStandardDeviation([1, 12, 19.5, -5, 3, 8]) // 8.67419544780187
  //
  public static func sampleStandardDeviation(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count < 2 { return nil }
    
    let avgerageValue = mean(values)
    
    let numerator = values.reduce(0) { total, value in
      total + pow(avgerageValue - value, 2)
    }
    
    return sqrt(numerator / (count - 1))
  }
  
  //
  // Computes standard deviation of entire population.
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
  //
  // Example
  // -------
  //
  //   σ.standardDeviation([1, 12, 19.5, -5, 3, 8]) // 8.67419544780187
  //
  public static func populationStandardDeviation(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    
    let avgerageValue = mean(values)
    
    let numerator = values.reduce(0) { total, value in
      total + pow(avgerageValue - value, 2)
    }
    
    return sqrt(numerator / count)
  }
}

typealias σ = Statistics