//
//  Created by Alan James Salmoni on 19/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//


import Foundation

public extension Sigma {
  /**

  Computes kurtosis of a series of numbers. This implementation is the same as the SKEW function in Excel and Google Docs Sheets.

  https://en.wikipedia.org/wiki/Kurtosis

  - parameter values: Array of decimal numbers.
   
  - returns: Kurtosis. Returns nil if the dataset contains less than 4 values. Returns nil if all the values in the dataset are the same.

  Formula (LaTeX):

      \frac{n(n + 1)}{(n - 1)(n - 2)(n - 3)}\sum_{i=1}^{n} \Bigg( \frac{x_i - \bar{x}}{s} \Bigg)^4 - \frac{3(n - 1)^2}{(n - 2)(n - 3)}

  Example:

      Sigma.kurtosisA([2, 1, 3, 4.1, 19, 1.5]) // 5.4570693277

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
  
  /**

  Computes kurtosis of a series of numbers. This implementation is the same as in Wolfram Alpha and "moments" R package.

  https://en.wikipedia.org/wiki/Kurtosis

  - parameter values: Array of decimal numbers.

  - returns: Kurtosis. Returns nil if the dataset contains less than 2 values. Returns nil if all the values in the dataset are the same.

  Formula (LaTeX):

      \frac{\mu_4}{\mu^2_2}

  Example:

      Sigma.kurtosisB([2, 1, 3, 4.1, 19, 1.5]) // 4.0138523409

  */
  public static func kurtosisB(_ values: [Double]) -> Double? {
    if values.isEmpty { return nil }
    guard let moment4 = centralMoment(values, order: 4) else { return nil }
    guard let moment2 = centralMoment(values, order: 2) else { return nil }
    if moment2 == 0 { return nil }
    return (moment4 / pow(moment2, 2))
  }
}
