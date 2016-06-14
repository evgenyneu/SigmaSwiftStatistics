import Foundation

/**

Collection of functions for statistical calculation.

Project home: https://github.com/evgenyneu/SigmaSwiftStatistics

*/
public struct Sigma {
  /**
  
  Calculates the maximum value in the array.

  - parameter values: Array of decimal numbers.
  - returns: The maximum value in the array. Returns nil for an empty array.

  Example:

      Sigma.max([3, 10, 6]) // 10
  
  */
  public static func max(_ values: [Double]) -> Double? {
    if let maxValue = values.max() {
      return maxValue
    }
    
    return nil
  }
  
  /**
  
  Calculates the mimimum value in the array.

  - parameter values: Array of decimal numbers.
  - returns: The mimimum value in the array. Returns nil for an empty array.
  
  Example:

      Sigma.min([5, 3, 10]) // -> 3

  */
  public static func min(_ values: [Double]) -> Double? {
    if let minValue = values.min() {
      return minValue
    }
    
    return nil
  }
  
  /**

  Computes the sum of array values.
  
  - parameter values: Array of decimal numbers.
  - returns: The sum of array values.

  Example:

      Sigma.sum([1, 3, 10]) // 14

  */
  public static func sum(_ values: [Double]) -> Double {
    return values.reduce(0, combine: +)
  }
  
  /**
  
  Computes arithmetic mean of values in the array.
  
  http://en.wikipedia.org/wiki/Arithmetic_mean
  
  - parameter values: Array of decimal numbers.
  - returns: Arithmetic mean of values in the array. Returns nil for an empty array.

  Formula:

      A = Σ(x) / n
  
  Where n is the number of values.

  Example:

      Sigma.average([1, 12, 19.5, -5, 3, 8]) // 6.416666666666667

  */
  public static func average(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    return sum(values) / count
  }
  
  /**
  
  Returns the central value from the array after it is sorted.
  
  http://en.wikipedia.org/wiki/Median
  
  - parameter values: Array of decimal numbers.
  - returns: The median value from the array. Returns nil for an empty array. Returns the mean of the two middle values if there is an even number of items in the array.

  Example:

      Sigma.median([1, 12, 19.5, 3, -5]) // 3

  */
  public static func median(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    let sorted = sort(values)
    
    if count.truncatingRemainder(dividingBy: 2) == 0 {
      // Even number of items - return the mean of two middle values
      let leftIndex = Int(count / 2 - 1)
      let leftValue = sorted[leftIndex]
      let rightValue = sorted[leftIndex + 1]
      return (leftValue + rightValue) / 2
    } else {
      // Odd number of items - take the middle item.
      return sorted[Int(count / 2)]
    }
  }
  
  /**
   
  Returns the central value from the array after it is sorted.

  http://en.wikipedia.org/wiki/Median

  - parameter values: Array of decimal numbers.
  - returns: The median value from the array. Returns nil for an empty array. Returns the smaller of the two middle values if there is an even number of items in the array.

  Example:

      Sigma.medianLow([1, 12, 19.5, 10, 3, -5]) // 3
   
  */
  public static func medianLow(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    let sorted = values.sorted { $0 < $1 }
    
    if count.truncatingRemainder(dividingBy: 2) == 0 {
      // Even number of items - return the lower of the two middle values
      return sorted[Int(count / 2) - 1]
    } else {
      // Odd number of items - take the middle item.
      return sorted[Int(count / 2)]
    }
  }
  
  /**
   
  Returns the central value from the array after it is sorted.

  http://en.wikipedia.org/wiki/Median

  - parameter values: Array of decimal numbers.
  - returns: The median value from the array. Returns nil for an empty array. Returns the greater of the two middle values if there is an even number of items in the array.

  Example:

      Sigma.medianHigh([1, 12, 19.5, 10, 3, -5]) // 10
   
  */
  public static func medianHigh(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    let sorted = values.sorted { $0 < $1 }
    return sorted[Int(count / 2)]
  }
  
