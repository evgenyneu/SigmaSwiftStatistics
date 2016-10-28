import Foundation

public extension Sigma {
  /**
   
   Computes standard deviation based on a sample.
   
   http://en.wikipedia.org/wiki/Standard_deviation
   
   - parameter values: Array of decimal numbers.
   - returns: Standard deviation of a sample. Returns nil when the array is empty or contains a single value.
   
   Formula:
   
   s = sqrt( Σ( (x - m)^2 ) / (n - 1) )
   
   Where:
   
   m is the sample mean.
   
   n is the sample size.
   
   Example:
   
   Sigma.standardDeviationSample([1, 12, 19.5, -5, 3, 8]) // 8.674195447801869
   
   */
  public static func standardDeviationSample(_ values: [Double]) -> Double? {
    if let varianceSample = varianceSample(values) {
      return sqrt(varianceSample)
    }
    
    return nil
  }
  
  /**
   
   Computes standard deviation of entire population.
   
   http://en.wikipedia.org/wiki/Standard_deviation
   
   - parameter values: Array of decimal numbers.
   - returns: Standard deviation of entire population. Returns nil for an empty array.
   
   Formula:
   
   σ = sqrt( Σ( (x - m)^2 ) / n )
   
   Where:
   
   m is the population mean.
   
   n is the population size.
   
   Example:
   
   Sigma.standardDeviationPopulation([1, 12, 19.5, -5, 3, 8]) // 8.67419544780187
   
   */
  public static func standardDeviationPopulation(_ values: [Double]) -> Double? {
    if let variancePopulation = variancePopulation(values) {
      return sqrt(variancePopulation)
    }
    
    return nil
  }
}
