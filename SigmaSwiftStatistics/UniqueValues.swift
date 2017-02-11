//
//  UniqueValues.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 21/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {

  /**

  Returns an unsorted array containing all values that occur within the input array without the duplicates.

  - parameter values: Array of numbers.

  - returns: An unsorted array containing all values that occur within the input array without the duplicates.

  Example:

      Sigma.uniqueValues([2, 1, 3, 4, 5, 4, 3, 5]) // [2, 3, 4, 5, 1]

  */
  public static func uniqueValues(_ values: [Double]) -> [Double] {
    return Array(Set(values))
  }
}
