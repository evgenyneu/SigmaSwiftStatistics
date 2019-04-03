import Foundation

public extension Sigma {
  /**

  Calculates Percentile value for the given dataset. This method is used same in Microsoft Excel (PERCENTILE or PERCENTILE.INC) and Google Docs Sheets (PERCENTILE). Same as the 7th sample quantile method from the Hyndman and Fan paper (1996).

  https://en.wikipedia.org/wiki/Percentile

  - parameter data: Array of decimal numbers in the dataset.
  - parameter percentile: percentile between 0 and 1 inclusive. For example, value 0.4 corresponds to 40th percentile.
  - returns: the percentile value.

  Algorithm:

  https://github.com/evgenyneu/SigmaSwiftStatistics/wiki/Percentile-1-method

  Example:

      Sigma.percentile1(values: [35, 20, 50, 40, 15], percentile: 0.4) // Result: 29

  */
  static func percentile(_ data: [Double], percentile: Double) -> Double? {
    return Sigma.quantiles.method7(data, probability: percentile)
  }
}
