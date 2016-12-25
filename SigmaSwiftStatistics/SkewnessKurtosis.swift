//
//  SkewnessKurtosis.swift
//
//  Created by Alan James Salmoni on 19/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//


import Foundation

public extension Sigma {
    /**
     
     Computes skewness of a series of numbers.
     
     https://en.wikipedia.org/wiki/Skewness
     
     - parameter values: Array of decimal numbers.
     - returns: Skewness based on a sample. Returns nil when the array is empty or contains a single value.
     
     Formula:
     
     [XXXX]
     
     Where:
     
     m is the sample mean.
     
     n is the sample size.
     
     Example:
     
     Sigma.skewness([1, 12, 19.5, -5, 3, 8]) // 0.24527910822935245
     
     */

    public static func skewness(_ values: [Double]) -> Double? {
        if values.count > 1 {
            let moment3 = moment(values, m: 3)
            let moment2 = moment(values, m: 2)
            return moment3! / (moment2! * sqrt(moment2!))
        }
        else if values.count == 1 {
            return 0.0
        }
        else {
            return nil
        }
    }
    
    
    /**
     
     Computes kurtosis of a series of numbers.
     
     https://en.wikipedia.org/wiki/Kurtosis
     
     - parameter values: Array of decimal numbers.
     - returns: Kurtosis. Returns nil when the array is empty.
     
     Formula:
     
     [XXXX]
     
     Where:
     
     m is the population mean.
     
     n is the population size.
     
     Example:
     
     Sigma.kurtosis([1, 12, 19.5, -5, 3, 8]) // 2.0460654088343166
     
     */
    public static func kurtosis(_ values: [Double]) -> Double? {
        if values.count > 1 {
            let moment4 = moment(values, m: 4)
            let moment2 = moment(values, m: 2)
            return (moment4! / moment2!) - 3.0
        }
        else if values.count == 1 {
            return 0.0
        }
        else {
            return nil
        }
    }
}
