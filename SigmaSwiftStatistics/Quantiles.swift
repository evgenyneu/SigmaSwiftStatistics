//
//  Quantiles.swift
//
//  Created by Alan James Salmoni on 21/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//

import Foundation

public extension Sigma {
  /**
  Contains nine functions that calculate sample quantiles corresponding to the given probability. The implementation is the same as in R. The nine functions correspond to the algorithms discussed in Hyndman and Fan paper, 1996:
   
  https://www.jstor.org/stable/2684934
  https://www.amherst.edu/media/view/129116/original/Sample+Quantiles.pdf
   
  Reference:
   
  https://en.wikipedia.org/wiki/Quantile

  The function documentation was based on documenation from R:
   
  http://stat.ethz.ch/R-manual/R-devel/library/stats/html/quantile.html

  */
  public static let quantiles = SigmaQuantiles()
}

public class SigmaQuantiles {
  /*
  
  The first sample quantile method from Hyndman and Fan paper, 1996. This calculates quantiles using the inverse of the empirical distribution function. γ = 0 if g = 0, and 1 otherwise.
  
  */
  public func Q1(_ data: [Double], alpha: Double) -> Double? {
    let data = data.sorted(by: <)
    let count = data.count
    let k = Int((alpha * Double(count)))
    let g = (alpha * Double(count)) - Double(k)
    var new_alpha = 1.0
    if g == 0.0 {
      new_alpha = 0.0
    }
    let Q = QDef(data, k: k, alpha: new_alpha)
    return Q
  }
  
  /**
  
  Similar to type 1 but with averaging at discontinuities. γ = 0.5 if g = 0, and 1 otherwise.
  
  */
  public func Q2(_ data: [Double], alpha: Double) -> Double? {
    let data = data.sorted(by: <)
    let count = data.count
    let k = Int(alpha * Double(count))
    let g = (alpha * Double(count)) - Double(k)
    var new_alpha = 1.0
    if g == 0.0 {
      new_alpha = 0.5
    }
    let Q = QDef(data, k: k, alpha: new_alpha)
    return Q
  }
  
  /**
  
  SAS definition: nearest even order statistic. γ = 0 if g = 0 and j is even, and 1 otherwise.
  
  */
  public func Q3(_ data: [Double], alpha: Double) -> Double? {
    
    let data = data.sorted(by: <)
    let count = data.count
    let m = -0.5
    let k = Int((alpha * Double(count)) + m)
    let g = (alpha * Double(count)) + m - Double(k)
    var new_alpha = 1.0
    /* if g == 0.0 && k.truncatingRemainder(dividingBy: 2.0) != 0.0 { */
    if g == 0.0 && k % 2 != 0 {
      new_alpha = 0.0
    }
    let Q = QDef(data, k: k, alpha: new_alpha)
    return Q
  }
  
  /**
  
  m = 0. p[k] = k / n. That is, linear interpolation of the empirical cdf.
  
  */
  public func Q4(_ data: [Double], alpha: Double) -> Double? {
    let data = data.sorted(by: <)
    let count = data.count
    let m = 0.0
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = QDef(data, k: k, alpha: alpha)
    return Q
  }
  
  
  /**
   
  m = 1/2. p[k] = (k - 0.5) / n. That is a piecewise linear function where the knots are the values midway through the steps of the empirical cdf. This is popular amongst hydrologists.
  
  */
  public func Q5(_ data: [Double], alpha: Double) -> Double? {
    let data = data.sorted(by: <)
    let count = data.count
    let m = 0.5
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = QDef(data, k: k, alpha: alpha)
    return Q
  }
  
  /**
  
  m = p. p[k] = k / (n + 1). Thus p[k] = E[F(x[k])]. This is used by Minitab and by SPSS.
  
  */
  public func Q6(_ data: [Double], alpha: Double) -> Double? {
    let data = data.sorted(by: <)
    let count = data.count
    let m = alpha
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = QDef(data, k: k, alpha: alpha)
    return Q
  }
  
  /**

  m = 1-p. p[k] = (k - 1) / (n - 1). In this case, p[k] = mode[F(x[k])]. This is used by S.
 
  */
  
  /**
   
  The 7th sample quantile method from Hyndman and Fan paper (1996). Uses linear interpolation of the modes for the order statistics for the uniform distribution on [0, 1]. Used in S.

  - parameter data: Array of decimal numbers.
  - parameter alpha: the probability value between 0 and 1, inclusive.
  - returns:  sample quantile.

  */
  public func Q7(_ data: [Double], alpha: Double) -> Double? {
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = 1.0 - alpha
    let k = Int((alpha * count) + m)
    let alpha = (alpha * count) + m - Double(k)
    return QDef(data, k: k, alpha: alpha)
  }
  
  /**

  The 8th sample quantile method from Hyndman and Fan paper (1996). The resulting quantile estimates are approximately median-unbiased regardless of the distribution of x.

  - parameter data: Array of decimal numbers.
  - parameter alpha: the probability value between 0 and 1, inclusive.
  - returns:  sample quantile.

  */
  public func Q8(_ data: [Double], alpha: Double) -> Double? {
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = (alpha + 1.0) / 3.0
    let k = Int((alpha * count) + m)
    let alpha = (alpha * count) + m - Double(k)
    return QDef(data, k: k, alpha: alpha)
  }
  
  /**

  The 9th sample quantile method from Hyndman and Fan paper (1996). The resulting quantile estimates are approximately unbiased for the expected order statistics if x is normally distributed.
   
   - parameter data: Array of decimal numbers.
   - parameter alpha: the probability value between 0 and 1, inclusive.
   - returns:  sample quantile.
   
  */
  public func Q9(_ data: [Double], alpha: Double) -> Double? {
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = (0.25 * alpha) + (3.0 / 8.0)
    let k = Int((alpha * count) + m)
    let alpha = (alpha * count) + m - Double(k)
    return QDef(data, k: k, alpha: alpha)
  }
  
  /**
  
  Shared function for all quantile methods.

  - parameter data: Array of decimal numbers.
  - parameter k: the position of the element in the dataset.
  - parameter alpha: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.

  */
  private func QDef(_ data: [Double], k: Int, alpha: Double) -> Double? {
    if data.isEmpty { return nil }
    if k < 1 { return data[0] }
    if k >= data.count { return data.last }
    return ((1.0 - alpha) * data[k - 1]) + (alpha * data[k])
  }
}

