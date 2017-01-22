import XCTest
import SigmaSwiftStatistics

class FrequenciesTests: XCTestCase {
// MARK: - Frequencies

  func testEmptyArray() {
    if let _ = Sigma.frequencies(values: []) {
      XCTFail()
    }
    else {
      XCTAssertNil(nil)
    }
  }

  func testSingleArray() {
    if let result = Sigma.frequencies(values: [-99.999]) {
      var unique_values: [Double]
      var value_frequencies: [Int]
      (unique_values, value_frequencies) = result
      // (-99.999, [1])
      XCTAssertEqual([-99.999], unique_values)
      XCTAssertEqual([1], value_frequencies)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testHomogenousArray() {
    if let result = Sigma.frequencies(values: [-99.999, -99.999, -99.999, -99.999, -99.999, -99.999]) {
      var unique_values: [Double]
      var value_frequencies: [Int]
      (unique_values, value_frequencies) = result
      // (-99.999, [6])
      XCTAssertEqual([-99.999], unique_values)
      XCTAssertEqual([6], value_frequencies)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testPositiveArray() {
    if let result = Sigma.frequencies(values: [6,2,9999,9999,2,79,6,6]) {
      var unique_values: [Double]
      var value_frequencies: [Int]
      (unique_values, value_frequencies) = result
      // (2,6,79,9999, [2,3,1,2])
      XCTAssertEqual([2,6,79,9999], unique_values)
      XCTAssertEqual([2,3,1,2], value_frequencies)
    }
    else {
      XCTAssertNil(nil)
    }
  }

  func testNegativeArray() {
    if let result = Sigma.frequencies(values: [-99.999, -0.0001, -99.999, -99.999, -99.999, -99.999]) {
      var unique_values: [Double]
      var value_frequencies: [Int]
      (unique_values, value_frequencies) = result
      // (-99.999, [1])
      XCTAssertEqual([-99.999, -0.0001], unique_values)
      XCTAssertEqual([5,1], value_frequencies)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testMixedArray() {
    if let result = Sigma.frequencies(values: [-99.999, -99.999, -99.999, 99.999, -99.999, 99.999]) {
      var unique_values: [Double]
      var value_frequencies: [Int]
      (unique_values, value_frequencies) = result
      // (-99.999, [1])
      XCTAssertEqual([-99.999, 99.999], unique_values)
      XCTAssertEqual([4,2], value_frequencies)
    }
  }
  
    
}