  /**
  
  Computes variance based on a sample.
  
  http://en.wikipedia.org/wiki/Variance
  
  - parameter values: Array of decimal numbers.
  - returns: Variance based on a sample. Returns nil when the array is empty or contains a single value.
  
  Formula:
  
      s^2 = Σ( (x - m)^2 ) / (n - 1)
  
  Where:
  
  m is the sample mean.
  
  n is the sample size.
  
  Example:
  
      Sigma.varianceSample([1, 12, 19.5, -5, 3, 8]) // 75.24166667
  
  */
  public static func varianceSample(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count < 2 { return nil }
    
    if let avgerageValue = average(values) {
      let numerator = values.reduce(0) { total, value in
        total + pow(avgerageValue - value, 2)
      }
      
      return numerator / (count - 1)
    }
    
    return nil
  }
  
  /**
  
  Computes variance of entire population.
  
  http://en.wikipedia.org/wiki/Variance
  
  - parameter values: Array of decimal numbers.
  - returns: Population variance. Returns nil when the array is empty.
  
  Formula:
  
      σ^2 = Σ( (x - m)^2 ) / n
  
  Where:
  
  m is the population mean.
  
  n is the population size.
  
  Example:
  
      Sigma.variancePopulation([1, 12, 19.5, -5, 3, 8]) // 62.70138889
  
  */
  public static func variancePopulation(_ values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    
    if let avgerageValue = average(values) {
      let numerator = values.reduce(0) { total, value in
        total + pow(avgerageValue - value, 2)
      }
      
      return numerator / count
    }
    
    return nil
  }
  
  /**
  
  Computes standard deviation based on a sample.
  
  http://en.wikipedia.org/wiki/Standard_deviation

  - parameter values: Array of decimal numbers.
  - returns: Standard deviation of a sample. Returns nil when the array is empty or contains a single value.

  Formula:

      s = sqrt( Σ( (x - m)^2 ) / (n - 1) )

  Where:

  m is the sample mean.

  n is the sample size.

  Example:

      Sigma.standardDeviationSample([1, 12, 19.5, -5, 3, 8]) // 8.674195447801869

  */
  public static func standardDeviationSample(_ values: [Double]) -> Double? {
    if let varianceSample = varianceSample(values) {
       return sqrt(varianceSample)
    }
    
    return nil
  }
  
  /**
  
  Computes standard deviation of entire population.
  
  http://en.wikipedia.org/wiki/Standard_deviation
  
  - parameter values: Array of decimal numbers.
  - returns: Standard deviation of entire population. Returns nil for an empty array.

  Formula:

      σ = sqrt( Σ( (x - m)^2 ) / n )

  Where:

  m is the population mean.
  
  n is the population size.

  Example:

      Sigma.standardDeviationPopulation([1, 12, 19.5, -5, 3, 8]) // 8.67419544780187

  */
  public static func standardDeviationPopulation(_ values: [Double]) -> Double? {
    if let variancePopulation = variancePopulation(values) {
      return sqrt(variancePopulation)
    }
  
    return nil
  }
  
  /**

  Computes covariance of a sample between two variables: x and y.
  
  http://en.wikipedia.org/wiki/Sample_mean_and_sample_covariance
  
  - parameter x: Array of decimal numbers for the first variable.
  - parameter y: Array of decimal numbers for the second variable.
  - returns: Covariance of a sample between two variables: x and y. Returns nil if arrays x and y have different number of values. Returns nil for empty arrays or arrays containing a single element.

  Formula:

      cov(x,y) = Σ(x - mx)(y - my) / (n - 1)

  Where:

  mx is the sample mean of the first variable.
  
  my is the sample mean of the second variable.
  
  n is the total number of values.

  Example:

      let x = [1, 2, 3.5, 3.7, 8, 12]
      let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
      Sigma.covarianceSample(x: x, y: y) // 5.03

  */
  public static func covarianceSample(x: [Double], y: [Double]) -> Double? {
    let xCount = Double(x.count)
    let yCount = Double(y.count)
    
    if xCount < 2 { return nil }
    if xCount != yCount { return nil }
    
    if let xMean = average(x),
      yMean = average(y) {
        
        var sum:Double = 0
        
        for (index, xElement) in x.enumerated() {
          let yElement = y[index]
          
          sum += (xElement - xMean) * (yElement - yMean)
        }
        
        return sum / (xCount - 1)
    }
    
    return nil
  }
  
