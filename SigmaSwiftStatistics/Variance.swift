import Foundation

public extension Sigma {
  /**
   
   Computes variance based on a sample.
   
   http://en.wikipedia.org/wiki/Variance
   
   - parameter values: Array of decimal numbers.
   - returns: Variance based on a sample. Returns nil when the array is empty or contains a single value.
   
   Formula:
   
   s^2 = Σ( (x - m)^2 ) / (n - 1)
   
   Where:
   
   m is the sample mean.
   
   n is the sample size.
   
   Example:
   
   Sigma.varianceSample([1, 12, 19.5, -5, 3, 8]) // 75.24166667
   
   */
  static func varianceSample(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count < 2 { return nil }
    
    if let avgerageValue = average(values) {
      let numerator = values.reduce(0) { total, value in
        total + pow(avgerageValue - value, 2)
      }
      
      return numerator / (count - 1)
    }
    
    return nil
  }
  
  /**
   
   Computes variance of entire population.
   
   http://en.wikipedia.org/wiki/Variance
   
   - parameter values: Array of decimal numbers.
   - returns: Population variance. Returns nil when the array is empty.
   
   Formula:
   
   σ^2 = Σ( (x - m)^2 ) / n
   
   Where:
   
   m is the population mean.
   
   n is the population size.
   
   Example:
   
   Sigma.variancePopulation([1, 12, 19.5, -5, 3, 8]) // 62.70138889
   
   */
  static func variancePopulation(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    
    if let avgerageValue = average(values) {
      let numerator = values.reduce(0) { total, value in
        total + pow(avgerageValue - value, 2)
      }
      
      return numerator / count
    }
    
    return nil
  }
}
