import UIKit
import XCTest
import SwiftStatistics

class SwiftStatisticsTests: XCTestCase {
  // Average
  // --------------
  
  func testAverage() {
    let result = Statistics.average([1, 12, 19.5, -5, 3, 8])
    XCTAssertEqual(6.416666666666667, result)
  }
  
  func testAverage_whenEmpty() {
    let result = Statistics.average([])
    XCTAssertEqual(0, result)
  }
  
  // Standard deviation
  // --------------
  
  func testStandardDeviation() {
    let result = Statistics.standardDeviation([1, 12, 19.5, -5, 3, 8])
    XCTAssertEqual(7.918420858282849, result)
  }
  
  func testStandardDeviation_whenEmpty() {
    let result = Statistics.standardDeviation([])
    XCTAssertEqual(0, result)
  }
}
