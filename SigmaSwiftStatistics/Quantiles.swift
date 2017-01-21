//
//  Quantiles.swift
//
//  Created by Alan James Salmoni on 21/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//

import Foundation

public extension Sigma {
  /**
   These routines calculate quantiles according to the paper by Hyndman and Fan (1996). Each routine is detailed within the routine and for types 4 through 9, Q[i](p) is a continuous function of p, with gamma = g and m given below. The sample quantiles can be obtained equivalently by linear interpolation between the points (p[k],x[k]) where x[k] is the kth order statistic. Specific expressions for p[k] are given below.
   
   The information was retrieved from the equivalent page about quantiles in R (http://stat.ethz.ch/R-manual/R-devel/library/stats/html/quantile.html)
   
   Information about quantiles in general can be found at https://en.wikipedia.org/wiki/Quantile
   */
  private static func qDef(data: [Double], k: Int, alpha: Double) -> Double {
    /*
     This routine is a common routine for all quantile methods. It takes the data as an array, a value for k and an alpha level, and calculates the appropriate quantile and returns it.
     
     */
    let qdef = ((1.0 - alpha)*data[k-1])+(alpha*data[k])
    return qdef
  }
  
  public static func quantile1(data: [Double], alpha: Double) -> Double {
    /*
     This calculates quantiles using the inverse of the empirical distribution function. γ = 0 if g = 0, and 1 otherwise.
     */
    let data = data.sorted(by: <)
    let count = data.count
    let k = Int((alpha * Double(count)))
    let g = (alpha * Double(count)) - Double(k)
    var new_alpha = 1.0
    if g == 0.0 {
      new_alpha = 0.0
    }
    let Q = qDef(data: data, k: k, alpha: new_alpha)
    return Q
  }
  
  public static func quantile2(data: [Double], alpha: Double) -> Double {
    /*
     Similar to type 1 but with averaging at discontinuities. γ = 0.5 if g = 0, and 1 otherwise.
     */
    let data = data.sorted(by: <)
    let count = data.count
    let k = Int(alpha * Double(count))
    let g = (alpha * Double(count)) - Double(k)
    var new_alpha = 1.0
    if g == 0.0 {
      new_alpha = 0.5
    }
    let Q = qDef(data: data, k: k, alpha: new_alpha)
    return Q
  }
  
  public static func quantile3(data: [Double], alpha: Double) -> Double {
    /*
     SAS definition: nearest even order statistic. γ = 0 if g = 0 and j is even, and 1 otherwise.
     */
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
    let Q = qDef(data: data, k: k, alpha: new_alpha)
    return Q
  }
  
  public static func quantile4(data: [Double], alpha: Double) -> Double {
    /*
     m = 0. p[k] = k / n. That is, linear interpolation of the empirical cdf.
     */
    let data = data.sorted(by: <)
    let count = data.count
    let m = 0.0
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = qDef(data: data, k: k, alpha: alpha)
    return Q
  }
  
  public static func quantile5(data: [Double], alpha: Double) -> Double {
    /*
     m = 1/2. p[k] = (k - 0.5) / n. That is a piecewise linear function where the knots are the values midway through the steps of the empirical cdf. This is popular amongst hydrologists.
     */
    let data = data.sorted(by: <)
    let count = data.count
    let m = 0.5
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = qDef(data: data, k: k, alpha: alpha)
    return Q
  }
  
  public static func quantile6(data: [Double], alpha: Double) -> Double {
    /*
     m = p. p[k] = k / (n + 1). Thus p[k] = E[F(x[k])]. This is used by Minitab and by SPSS.
     */
    let data = data.sorted(by: <)
    let count = data.count
    let m = alpha
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = qDef(data: data, k: k, alpha: alpha)
    return Q
  }
  
  public static func quantile7(data: [Double], alpha: Double) -> Double {
    /*
     m = 1-p. p[k] = (k - 1) / (n - 1). In this case, p[k] = mode[F(x[k])]. This is used by S.
     */
    let data = data.sorted(by: <)
    let count = data.count
    let m = 1.0 - alpha
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = qDef(data: data, k: k, alpha: alpha)
    return Q
  }
  
  public static func quantile8(data: [Double], alpha: Double) -> Double {
    /*
     m = (p+1)/3. p[k] = (k - 1/3) / (n + 1/3). Then p[k] =~ median[F(x[k])]. The resulting quantile estimates are approximately median-unbiased regardless of the distribution of x.
     */
    let data = data.sorted(by: <)
    let count = data.count
    let m = (alpha + 1.0) / 3.0
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = qDef(data: data, k: k, alpha: alpha)
    return Q
  }
  
  public static func quantile9(data: [Double], alpha: Double) -> Double {
    /*
     m = p/4 + 3/8. p[k] = (k - 3/8) / (n + 1/4). The resulting quantile estimates are approximately unbiased for the expected order statistics if x is normally distributed.
     */
    let data = data.sorted(by: <)
    let count = data.count
    let m = (0.25 * alpha) + (3.0 / 8.0)
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = qDef(data: data, k: k, alpha: alpha)
    return Q
  }
  
  public static func quantile(data: [Double], alpha: Double, qtype: Int = 7) -> Double? {
    /*
     A function to call quantiles. Users can specify which type of quantile they wish to use.
     Quantile number 7 is the default as per R.
     */
    let count = data.count
    if count < 4 {
      return nil
    }
    if alpha < 0.0 || alpha > 1.0 {
      return nil
    }
    switch qtype {
    case 1: return quantile1(data: data, alpha: alpha)
    case 2: return quantile2(data: data, alpha: alpha)
    case 3: return quantile3(data: data, alpha: alpha)
    case 4: return quantile4(data: data, alpha: alpha)
    case 5: return quantile5(data: data, alpha: alpha)
    case 6: return quantile6(data: data, alpha: alpha)
    case 7: return quantile7(data: data, alpha: alpha)
    case 8: return quantile8(data: data, alpha: alpha)
    case 9: return quantile9(data: data, alpha: alpha)
    default: return nil
    }
  }
}
