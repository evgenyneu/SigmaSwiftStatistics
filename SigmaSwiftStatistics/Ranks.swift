//
//  Ranks.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 21/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {
  
  /*
   this ranks a vector (single dimensional array) of floats.
   
   Parameter values:
   - Array of doubles to be ranked
   - Start value for ranking (defaults to 1)
   - How to deal with ties. Defaults to "mean"
   - "mean" uses the arithmetic mean,
   - "max" uses the maximum possible rank for all ties
   - "min" uses the minimum rank for all ties
   - "first" awards a descending rank starting so first occurence gets the highest rank down to the last
   - "last" awards an ascending rank starting so the last occurance gets the highest rank down to the first
   
   Returns:
   - Array of floats with the rank of each item
   
   Examples:
   Sigma.rank([2,3,6,5,3]) // [1.0, 2.5, 5.0, 4.0, 2.5]
   Sigma.rank([100,100,100,100], start: 10) // [11.5, 11.5, 11.5, 11.5]
   Sigma.rank([100,100,100,100], ties: "max") // [1.0, 1.0, 1.0, 1.0]
   Sigma.rank([100,100,100,100], ties: "min") // [4.0, 4.0, 4.0, 4.0]
   Sigma.rank([100,100,100,100], ties: "first") // [1.0, 2.0, 3.0, 4.0]
   Sigma.rank([100,100,100,100], ties: "last") // [4.0, 3.0, 2.0, 1.0]
   
   */
  
  public static func rank(_ values: [Double], start: Double = 1.0, ties: String = "mean") -> [Double]? {
    let count_all = values.count
    if count_all == 0 {
      return nil
    }
    var rank: Double
    if ties == "mean" {
      rank = start - 0.5
    }
    else if ties == "max" || ties == "min" || ties == "first" || ties == "last" {
      rank = start - 1.0
    }
    else {
      return nil
    }
    var increment: Double
    var tiny_increment: Double
    var unique_vals: [Double]
    var unique_freqs: [Int]
    (unique_vals, unique_freqs) = Sigma.frequencies(values: values)!
    var ranks = [Double](repeating: 0, count: count_all)
    for (idx, value) in unique_vals.enumerated() {
      increment = Double(unique_freqs[idx])
      tiny_increment = 1.0
      for idx in 0...(count_all - 1) {
        if value == values[idx] {
          if ties == "mean" {
            ranks[idx] = rank + (increment / 2.0)
          }
          else if ties == "min" {
            ranks[idx] = rank + 1
          }
          else if ties == "max" {
            ranks[idx] = rank + increment
          }
          else if ties == "first" {
            ranks[idx] = rank + tiny_increment
            tiny_increment += 1
          }
          else if ties == "last" {
            ranks[idx] = rank + increment - tiny_increment + 1.0
            tiny_increment += 1
          }
        }
      }
      rank += increment
    }
    return ranks
  }
}
