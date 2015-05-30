import UIKit
import XCTest
import SwiftStatistics

class SwiftStatisticsTests: XCTestCase {
  
  // MARK: - Min
  
  func testMin() {
    Statistics.average([1,2,3])
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
  
  // MARK: - Average
  
  func testMean() {
    let result = Statistics.average([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(6.4166666667, Helpers.round10(result))
  }
  
  func testAverage_whenEmpty() {
    let result = Statistics.average([])
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
    let result = Statistics.standardDeviationSample([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(8.6741954478, Helpers.round10(result))
  }
  
  func testSampleStandardDeviation_whenOne() {
    let result = Statistics.standardDeviationSample([1])
    XCTAssert(result == nil)
  }
  
  func testSampleStandardDeviation_whenEmpty() {
    let result = Statistics.standardDeviationSample([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Population standard deviation
  
  func testPopulationStandardDeviation() {
    let result = Statistics.standardDeviationPopulation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(7.9184208583, Helpers.round10(result))
  }
  
  func testPopulationStandardDeviation_whenOne() {
    let result = Statistics.standardDeviationPopulation([1])!
    XCTAssertEqual(0, result)
  }
  
  func testPopulationStandardDeviation_whenEmpty() {
    let result = Statistics.standardDeviationPopulation([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Sample covariance
  
  func testSampleCovariance() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
    let result = Statistics.covarianceSample(x: x, y: y)!
    
    XCTAssertEqual(5.03, Helpers.round10(result))
  }
  
  func testSampleCovariance_unequalSamples() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 4]
    let result = Statistics.covarianceSample(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testSampleCovariance_whenGivenSingleSetOfValues() {
    let x = [1.2]
    let y = [0.5]
    let result = Statistics.covarianceSample(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testSampleCovariance_samplesAreEmpty() {
    let result = Statistics.covarianceSample(x: [], y: [])
    
    XCTAssert(result == nil)
  }
  
  // MARK: - Population covariance
  
  func testPopulationCovariance() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
    let result = Statistics.covariancePopulation(x: x, y: y)!
    
    XCTAssertEqual(4.1916666667, Helpers.round10(result))
  }
  
  func testPopulationCovariance_unequalSamples() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5]
    let result = Statistics.covariancePopulation(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testPopulationCovariance_emptySamples() {
    let result = Statistics.covariancePopulation(x: [], y: [])
    
    XCTAssert(result == nil)
  }
  
  // MARK: - Pearson product-moment correlation coefficient
  func testPearson() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
    let result = Statistics.pearson(x: x, y: y)!
    
    XCTAssertEqual(0.8437608594, Helpers.round10(result))
  }
  
  func testPearson_unequalSamples() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5]
    let result = Statistics.pearson(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testPearson_emptySamples() {
    let result = Statistics.pearson(x: [], y: [])
    
    XCTAssert(result == nil)
  }
}
