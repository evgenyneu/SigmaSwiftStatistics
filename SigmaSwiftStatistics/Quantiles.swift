//
//  Quantiles.swift
//
//  Created by Alan James Salmoni on 21/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//

import Foundation

public extension Sigma {
  /**
   
  The class contains nine functions that calculate sample quantiles corresponding to the given probability. The implementation is the same as in R. The nine functions correspond to the algorithms discussed in Hyndman and Fan paper, 1996:
   
  https://www.jstor.org/stable/2684934
  https://www.amherst.edu/media/view/129116/original/Sample+Quantiles.pdf
   
  The function documentation was based on R and Wikipedia:
   
  https://en.wikipedia.org/wiki/Quantile
  http://stat.ethz.ch/R-manual/R-devel/library/stats/html/quantile.html

  */
  public static let quantiles = SigmaQuantiles()
}

public class SigmaQuantiles {
  /*
  
  The first sample quantile method from Hyndman and Fan paper (1996). This method calculates quantiles using the inverse of the empirical distribution function.
  
  - parameter data: Array of decimal numbers.
  - parameter probability: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.
   
  */
  public func method1(_ data: [Double], probability: Double) -> Double? {
    if probability < 0 || probability > 1 { return nil }
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let k = Int((probability * count))
    let g = (probability * count) - Double(k)
    var new_probability = 1.0
    if g == 0.0 { new_probability = 0.0 }
    return qDef(data, k: k, probability: new_probability)
  }
  
  /**
   
  The second sample quantile method from Hyndman and Fan paper (1996). This is an inverted empirical distribution function with averaging.

  - parameter data: Array of decimal numbers.
  - parameter probability: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.
   
  */
  public func method2(_ data: [Double], probability: Double) -> Double? {
    if probability < 0 || probability > 1 { return nil }
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let k = Int(probability * count)
    let g = (probability * count) - Double(k)
    var new_probability = 1.0
    if g == 0.0 { new_probability = 0.5 }
    return qDef(data, k: k, probability: new_probability)
  }
  
  /**
   
  The 3rd sample quantile method from Hyndman and Fan paper (1996).
   
  - parameter data: Array of decimal numbers.
  - parameter probability: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.
   
  */
  public func method3(_ data: [Double], probability: Double) -> Double? {
    if probability < 0 || probability > 1 { return nil }
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = -0.5
    let k = Int((probability * count) + m)
    let g = (probability * count) + m - Double(k)
    var new_probability = 1.0
    if g <= 0 && k % 2 == 0 { new_probability = 0.0 }
    return qDef(data, k: k, probability: new_probability)
  }
  
  /**
   
  The 4th sample quantile method from Hyndman and Fan paper (1996). It uses linear interpolation of the empirical distribution function.

  - parameter data: Array of decimal numbers.
  - parameter probability: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.
   
  */
  public func method4(_ data: [Double], probability: Double) -> Double? {
    if probability < 0 || probability > 1 { return nil }
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = 0.0
    let k = Int((probability * count) + m)
    let probability = (probability * count) + m - Double(k)
    return qDef(data, k: k, probability: probability)
  }
  
  /**
   
  The 5th sample quantile method from Hyndman and Fan paper (1996). This is a piecewise linear function where the knots are the values midway through the steps of the empirical distribution function.

  - parameter data: Array of decimal numbers.
  - parameter probability: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.

  */
  public func method5(_ data: [Double], probability: Double) -> Double? {
    if probability < 0 || probability > 1 { return nil }
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = 0.5
    let k = Int((probability * count) + m)
    let probability = (probability * count) + m - Double(k)
    return qDef(data, k: k, probability: probability)
  }
  
  /**

  The 6th sample quantile method from Hyndman and Fan paper (1996). This method is implemented by Minitab and SPSS and uses linear interpolation of the expectations for the order statistics for the uniform distribution on [0,1].
   
  - parameter data: Array of decimal numbers.
  - parameter probability: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.

  */
  public func method6(_ data: [Double], probability: Double) -> Double? {
    if probability < 0 || probability > 1 { return nil }
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = probability
    let k = Int((probability * count) + m)
    let probability = (probability * count) + m - Double(k)
    return qDef(data, k: k, probability: probability)
  }
  
  /**
   
  The 7th sample quantile method from Hyndman and Fan paper (1996). This method is implemented in S and uses linear interpolation of the modes for the order statistics for the uniform distribution on [0, 1].

  - parameter data: Array of decimal numbers.
  - parameter probability: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.

  */
  public func method7(_ data: [Double], probability: Double) -> Double? {
    if probability < 0 || probability > 1 { return nil }
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = 1.0 - probability
    let k = Int((probability * count) + m)
    let probability = (probability * count) + m - Double(k)
    return qDef(data, k: k, probability: probability)
  }
  
  /**

  The 8th sample quantile method from Hyndman and Fan paper (1996). The resulting quantile estimates are approximately median-unbiased regardless of the distribution of x.

  - parameter data: Array of decimal numbers.
  - parameter probability: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.

  */
  public func method8(_ data: [Double], probability: Double) -> Double? {
    if probability < 0 || probability > 1 { return nil }
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = (probability + 1.0) / 3.0
    let k = Int((probability * count) + m)
    let probability = (probability * count) + m - Double(k)
    return qDef(data, k: k, probability: probability)
  }
  
  /**

  The 9th sample quantile method from Hyndman and Fan paper (1996). The resulting quantile estimates are approximately unbiased for the expected order statistics if x is normally distributed.
   
   - parameter data: Array of decimal numbers.
   - parameter probability: the probability value between 0 and 1, inclusive.
   - returns: sample quantile.
   
  */
  public func method9(_ data: [Double], probability: Double) -> Double? {
    if probability < 0 || probability > 1 { return nil }
    let data = data.sorted(by: <)
    let count = Double(data.count)
    let m = (0.25 * probability) + (3.0 / 8.0)
    let k = Int((probability * count) + m)
    let probability = (probability * count) + m - Double(k)
    return qDef(data, k: k, probability: probability)
  }
  
  /**
  
  Shared function for all quantile methods.

  - parameter data: Array of decimal numbers.
  - parameter k: the position of the element in the dataset.
  - parameter probability: the probability value between 0 and 1, inclusive.
  - returns: sample quantile.

  */
  private func qDef(_ data: [Double], k: Int, probability: Double) -> Double? {
    if data.isEmpty { return nil }
    if k < 1 { return data[0] }
    if k >= data.count { return data.last }
    return ((1.0 - probability) * data[k - 1]) + (probability * data[k])
  }
}

