//
//  Created by Alan James Salmoni on 19/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//

import Foundation

public extension Sigma {
  /**
   
  Computes central moment of the dataset.
   
  https://en.wikipedia.org/wiki/Central_moment

  - parameter values: Array of decimal numbers.
  - parameter order: The order of the moment (0, 1, 2, 3 etc.).
  - returns: Central moment. Returns nil when the array is empty.
   
  Formula:

      Σ(x - m)^k / n

  Where:

  m is the sample mean.
   
  k is the order of the moment (0, 1, 2, 3, ...).
   
  n is the sample size.
   
  Example:
   
      Sigma.centralMoment([3, -1, 1, 4.1, 4.1, 0.7], order: 3) // -1.5999259259
   
  */
  static func centralMoment(_ values: [Double], order: Int) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    guard let averageVal = average(values) else { return nil }
    
    let total = values.reduce(0) { sum, value in
      sum + pow((value - averageVal), Double(order))
    }
    
    return total / count
  }
}
