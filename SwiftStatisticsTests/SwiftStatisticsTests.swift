import UIKit
import XCTest
import SwiftStatistics

class SwiftStatisticsTests: XCTestCase {
  
  // MARK: - Min
  
  func testMin() {
    let result = Statistics.min([4, 2.1, 8])!
    XCTAssertEqual(2.1, result)
  }
  
  func testMin_whenEmpty() {
    let result = Statistics.min([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Max
  
  func testMax() {
    let result = Statistics.max([4, 15.1, 8])!
    XCTAssertEqual(15.1, result)
  }
  
  func testMax_whenEmpty() {
    let result = Statistics.max([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Sum
  
  func testSum() {
    let result = Statistics.sum([1, 3.1, 8])
    XCTAssertEqual(12.1, result)
  }
  
  func testSum_whenEmpty() {
    let result = Statistics.sum([])
    XCTAssertEqual(0, result)
  }
  
  // MARK: - Mean
  
  func testMean() {
    let result = Statistics.mean([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(6.4166666667, Helpers.round10(result))
  }
  
  func testAverage_whenEmpty() {
    let result = Statistics.mean([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Median
  
  func testMedian_oddNumberOfItems() {
    let result = Statistics.median([1, 12, 19.5, 3, -5])!
    XCTAssertEqual(3, result)
  }
  
  func testMedian_eventNumberOfItems() {
    let result = Statistics.median([1, 12, 19.5, 3, -5, 8])!
    XCTAssertEqual(5.5, result)
  }
  
  func testMedian_oneItem() {
    let result = Statistics.median([2])!
    XCTAssertEqual(2, result)
  }
  
  func testMedian_whenEmpty() {
    let result = Statistics.median([])
    XCTAssert(result == nil)
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
