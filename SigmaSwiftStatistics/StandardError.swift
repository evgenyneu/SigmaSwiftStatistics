//
//  StandardError.swift
//
//  Created by Alan James Salmoni on 18/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//


import Foundation

public extension Sigma {
    /**
     
     Computes standard error based on a sample.
     
     http://en.wikipedia.org/wiki/Standard_error
     
     - parameter values: Array of decimal numbers.
     - returns: Standard error of a sample. Returns nil when the array is empty or contains a single value.
     
     Formula:
     
     SE = sqrt( Σ( (x - m)^2 ) / (n - 1) ) / sqrt(n)
     
     Where:
     
     m is the sample mean.
     
     n is the sample size.
     
     Example:
     
     Sigma.standardError([1, 12, 19.5, -5, 3, 8]) // 8.674195447801869
     
     */
    public static func standardError(_ values: [Double]) -> Double? {
        let count = Double(values.count)
        if count != 0 {
            return standardDeviationSample(values)! / sqrt(count)
        }
        
        return nil
    }
    
}
