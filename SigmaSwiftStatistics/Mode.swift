//
//  Mode.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 19/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {
  /**
   
   Returns the mode(s) from the array after it is sorted and the indices where it occurs
   
   https://en.wikipedia.org/wiki/Mode_(statistics)
   
   - parameter values: Array of decimal numbers.
   - returns: The mode value itself and an array of the indices where the mode occurs
   
   Example:
   
   Sigma.mode([1, 12, 9.5, 3, -5, 12]) // (12, [1,5])
   
   */
  public static func mode(_ values: [Double]) -> (Double, [Int])? {
    let count = values.count
    if count == 0 { return nil }
    else if count == 1 {
      return (values[0], [0])
    }
    var mode_value = values[0]
    var mode_indices: [Int] = [0]
    
    for index in 1...(count - 1) {
      if values[index] > mode_value {
        mode_value = values[index]
        mode_indices = [index]
      }
      else if values[index] == mode_value {
        mode_indices.append(index)
      }
    }
    return (mode_value, mode_indices)
  }
}


