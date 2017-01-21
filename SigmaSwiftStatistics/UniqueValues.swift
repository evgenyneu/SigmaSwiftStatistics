//
//  UniqueValues.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 21/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {
  
  /*
   This returns a list of the values within a vector without regard to frequency
   
   Parameter values:
   - Array of doubles to be analysed
   
   Return values:
   - An unsorted array containing all values that occur within the parameter array. All duplicates are returned as a single value
   
   Example:
   Sigma.uniqueValues([1,2,3,4,5,4,3,5]) // [1,2,3,4,5]
   
   */
  
  public static func uniqueValues(values: [Double]) -> [Double]? {
    let count = Double(values.count)
    if count == 0 { return nil }
    let unique = Array(Set(values))
    return unique
  }
}
