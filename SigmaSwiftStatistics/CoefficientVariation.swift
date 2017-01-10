//
//  CoefficientVariation.swift
//
//  Created by Alan James Salmoni on 21/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//

import Foundation

public extension Sigma {
    /**

    Computes coefficient of variation based on a sample.

    https://en.wikipedia.org/wiki/Coefficient_of_variation

    - parameter values: Array of decimal numbers.
    - returns: Coefficient of variation of a sample. Returns nil when the array is empty or contains a single value.

    Formula:

        s = sqrt( Σ( (x - m)^2 ) / (n - 1) )

    Where:

    m is the sample mean.

    n is the sample size.

    Example:

        Sigma.coefficient_variation([1, 12, 19.5, -5, 3, 8]) // 1.3518226671899016

    */
    public static func coefficient_variation(_ values: [Double]) -> Double? {
        if values.count > 0 {
            let sampleStdDev = Sigma.standardDeviationSample(values)
            let average_val = average(values)
            return sampleStdDev! / average_val!
        }
        else {
            return nil
        }
    }
}
