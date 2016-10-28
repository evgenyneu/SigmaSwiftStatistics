import Foundation

public extension Sigma {
  /**

  Returns the value of the normal density function.

  https://en.wikipedia.org/wiki/Normal_distribution

  - parameter x: The input value of the normal density function.

  - parameter μ: The mean. Default: 0.

  - parameter σ: The standard deviation. Default: 1.

  - returns: The value of the normal density function. Returns nil if σ is zero.

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
    if σ == 0 { return nil }
    return (1 / sqrt(2 * pow(σ,2) * M_PI)) * pow(M_E, (-( pow(x - μ, 2) / (2 * pow(σ, 2)) )))
  }
}
