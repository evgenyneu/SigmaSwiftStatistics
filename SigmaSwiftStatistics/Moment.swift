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

  public static func moment(_ values: [Double], m: Int ) -> Double? {
    let count = Double(values.count)
    if values.count > 0 {
      let average_val = average(values)
      var total: Double = 0
      var delta: Double = 0
      for value in values {
        delta = pow((value - average_val!), Double(m))
        total += delta
      }
      return total / count
    }
    else {
      return nil
    }
  }
}