  /**

  Computes covariance for entire population between two variables: x and y.
  
  http://en.wikipedia.org/wiki/Covariance
  
  - parameter x: Array of decimal numbers for the first variable.
  - parameter y: Array of decimal numbers for the second variable.
  - returns: Covariance for entire population between two variables: x and y. Returns nil if arrays x and y have different number of values. Returns nil for empty arrays.

  Formula:

      cov(x,y) = Σ(x - mx)(y - my) / n

  Where:

  mx is the population mean of the first variable.
  
  my is the population mean of the second variable.
  
  n is the total number of values.

  Example:

      let x = [1, 2, 3.5, 3.7, 8, 12]
      let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
      Sigma.covariancePopulation(x: x, y: y) // 4.19166666666667

  */
  public static func covariancePopulation(x: [Double], y: [Double]) -> Double? {
    let xCount = Double(x.count)
    let yCount = Double(y.count)

    if xCount == 0 { return nil }
    if xCount != yCount { return nil }
    
    if let xMean = average(x),
      yMean = average(y) {
      
      var sum:Double = 0
  
      for (index, xElement) in x.enumerated() {
        let yElement = y[index]
        
        sum += (xElement - xMean) * (yElement - yMean)
      }
        
      return sum / xCount
    }
    
    return nil
  }
  
  /**

  Calculates the Pearson product-moment correlation coefficient between two variables: x and y.
  
  http://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient
  
  - parameter x: Array of decimal numbers for the first variable.
  - parameter y: Array of decimal numbers for the second variable.
  - returns: The Pearson product-moment correlation coefficient between two variables: x and y. Returns nil if arrays x and y have different number of values. Returns nil for empty arrays.

  Formula:

      p(x,y) = cov(x,y) / (σx * σy)

  Where:

  cov is the population covariance.

  σx is the population standard deviation of x.

  Example:

      let x = [1, 2, 3.5, 3.7, 8, 12]
      let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
      Sigma.pearson(x: x, y: y) // 0.843760859352745

  */
  public static func pearson(x: [Double], y: [Double]) -> Double? {
    if let cov = covariancePopulation(x: x, y: y),
      σx = standardDeviationPopulation(x),
      σy = standardDeviationPopulation(y) {
        
      if σx == 0 || σy == 0 { return nil }

      return cov / (σx * σy)
    }
      
    return nil
  }
  
  
  /**
   
  Calculates Percentile value for the given dataset.

  https://en.wikipedia.org/wiki/Percentile

  - parameter values: Array of decimal numbers in the dataset.
  - parameter percentile: percentile between 0 and 1 inclusive. For example, value 0.4 corresponds to 40th percentile.
  - returns: the percentile value.

  Algorithm:

  https://github.com/evgenyneu/SigmaSwiftStatistics/wiki/Percentile-1-method

  Example:

  Sigma.percentile1(values: [35, 20, 50, 40, 15], percentile: 0.4)
  // Result: 29
   
  */
  public static func percentile1(values: [Double], percentile: Double) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    if percentile < 0 { return nil }
    if percentile > 1 { return nil }
    
    // 1. Sort the dataset
    // ---------------
    
    let sortedValues = sort(values)
    
    // 2. Find the rank
    // ---------------

    let rank = percentile * (count - 1) + 1
    
    // 3. Get the integer and fractional part of the rank
    // ---------------

    let rankInteger = Int(floor(rank))
    let rankFraction = Double(rank.truncatingRemainder(dividingBy: 1))
    
    // 4. Find the element at rank
    // ---------------

    let elementValue = sortedValues[rankInteger - 1]
    
    var elementPlusOneValue: Double = 0
    if rankInteger < Int(count) { elementPlusOneValue = sortedValues[rankInteger] }
    
    // 5. Calculate the percentile value
    // ---------------

    return elementValue + rankFraction * (elementPlusOneValue - elementValue)
    
  }
  
  // MARK: - Private functionality
  
  private static func sort(_ values: [Double]) -> [Double] {
    return values.sorted { $0 < $1 }
  }
}

/**

Collection of functions for statistical calculation.

*/
public typealias σ = Sigma
