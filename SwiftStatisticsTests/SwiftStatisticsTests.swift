import UIKit
import XCTest
import SwiftStatistics

class SwiftStatisticsTests: XCTestCase {
  // MARK: - Sum
  
  func testSum() {
    let result = Statistics.sum([1, 3, 8])
    XCTAssertEqual(12, result)
  }
  
  func testSum_whenEmpty() {
    let result = Statistics.sum([])
    XCTAssertEqual(0, result)
  }
  
  // MARK: - Mean
  
  func testMean() {
    let result = Statistics.mean([1, 12, 19.5, -5, 3, 8])
    XCTAssertEqual(6.4166666667, Helpers.round10(result))
  }
  
  func testAverage_whenEmpty() {
    let result = Statistics.mean([])
    XCTAssertEqual(0, result)
  }
  
  // MARK: - Sample standard deviation
  
  func testSampleStandardDeviation() {
    let result = Statistics.sampleStandardDeviation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(8.6741954478, Helpers.round10(result))
  }
  
  func testSampleStandardDeviation_whenOne() {
    let result = Statistics.sampleStandardDeviation([1])
    XCTAssert(result == nil)
  }
  
  func testSampleStandardDeviation_whenEmpty() {
    let result = Statistics.sampleStandardDeviation([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Population standard deviation
  
  func testPopulationStandardDeviation() {
    let result = Statistics.populationStandardDeviation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(7.9184208583, Helpers.round10(result))
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
