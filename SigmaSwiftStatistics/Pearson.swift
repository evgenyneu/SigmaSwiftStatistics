import Foundation

public extension Sigma {
  /**

  Calculates the Pearson product-moment correlation coefficient between two variables: x and y.

  http://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient

  - parameter x: Array of decimal numbers for the first variable.
  - parameter y: Array of decimal numbers for the second variable.
  - returns: The Pearson product-moment correlation coefficient between two variables: x and y. Returns nil if arrays x and y have different number of values. Returns nil for empty arrays.

  Formula:

      p(x,y) = cov(x,y) / (σx * σy)

  Where:

  cov is the population covariance.

  σx is the population standard deviation of x.

  Example:

      let x = [1, 2, 3.5, 3.7, 8, 12]
      let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
      Sigma.pearson(x: x, y: y) // 0.843760859352745

  */
  public static func pearson(x: [Double], y: [Double]) -> Double? {
    if let cov = Sigma.covariancePopulation(x: x, y: y),
      let σx = Sigma.standardDeviationPopulation(x),
      let σy = Sigma.standardDeviationPopulation(y) {
      
      if σx == 0 || σy == 0 { return nil }
      
      return cov / (σx * σy)
    }
    
    return nil
  }
}
