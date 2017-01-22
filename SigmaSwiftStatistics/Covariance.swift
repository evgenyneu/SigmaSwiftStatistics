import Foundation

public extension Sigma {
  /**

  Computes covariance of a sample between two variables: x and y.

  http://en.wikipedia.org/wiki/Sample_mean_and_sample_covariance

  - parameter x: Array of decimal numbers for the first variable.
  - parameter y: Array of decimal numbers for the second variable.
  - returns: Covariance of a sample between two variables: x and y. Returns nil if arrays x and y have different number of values. Returns nil for empty arrays or arrays containing a single element.

  Formula:

      cov(x,y) = Σ(x - mx)(y - my) / (n - 1)

  Where:

  mx is the sample mean of the first variable.

  my is the sample mean of the second variable.

  n is the total number of values.

  Example:

      let x = [1, 2, 3.5, 3.7, 8, 12]
      let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
      Sigma.covarianceSample(x: x, y: y) // 5.03

  */
  public static func covarianceSample(x: [Double], y: [Double]) -> Double? {
    let xCount = Double(x.count)
    let yCount = Double(y.count)
    
    if xCount < 2 { return nil }
    if xCount != yCount { return nil }
    
    if let xMean = average(x),
      let yMean = average(y) {
      
      var sum:Double = 0
      
      for (index, xElement) in x.enumerated() {
        let yElement = y[index]
        
        sum += (xElement - xMean) * (yElement - yMean)
      }
      
      return sum / (xCount - 1)
    }
    
    return nil
  }
  
  /**
   
   Computes covariance for entire population between two variables: x and y.
   
   http://en.wikipedia.org/wiki/Covariance
   
   - parameter x: Array of decimal numbers for the first variable.
   - parameter y: Array of decimal numbers for the second variable.
   - returns: Covariance for entire population between two variables: x and y. Returns nil if arrays x and y have different number of values. Returns nil for empty arrays.
   
   Formula:
   
       cov(x,y) = Σ(x - mx)(y - my) / n
   
   Where:
   
   mx is the population mean of the first variable.
   
   my is the population mean of the second variable.
   
   n is the total number of values.
   
   Example:
   
       let x = [1, 2, 3.5, 3.7, 8, 12]
       let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
       Sigma.covariancePopulation(x: x, y: y) // 4.19166666666667
   
   */
  public static func covariancePopulation(x: [Double], y: [Double]) -> Double? {
    let xCount = Double(x.count)
    let yCount = Double(y.count)
    
    if xCount == 0 { return nil }
    if xCount != yCount { return nil }
    
    if let xMean = average(x),
      let yMean = average(y) {
      
      var sum:Double = 0
      
      for (index, xElement) in x.enumerated() {
        let yElement = y[index]
        
        sum += (xElement - xMean) * (yElement - yMean)
      }
      
      return sum / xCount
    }
    
    return nil
  }
}
