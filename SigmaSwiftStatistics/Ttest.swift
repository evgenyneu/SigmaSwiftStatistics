//
//  Ttest.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 19/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {
    /**
     
     Performs one of 3 t-tests: Single sample, unpaired samples, paired samples. 
     
     Paired is also known as related, within or dependent
     Unpaired is also known as unrelated, between or independent
     
     https://en.wikipedia.org/wiki/Student's_t-test
     
     */
     
     /*
     
     One sample t-test
     
     This performs a one-sample t-test and returns the t-statistic, the degrees of freedom, the probability (p-value)
     and the Cohen's d statistic
     
     - parameter values: Array of double numbers.
     - returns: t (the t statistic), df (degrees of freedom) and p (probability), d (Cohen's d)
     
     Example:
     
     Sigma.tTest_one(
     
     */
    public static func tTest_one(_ values: [Double], userMean: Double) -> Dictionary<String, Double>? {
        let count = Double(values.count)
        if count == 0 { return nil }
        else if count == 1 {
            return (nil)
        }
        
        let df = count - 1.0
        
        let numerator = average(values)! - userMean
        let denominator = standardDeviationSample(values)! / sqrt(Double(count))

        if denominator != 0.0 {
            let t = numerator / denominator
            
            let probability = tProbability(DF: df, T: t)!

            // compile results into dictionary
            var results = [String: Double]()
            
            // store sums of squares
            results["t"] = t
            results["df"] = df
            results["probability"] = probability
            results["D"] = 0.0
            
            return results
        }
        else {
            return nil
        }
    }

    public static func tTest(_ values1: [Double], _ values2: [Double], testTails: Int = 2, testType: Int = 1) -> Dictionary<String, Double>? {
        let count1 = Double(values1.count)
        let count2 = Double(values2.count)
        if count1 < 2 { return nil }
        if count2 < 2 { return nil }
        var df: Double
        var t: Double // ignore warning about 't' not being used
        var numerator: Double
        var denominator: Double

        if (testType < 1 || testType > 3) {
            return nil
        }
        else if testType == 1 { // Paired t-test
            if count1 != count2 { return nil }
            df = Double(count1 - 1)
            
            var deltaSum: Double = 0.0
            var deltaSquared: Double = 0.0
            var delta: Double = 0.0
            
            for idx in 0...Int(count1 - 1.0) {
                delta = values1[idx] - values2[idx]
                deltaSum += delta
                deltaSquared += (delta * delta)
            }
            
            numerator = deltaSum / count1
            denominator = sqrt((deltaSquared - ((deltaSum * deltaSum) / count1)) / ((count1 - 1.0) * count1))
            
        }
        else { // Unpaired t-test
            let m1 = average(values1)!
            let m2 = average(values2)!
            let s1 = varianceSample(values1)!
            let s2 = varianceSample(values2)!
            df = Double(count1 + count2 - 2.0)
            
            let sd = ((s1 * (count1 - 1)) + (s2 * (count2 - 1))) / (count1 + count2 - 2.0)

            // Alternative DF formula for unequal variances (heteroscedastic)
            if testType == 3 {
                let s12 = s1 / count1
                let s22 = s2 / count2
                let dfNumerator = (s12 + s22) * (s12 + s22)
                let dfDenominator1 = (s12 * s12) / (count1 - 1.0)
                let dfDenominator2 = (s22 * s22) / (count2 - 1.0)
                
                print (dfNumerator, dfDenominator1, dfDenominator2)
                let dfDenominator = dfDenominator1 + dfDenominator2
                df = dfNumerator / dfDenominator
            }
            
            numerator = m1 - m2
            denominator = sqrt((sd / count1) + (sd / count2))
        }
        
        if denominator == 0.0 {
            print ("Divide by zero")
            return nil
        }
        else {
            let t = numerator / denominator

            // Calculate the probability
            let probability = tProbability(DF: df, T: t)!
            
            // compile results into dictionary
            var results = [String: Double]()
            
            // store sums of squares
            results["t"] = t
            results["df"] = df
            results["probability"] = probability

            return results
        }
    }

}


