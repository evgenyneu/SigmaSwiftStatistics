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
   
       Sigma.normalDistribution(x: -1, μ: 0, σ: 1) // 0.1586552539314570
   
   */
  static func normalDistribution(x: Double, μ: Double = 0, σ: Double = 1) -> Double? {
    if σ <= 0 { return nil }
    let z = (x - μ) / σ
    return  0.5 * erfc(-z * 0.5.squareRoot())
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

      Sigma.normalDensity(x: 0, μ: 0, σ: 1) // 0.3989422804014327

  */
  static func normalDensity(x: Double, μ: Double = 0, σ: Double = 1) -> Double?  {
    if σ <= 0 { return nil }
    return (1 / sqrt(2 * pow(σ,2) * Double.pi)) * pow(M_E, (-( pow(x - μ, 2) / (2 * pow(σ, 2)) )))
  }
  
  /**
   
   Returns the quantile function for the normal distribution.
   
   https://en.wikipedia.org/wiki/Normal_distribution
   
   - parameter p: The probability (area under the normal curve to the left of the returned value).
   
   - parameter μ: The mean. Default: 0.
   
   - parameter σ: The standard deviation. Default: 1.
   
   - returns: The quantile function for the normal distribution. Returns nil if σ is zero or negative. Returns nil if p is negative or greater than one. Returns (-Double.infinity) if p is zero. Returns Double.infinity if p is one.
   
   
   Example:
   
       Sigma.normalQuantile(p: 0.025, μ: 0, σ: 1) // -1.9599639845400538
   
  */
  static func normalQuantile(p: Double, μ: Double = 0, σ: Double = 1) -> Double? {
    return qnorm(p: p, mu: μ, sigma: σ)
  }
  
  // MARK: - Protected functionality
  
  /*
   *
   *  Mathlib : A C Library of Special Functions
   *  Copyright (C) 1998       Ross Ihaka
   *  Copyright (C) 2000--2005 The R Core Team
   *  based on AS 111 (C) 1977 Royal Statistical Society
   *  and   on AS 241 (C) 1988 Royal Statistical Society
   *
   *  This program is free software; you can redistribute it and/or modify
   *  it under the terms of the GNU General Public License as published by
   *  the Free Software Foundation; either version 2 of the License, or
   *  (at your option) any later version.
   *
   *  This program is distributed in the hope that it will be useful,
   *  but WITHOUT ANY WARRANTY; without even the implied warranty of
   *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   *  GNU General Public License for more details.
   *
   *  You should have received a copy of the GNU General Public License
   *  along with this program; if not, a copy is available at
   *  https://www.R-project.org/Licenses/
   *  
   *  DESCRIPTION
   *
   *	Compute the quantile function for the normal distribution.
   *
   *	For small to moderate probabilities, algorithm referenced
   *	below is used to obtain an initial approximation which is
   *	polished with a final Newton step.
   *
   *	For very large arguments, an algorithm of Wichura is used.
   *
   *  REFERENCE
   *
   *	Beasley, J. D. and S. G. Springer (1977).
   *	Algorithm AS 111: The percentage points of the normal distribution,
   *	Applied Statistics, 26, 118-121.
   *
   *      Wichura, M.J. (1988).
   *      Algorithm AS 241: The Percentage Points of the Normal Distribution.
   *      Applied Statistics, 37, 477-484.
   */
  
  /**
   
   Computes the quantile function for the normal distribution.
   
   Adapted from: https://svn.r-project.org/R/trunk/src/nmath/qnorm.c
   
   - parameter p: The probability.
   
   - parameter μ: The mean.
   
   - parameter σ: The standard deviation.
   
   - returns: The quantile function for the normal distribution. Returns nil if σ is zero or negative. Returns nil if p is negative or greater than one. Returns (-Double.infinity) if p is zero. Returns Double.infinity if p is one.
   
  */
  static func qnorm(p: Double, mu: Double, sigma: Double) -> Double? {
    if (p < 0 || p > 1) { return nil }
    if (p == 0) { return -Double.infinity }
    if (p == 1) { return Double.infinity }
    if (sigma <= 0) { return nil }
    let q = p - 0.5
    var val: Double = 0, r: Double = 0
    
    if (abs(q) <= 0.425) // 0.075 <= p <= 0.925
    {
      r = 0.180625 - q * q;
      val = q * (((((((r * 2509.0809287301226727 +
        33430.575583588128105) * r + 67265.770927008700853) * r +
        45921.953931549871457) * r + 13731.693765509461125) * r +
        1971.5909503065514427) * r + 133.14166789178437745) * r +
        3.387132872796366608)
        / (((((((r * 5226.495278852854561 +
          28729.085735721942674) * r + 39307.89580009271061) * r +
          21213.794301586595867) * r + 5394.1960214247511077) * r +
          687.1870074920579083) * r + 42.313330701600911252) * r + 1.0);
    } else /* closer than 0.075 from {0,1} boundary */
    {
      r = q > 0 ? 1 - p : p;
      r = sqrt(-log(r))
      
      if (r <= 5) // <==> min(p,1-p) >= exp(-25) ~= 1.3888e-11
      {
        r -= 1.6;
        val = (((((((r * 7.7454501427834140764e-4 +
          0.0227238449892691845833) * r + 0.24178072517745061177) *
          r + 1.27045825245236838258) * r +
          3.64784832476320460504) * r + 5.7694972214606914055) *
          r + 4.6303378461565452959) * r +
          1.42343711074968357734)
          / (((((((r *
            1.05075007164441684324e-9 + 5.475938084995344946e-4) *
            r + 0.0151986665636164571966) * r +
            0.14810397642748007459) * r + 0.68976733498510000455) *
            r + 1.6763848301838038494) * r +
            2.05319162663775882187) * r + 1.0);
      }
      else // very close to  0 or 1
      {
        r -= 5.0;
        val = (((((((r * 2.01033439929228813265e-7 +
          2.71155556874348757815e-5) * r +
          0.0012426609473880784386) * r + 0.026532189526576123093) *
          r + 0.29656057182850489123) * r +
          1.7848265399172913358) * r + 5.4637849111641143699) *
          r + 6.6579046435011037772)
          / (((((((r *
            2.04426310338993978564e-15 + 1.4215117583164458887e-7) *
            r + 1.8463183175100546818e-5) * r +
            7.868691311456132591e-4) * r + 0.0148753612908506148525)
            * r + 0.13692988092273580531) * r +
            0.59983220655588793769) * r + 1.0);
      }
      if (q < 0.0) { val = -val; }
    }
    
    return (mu + sigma * val)
  }
}
