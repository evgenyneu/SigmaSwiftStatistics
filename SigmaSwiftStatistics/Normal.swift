import Foundation

public extension Sigma {
  
  /**
   
   Returns the normal distribution for the given values of x, μ and σ. The returned value is the area under the normal curve to the left of the value x.
   
   https://en.wikipedia.org/wiki/Normal_distribution
   
   - parameter x: The input value.
   
   - parameter μ: The mean. Default: 0.
   
   - parameter σ: The standard deviation. Default: 1.
   
   - returns: The value of the normal distribution. The returned value is the area under the normal curve to the left of the value x. Returns nil if σ is zero or negative.
   
   
   Example:
   
       Sigma.normalDistribution(x: -1, μ: 10, σ: 1) // 0.1586552539314570
   
   */
  public static func normalDistribution(x: Double, μ: Double = 0, σ: Double = 1) -> Double? {
    if σ <= 0 { return nil }
    let z = (x - μ) / σ
    return  0.5 * erfc(-z * M_SQRT1_2)
  }
  
  
  /**

  Returns the value of the normal density function.

  https://en.wikipedia.org/wiki/Normal_distribution

  - parameter x: The input value of the normal density function.

  - parameter μ: The mean. Default: 0.

  - parameter σ: The standard deviation. Default: 1.

  - returns: The value of the normal density function. Returns nil if σ is zero or negative.

  Formula (LaTeX):

      \frac{1}{\sqrt{2 \sigma^2 \pi}} e^{ - \frac{(x - \mu)^2}{2 \sigma^2} }

  Where:

  x is the input value of the normal density function.

  μ is the mean.

  σ is the standard deviation.


  Example:

      Sigma.normalDensity(x: 13.92, μ: 12.4, σ: 3.21) // 0.1111004887053895

  */
  public static func normalDensity(x: Double, μ: Double = 0, σ: Double = 1) -> Double?  {
    if σ <= 0 { return nil }
    return (1 / sqrt(2 * pow(σ,2) * M_PI)) * pow(M_E, (-( pow(x - μ, 2) / (2 * pow(σ, 2)) )))
  }
}
