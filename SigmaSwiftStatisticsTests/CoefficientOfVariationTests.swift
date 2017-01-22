import UIKit
import XCTest
import SigmaSwiftStatistics

class CoefficientOfVariationTests: XCTestCase {
  // MARK: coefficientOfVariationSample
  
  func testCoefficientOfVariationSample() {
    let result = Sigma.coefficientOfVariationSample([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(1.3518226672,  Helpers.round10(result))
  }
  
  func testCoefficientOfVariationSample_oneValue() {
    let result = Sigma.coefficientOfVariationSample([1])
    XCTAssertNil(result)
  }
  
  func testCoefficientOfVariationSample_empty() {
    let result = Sigma.coefficientOfVariationSample([])
    XCTAssertNil(result)
  }
  
  func testCoefficientOfVariationSample_meanIsZero() {
    let result = Sigma.coefficientOfVariationSample([-1, 0, 1])
    XCTAssertEqual(Double.infinity, result)
  }
}
  
