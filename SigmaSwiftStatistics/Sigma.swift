import Foundation

/**

Collection of functions for statistical calculation.

Project home: https://github.com/evgenyneu/SigmaSwiftStatistics

*/
public struct Sigma {
  /**
  
  Calculates the maximum value in the array.

  - parameter values: Array of decimal numbers.
  - returns: The maximum value in the array. Returns nil for an empty array.

  Example:

      Sigma.max([3, 10, 6]) // 10
  
  */
  public static func max(_ values: [Double]) -> Double? {
    if let maxValue = values.max() {
      return maxValue
    }
    
    return nil
  }
  
  /**
  
  Calculates the mimimum value in the array.

  - parameter values: Array of decimal numbers.
  - returns: The mimimum value in the array. Returns nil for an empty array.
  
  Example:

      Sigma.min([5, 3, 10]) // -> 3

  */
  public static func min(_ values: [Double]) -> Double? {
    if let minValue = values.min() {
      return minValue
    }
    
    return nil
  }
  
  /**

  Computes the sum of array values.
  
  - parameter values: Array of decimal numbers.
  - returns: The sum of array values.

  Example:

      Sigma.sum([1, 3, 10]) // 14

  */
  public static func sum(_ values: [Double]) -> Double {
    return values.reduce(0, +)
  }
  
  /**
  
  Computes arithmetic mean of values in the array.
  
  http://en.wikipedia.org/wiki/Arithmetic_mean
  
  - parameter values: Array of decimal numbers.
  - returns: Arithmetic mean of values in the array. Returns nil for an empty array.

  Formula:

      A = Σ(x) / n
  
  Where n is the number of values.

  Example:

      Sigma.average([1, 12, 19.5, -5, 3, 8]) // 6.416666666666667

  */
  public static func average(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    return sum(values) / count
  }
  
  // MARK: - Protected functionality
  
  static func sort(_ values: [Double]) -> [Double] {
    return values.sorted { $0 < $1 }
  }
}
