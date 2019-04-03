//
//  Created by Alan James Salmoni on 18/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//


import Foundation

public extension Sigma {
  /**

  Computes standard error of the mean.

  http://en.wikipedia.org/wiki/Standard_error

  - parameter values: Array of decimal numbers.
   
  - returns: Standard error of the mean. Returns nil when the array is empty or contains a single value.

  Formula:

      SE = s / sqrt(n)

  Where:

  s is the sample standard deviation.

  n is the sample size.

  Example:

      Sigma.standardErrorOfTheMean([1, 12, 19.5, -5, 3, 8]) // 3.5412254627

  */
  static func standardErrorOfTheMean(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    guard let stdev = standardDeviationSample(values) else { return nil }
    return stdev / sqrt(count)
  }
}
