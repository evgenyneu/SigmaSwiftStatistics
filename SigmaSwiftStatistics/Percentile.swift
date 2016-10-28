//
//  Percentile.swift
//  SigmaSwiftStatistics
//
//  Created by Evgenii on 28/10/16.
//  Copyright © 2016 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {
  /**
   
   Calculates Percentile value for the given dataset.
   
   https://en.wikipedia.org/wiki/Percentile
   
   - parameter values: Array of decimal numbers in the dataset.
   - parameter percentile: percentile between 0 and 1 inclusive. For example, value 0.4 corresponds to 40th percentile.
   - returns: the percentile value.
   
   Algorithm:
   
   https://github.com/evgenyneu/SigmaSwiftStatistics/wiki/Percentile-1-method
   
   Example:
   
   Sigma.percentile1(values: [35, 20, 50, 40, 15], percentile: 0.4)
   // Result: 29
   
   */
  public static func percentile1(values: [Double], percentile: Double) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    if percentile < 0 { return nil }
    if percentile > 1 { return nil }
    
    // 1. Sort the dataset
    // ---------------
    
    let sortedValues = sort(values)
    
    // 2. Find the rank
    // ---------------
    
    let rank = percentile * (count - 1) + 1
    
    // 3. Get the integer and fractional part of the rank
    // ---------------
    
    let rankInteger = Int(floor(rank))
    let rankFraction = Double(rank.truncatingRemainder(dividingBy: 1))
    
    // 4. Find the element at rank
    // ---------------
    
    let elementValue = sortedValues[rankInteger - 1]
    
    var elementPlusOneValue: Double = 0
    if rankInteger < Int(count) { elementPlusOneValue = sortedValues[rankInteger] }
    
    // 5. Calculate the percentile value
    // ---------------
    
    return elementValue + rankFraction * (elementPlusOneValue - elementValue)
  }
}
