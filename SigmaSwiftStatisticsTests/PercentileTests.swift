import XCTest
import SigmaSwiftStatistics

class PercentileTests: XCTestCase {
  func testPercentile1() {
    let result = Sigma.percentile(values: [35, 20, 50, 40, 15], percentile: 0.4)!
    XCTAssertEqual(29, result)
  }
  
  func testPercentile1_percentileZero() {
    let result = Sigma.percentile(values: [35, 20, 50, 40, 15], percentile: 0)!
    XCTAssertEqual(15, result)
  }
  
  func testPercentile1_percentileOne() {
    let result = Sigma.percentile(values: [35, 20, 50, 40, 15], percentile: 1)!
    XCTAssertEqual(50, result)
  }
  
  func testPercentile1_percentileMedian() {
    let result = Sigma.percentile(values: [35, 20, 50, 40, 15], percentile: 0.5)!
    XCTAssertEqual(35, result)
  }
  
  func testPercentile1_almostZero() {
    let result = Sigma.percentile(values: [35, 20, 50, 40, 15], percentile: 0.00000001)!
    XCTAssertEqual(15.0000002, Helpers.round10(result))
  }
  
  func testPercentile1_almostOne() {
    let result = Sigma.percentile(values: [35, 20, 50, 40, 15], percentile: 0.99999999)!
    XCTAssertEqual(49.9999996, Helpers.round10(result))
  }
  
  func testPercentile1_singleElement() {
    let result = Sigma.percentile(values: [23], percentile: 0.4)!
    XCTAssertEqual(23, result)
  }
  
  func testPercentile1_emptyDataset() {
    let result = Sigma.percentile(values: [], percentile: 0.4)
    XCTAssertNil(result)
  }
  
  func testPercentile1_percentileNegative() {
    let result = Sigma.percentile(values: [35, 20, 50, 40, 15], percentile: -0.1)
    XCTAssertNil(result)
  }
  
  func testPercentile1_percentileGreaterThanOne() {
    let result = Sigma.percentile(values: [35, 20, 50, 40, 15], percentile: 1.0001)
    XCTAssertNil(result)
  }
}

