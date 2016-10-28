import Foundation

public extension Sigma {
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
    let sorted = Sigma.sort(values)
    
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
}
