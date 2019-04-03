//
//  Frequencies.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 21/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {
  /*

  Returns a dictionary with the keys containing the numbers from the input array and the values corresponding to the frequencies of those numbers.

  - parameter values: Array of decimal numbers.

  - returns: dictionary with the keys containing numbers from the input array and the values corresponding to the frequency of those numbers.


  Example:

      Sigma.frequencies([1, 2, 3, 4, 5, 4, 4, 3, 5]) // [2:1, 3:2, 4:3, 5:2, 1:1]

  */
  static func frequencies(_ values: [Double]) -> ([Double: Int]) {
    var counts: [Double: Int] = [:]

    for item in values {
      counts[item] = (counts[item] ?? 0) + 1
    }

    return counts
  }
}
