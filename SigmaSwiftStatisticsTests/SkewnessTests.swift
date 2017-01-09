import UIKit
import XCTest
import SigmaSwiftStatistics

class SkewnessTests: XCTestCase {
  
  // MARK: - skewnessA
  
  func testSkewnessA() {
    let result = Sigma.skewnessA([4, 2.1, 8, 21, 1])!
    XCTAssertEqual(1.6994131524, Helpers.round10(result))
  }
  
  func testSkewnessA_twoItems() {
    let result = Sigma.skewnessA([4, 2.1])
    XCTAssert(result == nil)
  }
  
  func testSkewnessA_oneItem() {
    let result = Sigma.skewnessA([4])
    XCTAssert(result == nil)
  }
  
  func testSkewnessA_empty() {
    let result = Sigma.skewnessA([])
    XCTAssert(result == nil)
  }
  
  func testSkewnessA_whenNoDeviation() {
    let result = Sigma.skewnessA([1, 1, 1])
    XCTAssert(result == nil)
  }
  
  // MARK: - skewnessB
  
  func testSkewnessB() {
    let result = Sigma.skewnessB([4, 2.1, 8, 21, 1])!
    XCTAssertEqual(1.1400009992, Helpers.round10(result))
  }
  
  func testSkewnessB_twoItems() {
    let result = Sigma.skewnessB([4, 2.1])
    XCTAssert(result == nil)
  }
  
  func testSkewnessB_oneItem() {
    let result = Sigma.skewnessB([4])
    XCTAssert(result == nil)
  }
  
  func testSkewnessB_empty() {
    let result = Sigma.skewnessB([])
    XCTAssert(result == nil)
  }
  
  func testSkewnessB_whenNoDeviation() {
    let result = Sigma.skewnessB([1, 1, 1])
    XCTAssert(result == nil)
  }
}
