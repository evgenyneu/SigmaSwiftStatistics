//
//  EffectSizes.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 30/12/2016.
//  Copyright © 2016 Alan James Salmoni. All rights reserved.
//

import Foundation


public extension Sigma {

  internal static func calcEffectSizeControl(data1: [Double], data2: [Double]) -> Double {
    let all_data = data1 + data2
    let samp_std_dev = standardDeviationSample(all_data)
    let mean1 = average(data1)
    let mean2 = average(data2)
    var return_val = (mean1! - mean2!) / samp_std_dev!
    if return_val < 0 {
      return_val = -return_val
    }
    return return_val
  }

  public static func effectSizeControl(data1: [Double], data2: [Double]) -> Double? {
    let count1 = data1.count
    let count2 = data2.count
    if count1 == 0 || count2 == 0 {
      return nil
    }
    let effect_size = calcEffectSizeControl(data1: data1, data2: data2)
    return effect_size
  }

  internal static func calcEffectSize(data1: [Double], data2: [Double]) -> Double {
    let sstd1 = standardDeviationSample(data1)
    let sstd2 = standardDeviationSample(data2)
    let Psd = sqrt((pow(sstd1!, 2) + pow(sstd2!, 2)) / 2.0)
    let ES = (average(data1)! - average(data2)! / Psd)
    return ES
  }

  public static func effectSize(data1: [Double], data2: [Double]) -> Double? {
    let count1 = data1.count
    let count2 = data2.count
    if count1 == 0 || count2 == 0 {
      return nil
    }
    let return_val = calcEffectSize(data1: data1, data2: data2)
    return return_val
  }
  
}


