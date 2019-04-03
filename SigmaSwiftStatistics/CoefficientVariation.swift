//
//  Created by Alan James Salmoni on 21/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//

import Foundation

public extension Sigma {
  /**

  Computes coefficient of variation based on a sample.

  https://en.wikipedia.org/wiki/Coefficient_of_variation

  - parameter values: Array of decimal numbers.
  - returns: Coefficient of variation of a sample. Returns nil when the array is empty or contains a single value. Returns Double.infinity if the mean is zero.

  Formula:

      CV = s / m
 
  Where:

  s is the sample standard deviation.

  m is the mean.

  Example:

      Sigma.coefficientOfVariationSample([1, 12, 19.5, -5, 3, 8]) // 1.3518226672

  */
  static func coefficientOfVariationSample(_ values: [Double]) -> Double? {
    if values.count < 2 { return nil }
    guard let stdDev = Sigma.standardDeviationSample(values) else { return nil }
    guard let avg = average(values) else { return nil }
    if avg == 0 { return stdDev >= 0 ? Double.infinity : -Double.infinity }
    return stdDev / avg
  }
}
