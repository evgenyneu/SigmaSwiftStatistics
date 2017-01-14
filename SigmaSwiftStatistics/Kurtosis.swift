//
//  SkewnessKurtosis.swift
//
//  Created by Alan James Salmoni on 19/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//


import Foundation

public extension Sigma {
  
//  public static func kurtosis(_ values: [Double]) -> Double? {
//    if values.count > 1 {
//      let moment4 = centralMoment(values, order: 4)
//      let moment2 = centralMoment(values, order: 2)
//      return (moment4! / moment2!) - 3.0
//    }
//    else if values.count == 1 {
//      return 0.0
//    }
//    else {
//      return nil
//    }
//  }
  
  /**

  Computes kurtosis of a series of numbers. This implementation is the same as the SKEW function in Excel and Google Docs Sheets.

  https://en.wikipedia.org/wiki/Kurtosis

  - parameter values: Array of decimal numbers.
   
  - returns: Kurtosis. Returns nil if the dataset contains less than 4 values. Returns nil if all the values in the dataset are the same.

  Formula (LaTeX):

      \frac{n(n + 1)}{(n - 1)(n - 2)(n - 3)}\sum_{i=1}^{n} \Bigg( \frac{(x_i - \bar{x})}{s} \Bigg)^4 - \frac{3(n - 1)^2}{(n - 2)(n - 3)}

  Example:

      Sigma.kurtosis([2, 1, 3, 4.1, 19, 1.5]) // 5.4570693277

  */
  public static func kurtosisA(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count < 4 { return nil }
    
    guard let averageVal = average(values) else { return nil }
    guard let stdev = standardDeviationSample(values) else { return nil }
    
    var result = values.reduce(0.0) { sum, value in
      let value = (value - averageVal) / stdev
      return sum + pow(value, 4)
    }
    
    result *= (count * (count + 1) / ((count - 1) * (count - 2) * (count - 3)))
    result -= 3 * pow(count - 1, 2) / ((count - 2) * (count - 3))
    
    return result
  }
}
