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
    let result = Statistics.standardDeviation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(8.67419544780187, result)
  }
  
  func testStandardDeviation_whenOne() {
    let result = Statistics.standardDeviation([1])
    XCTAssert(result == nil)
  }
  
  func testStandardDeviation_whenEmpty() {
    let result = Statistics.standardDeviation([])
    XCTAssert(result == nil)
  }
}
