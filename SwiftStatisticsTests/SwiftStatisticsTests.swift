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
  
  // Sample standard deviation
  // --------------
  
  func testSampleStandardDeviation() {
    let result = Statistics.sampleStandardDeviation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(8.67419, Helpers.round5(result))
  }
  
  func testSampleStandardDeviation_whenOne() {
    let result = Statistics.sampleStandardDeviation([1])
    XCTAssert(result == nil)
  }
  
  func testSampleStandardDeviation_whenEmpty() {
    let result = Statistics.sampleStandardDeviation([])
    XCTAssert(result == nil)
  }
  
  // Population standard deviation
  // --------------
  
  func testPopulationStandardDeviation() {
    let result = Statistics.populationStandardDeviation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(7.91842, Helpers.round5(result))
  }
  
  func testPopulationStandardDeviation_whenOne() {
    let result = Statistics.populationStandardDeviation([1])!
    XCTAssertEqual(0, result)
  }
  
  func testPopulationStandardDeviation_whenEmpty() {
    let result = Statistics.populationStandardDeviation([])
    XCTAssert(result == nil)
  }
}
