
//
//  HarmonicMean.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 30/12/2016.
//  Copyright © 2016 Evgenii Neumerzhitckii. All rights reserved.
//
import Foundation

public extension Sigma {
  
  public static func harmonicMean(data: [Double]) -> Double? {
    let count = data.count
    if count == 0 {
      return nil
    }
    var data_inv: [Double] = []
    var inv_val: Double
    for item in data {
      inv_val = 1.0 / item
      data_inv.append(inv_val)
    }
    let m1 = average(data_inv)
    let hm = 1.0 / m1!
    return hm
  }
}
