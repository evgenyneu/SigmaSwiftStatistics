import Foundation

/**

Collection of functions for statistical calculation.

*/
public struct Statistics {
  /**
  
  Calculates the maximum value in the array.

  :param: values Array of decimal numbers.
  :returns: The maximum value in the array. Returns nil for an empty array.

  Example:

      Statistics.max([3, 10, 6]) // 10
  
  */
  public static func max(values: [Double]) -> Double? {
    if values.isEmpty { return nil }
    return maxElement(values)
  }
  
  /**
  
  Calculates the mimimum value in the array.

  :param: values Array of decimal numbers.
  :returns: The mimimum value in the array. Returns nil for an empty array.
  
  Example:

      Statistics.min([5, 3, 10]) // -> 3

  */
  public static func min(values: [Double]) -> Double? {
    if values.isEmpty { return nil }
    return minElement(values)
  }
  
  /**

  Computes the sum of array values.
  
  :param: values Array of decimal numbers.
  :returns: The sum of array values.

  Example:

      Statistics.sum([1, 3, 10]) // 14

  */
  public static func sum(values: [Double]) -> Double {
    return values.reduce(0, combine: +)
  }
  
  /**
  
  Computes arithmetic mean of values in the array.
  
  http://en.wikipedia.org/wiki/Arithmetic_mean
  
  :param: values Array of decimal numbers.
  :returns: Arithmetic mean of values in the array. Returns nil for an empty array.

  Formula

      A = Σ(x) / n
  
  Where n is the number of values.

  Example

      Statistics.average([1, 12, 19.5, -5, 3, 8]) // 6.416666666666667

  */
  public static func average(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    return sum(values) / count
  }
  
  /**
  
  Returns the central value from the array after it is sorted.
  
  http://en.wikipedia.org/wiki/Median
  
  :param: values Array of decimal numbers.
  :returns: The median value from the array. Returns nil for an empty array. Returns the mean of the two middle values if there is an even number of items in the array.

  Example

      Statistics.median([1, 12, 19.5, 3, -5]) // 3

  */
  public static func median(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    let sorted = values.sorted { $0 < $1 }
    
    if count % 2 == 0 {
      // Event number of items - return the mean of two middle values
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
  
  Computes standard deviation of a sample.
  
  http://en.wikipedia.org/wiki/Standard_deviation

  :param: values Array of decimal numbers.
  :returns: Standard deviation of a sample. Returns nil when the array is empty or contains a single value.

  Formula

      s = sqrt( Σ(x - m) / (n - 1) )

  Where:

  m is the sample mean.

  n is the sample size.

  Example

      Statistics.standardDeviationSample([1, 12, 19.5, -5, 3, 8]) // 8.674195447801869

  */
  public static func standardDeviationSample(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count < 2 { return nil }
    
    if let avgerageValue = average(values) {
      let numerator = values.reduce(0) { total, value in
        total + pow(avgerageValue - value, 2)
      }
      
      return sqrt(numerator / (count - 1))
    }
    
    return nil
  }
  
  /**
  
  Computes standard deviation of entire population.
  
  http://en.wikipedia.org/wiki/Standard_deviation
  
  :param: values Array of decimal numbers.
  :returns: Standard deviation of entire population. Returns nil for an empty array.

  Formula

      σ = sqrt( Σ(x - m) / n )

  Where:

  m is the population mean.
  
  n is the population size.

  Example

      Statistics.standardDeviationPopulation([1, 12, 19.5, -5, 3, 8]) // 8.67419544780187

  */
  public static func standardDeviationPopulation(values: [Double]) -> Double? {
    let count = Double(values.count)
    if count == 0 { return nil }
    
    if let avgerageValue = average(values) {
      let numerator = values.reduce(0) { total, value in
        total + pow(avgerageValue - value, 2)
      }
      
      return sqrt(numerator / count)
    }
  
    return nil
  }
  
  /**

  Computes covariance of a sample between two variables: x and y.
  
  http://en.wikipedia.org/wiki/Sample_mean_and_sample_covariance
  
  :param: x Array of decimal numbers for the first variable.
  :param: y Array of decimal numbers for the second variable.
  :returns: Covariance of a sample between two variables: x and y. Returns nil if arrays x and y have different number of values. Returns nil for empty arrays or arrays containing a single element.

  Formula

      cov(x,y) = Σ(x - mx)(y - my) / (n - 1)

  Where:

  mx is the sample mean of the first variable.
  
  my is the sample mean of the second variable.
  
  n is the total number of values.

  Example

      let x = [1, 2, 3.5, 3.7, 8, 12]
      let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
      Statistics.covarianceSample(x: x, y: y) // 5.03

  */
  public static func covarianceSample(#x: [Double], y: [Double]) -> Double? {
    let xCount = Double(x.count)
    let yCount = Double(y.count)
    
    if xCount < 2 { return nil }
    if xCount != yCount { return nil }
    
    if let xMean = average(x),
      yMean = average(y) {
        
        var sum:Double = 0
        
        for (index, xElement) in enumerate(x) {
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
  
  :param: x Array of decimal numbers for the first variable.
  :param: y Array of decimal numbers for the second variable.
  :returns: Covariance for entire population between two variables: x and y. Returns nil if arrays x and y have different number of values. Returns nil for empty arrays.

  Formula

      cov(x,y) = Σ(x - mx)(y - my) / n

  Where:

  mx is the population mean of the first variable.
  
  my is the population mean of the second variable.
  
  n is the total number of values.

  Example

      let x = [1, 2, 3.5, 3.7, 8, 12]
      let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
      Statistics.covariancePopulation(x: x, y: y) // 4.19166666666667

  */
  public static func covariancePopulation(#x: [Double], y: [Double]) -> Double? {
    let xCount = Double(x.count)
    let yCount = Double(y.count)

    if xCount == 0 { return nil }
    if xCount != yCount { return nil }
    
    if let xMean = average(x),
      yMean = average(y) {
      
      var sum:Double = 0
  
      for (index, xElement) in enumerate(x) {
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
  
  :param: x Array of decimal numbers for the first variable.
  :param: y Array of decimal numbers for the second variable.
  :returns: The Pearson product-moment correlation coefficient between two variables: x and y. Returns nil if arrays x and y have different number of values. Returns nil for empty arrays.

  Formula

      p(x,y) = cov(x,y) / (σx * σy)

  Where:

  cov is the population covariance.

  σx is the population standard deviation of x.

  Example

      let x = [1, 2, 3.5, 3.7, 8, 12]
      let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
      Statistics.pearson(x: x, y: y) // 0.843760859352745

  */
  public static func pearson(#x: [Double], y: [Double]) -> Double? {
    if let cov = covariancePopulation(x: x, y: y),
      σx = standardDeviationPopulation(x),
      σy = standardDeviationPopulation(y) {
        
      if σx == 0 || σy == 0 { return nil }

      return cov / (σx * σy)
    }
      
    return nil
  }
}

/**

Collection of functions for statistical calculation.

*/
public typealias σ = Statistics