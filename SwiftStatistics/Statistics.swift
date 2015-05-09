import Foundation

struct Statistics {
  //
  // Computes standard deviation for the array of values.
  //
  // Example
  // -------
  //
  //   Statistics.standardDeviation([1, 12, 19.5, -5, 3, 8]) // 7.918420858282849
  //
  static func standardDeviation(values: [Double]) -> Double {
    let count = Double(values.count)
    if count == 0 { return 0 }
    
    let avgerageValue = average(values)
    
    let numerator = values.reduce(0) { total, value in
      total + pow(avgerageValue - value, 2)
    }
    
    return sqrt(numerator / count)
  }
  
  //
  // Computes average given an array of values.
  //
  // Example
  // -------
  //
  //  Statistics.average([1, 12, 19.5, -5, 3, 8]) // 6.416666666666667
  //
  static func average(values: [Double]) -> Double {
    let count = Double(values.count)
    if count == 0 { return 0 }
    return values.reduce(0, combine: +) / count
  }
}