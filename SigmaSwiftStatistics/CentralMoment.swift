//
//  Moment.swift
//
//  Created by Alan James Salmoni on 19/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//


import Foundation

public extension Sigma {
  /**
   
   Computes a specified moment based on a sample.
   
   https://en.wikipedia.org/wiki/Moment_(mathematics)
   
   - parameter values: Array of decimal numbers, dimension
   - returns: Moment based on a sample. Returns nil when the array is empty or contains a single value.
   
   Formula:
   
   [XXXX]
   
   Where:
   
   m is the required dimension.
   
   n is the sample size.
   
   Example:
   
   Sigma.varianceSample([1, 12, 19.5, -5, 3, 8]) // 75.24166667
   
   */

  public static func centralMoment(_ values: [Double], m: Int) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    guard let averageVal = average(values) else { return nil }
    
    let total = values.reduce(0) { sum, value in
      sum + pow((value - averageVal), Double(m))
    }
    
    return total / count
  }
}
