//
//  GeometricMean.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 30/12/2016.
//  Copyright © 2016 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {

  public static func geometricMean(data: [Double]) -> Double? {
    let count = data.count
    if count == 0 {
      return nil
    }
    var data_log: [Double] = []
    var log_val: Double
    for item in data {
      log_val = log(item)
      data_log.append(log_val)
    }
    let return_val = exp(average(data_log)!)
    return return_val
  }
}
