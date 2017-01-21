//
//  Frequencies.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 21/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {
  
  public static func frequencies(values: [Double]) -> ([Double], [Int])? {
    /*
     This returns two lists from an array, the first containing the unique values and the second containing how often each value occurs.
     
     Parameter values:
     - Array of doubles to be analysed
     
     Return values:
     - Two arrays as a tuple:
     - An array containing all the values that occur within the parameter's array (see uniqueValues)
     - An array containing how often each value occurs in the parameter's array
     
     Example:
     Sigma.frequencies([1,2,3,4,5,4,3,5]) // ([1,2,3,4,5], [1, 1, 2, 2, 2])
     
     Would this be better returned as a dictionary with each unique value a key and the frequency the value?
     
     */
    let count = values.count
    if count == 0 { return nil }
    let unique_vals = Sigma.uniqueValues(values: values)!.sorted(by: <)
    let count_uniques = unique_vals.count
    var frequencies = [Int](repeating: 0, count: count_uniques)
    for (idx_uniques, unique_val) in unique_vals.enumerated() {
      for datum in values {
        if unique_val == datum {
          frequencies[idx_uniques] += 1
        }
      }
    }
    return (unique_vals, frequencies)
  }
}
