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
}
