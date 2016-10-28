import UIKit
import XCTest
import SigmaSwiftStatistics

class SigmaTests: XCTestCase {
  
  // MARK: - Min
  
  func testMin() {
    let result = Sigma.min([4, 2.1, 8])!
    XCTAssertEqual(2.1, result)
  }
  
  func testMin_whenEmpty() {
    let result = Sigma.min([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Max
  
  func testMax() {
    let result = Sigma.max([4, 15.1, 8])!
    XCTAssertEqual(15.1, result)
  }
  
  func testMax_whenEmpty() {
    let result = Sigma.max([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Sum
  
  func testSum() {
    let result = Sigma.sum([1, 3.1, 8])
    XCTAssertEqual(12.1, result)
  }
  
  func testSum_whenEmpty() {
    let result = Sigma.sum([])
    XCTAssertEqual(0, result)
  }
  
  // MARK: - Average
  
  func testMean() {
    let result = Sigma.average([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(6.4166666667, Helpers.round10(result))
  }
  
  func testAverage_whenEmpty() {
    let result = Sigma.average([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Median
  
  func testMedian_oddNumberOfItems() {
    let result = Sigma.median([1, 12, 19.5, 3, -5])!
    XCTAssertEqual(3, result)
  }
  
  func testMedian_evenNumberOfItems() {
    let result = Sigma.median([1, 12, 19.5, 3, -5, 8])!
    XCTAssertEqual(5.5, result)
  }
  
  func testMedian_oneItem() {
    let result = Sigma.median([2])!
    XCTAssertEqual(2, result)
  }
  
  func testMedian_whenEmpty() {
    let result = Sigma.median([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Median Low
  
  func testMedianLow_oddNumberOfItems() {
    let result = Sigma.medianLow([1, 12, 19.5, 3, -5])!
    XCTAssertEqual(3, result)
  }
  
  func testMedianLow_evenNumberOfItems() {
    let result = Sigma.medianLow([1, 12, 19.5, 3, -5, 8])!
    XCTAssertEqual(3, result)
  }
  
  func testMedianLow_oneItem() {
    let result = Sigma.medianLow([2])!
    XCTAssertEqual(2, result)
  }
  
  func testMedianLow_whenEmpty() {
    let result = Sigma.medianLow([])
    XCTAssert(result == nil)
  }
  
  //MARK: - Median High
  
  func testMedianHigh_oddNumberOfItems() {
    let result = Sigma.medianHigh([1, 12, 19.5, 3, -5])!
    XCTAssertEqual(3, result)
  }
  
  func testMedianHigh_evenNumberOfItems() {
    let result = Sigma.medianHigh([1, 12, 19.5, 3, -5, 8])!
    XCTAssertEqual(8, result)
  }
  
  func testMedianHigh_oneItem() {
    let result = Sigma.medianHigh([2])!
    XCTAssertEqual(2, result)
  }
  
  func testMedianHigh_whenEmpty() {
    let result = Sigma.medianHigh([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Sample variance
  
  func testVarianceSample() {
    let result = Sigma.varianceSample([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(75.2416666667, Helpers.round10(result))
  }
  
  func testVarianceSample_whenSame() {
    let result = Sigma.varianceSample([3, 3])!
    XCTAssertEqual(0, Helpers.round10(result))
  }
  
  func testVarianceSample_whenOne() {
    let result = Sigma.varianceSample([1])
    XCTAssert(result == nil)
  }
  
  func testVarianceSample_whenEmpty() {
    let result = Sigma.varianceSample([])
    XCTAssert(result == nil)
  }
  
  
  // MARK: - Population variance
  
  func testVariancePopulation() {
    let result = Sigma.variancePopulation([1, 12, 19.5, -5, 3, 8])!    
    XCTAssertEqual(62.7013888889, Helpers.round10(result))
  }
  
  func testVariancePopulation_whenSame() {
    let result = Sigma.variancePopulation([3, 3])!
    XCTAssertEqual(0, Helpers.round10(result))
  }
  
  func testVariancePopulation_whenOne() {
    let result = Sigma.variancePopulation([1])!
    XCTAssertEqual(0, Helpers.round10(result))
  }
  
  func testVariancePopulation_whenEmpty() {
    let result = Sigma.variancePopulation([])
    XCTAssert(result == nil)
  }
  
  
  // MARK: - Sample standard deviation
  
  func testSampleStandardDeviation() {
    let result = Sigma.standardDeviationSample([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(8.6741954478, Helpers.round10(result))
  }
  
  func testSampleStandardDeviation_whenSame() {
    let result = Sigma.standardDeviationSample([3, 3])!
    XCTAssertEqual(0, Helpers.round10(result))
  }
  
  func testSampleStandardDeviation_whenOne() {
    let result = Sigma.standardDeviationSample([1])
    XCTAssert(result == nil)
  }
  
  func testSampleStandardDeviation_whenEmpty() {
    let result = Sigma.standardDeviationSample([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Population standard deviation
  
  func testPopulationStandardDeviation() {
    let result = Sigma.standardDeviationPopulation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(7.9184208583, Helpers.round10(result))
  }
  
  func testPopulationStandardDeviation_whenOne() {
    let result = Sigma.standardDeviationPopulation([1])!
    XCTAssertEqual(0, result)
  }
  
  func testPopulationStandardDeviation_whenEmpty() {
    let result = Sigma.standardDeviationPopulation([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Pearson product-moment correlation coefficient
  
  func testPearson() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
    let result = Sigma.pearson(x: x, y: y)!
    
    XCTAssertEqual(0.8437608594, Helpers.round10(result))
  }
  
  func testPearson_unequalSamples() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5]
    let result = Sigma.pearson(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testPearson_emptySamples() {
    let result = Sigma.pearson(x: [], y: [])
    
    XCTAssert(result == nil)
  }
}
