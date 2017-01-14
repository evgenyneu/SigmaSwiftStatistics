import UIKit
import XCTest
import SigmaSwiftStatistics

class KurtosisTests: XCTestCase {
  
  // MARK: - kurtosisA
  
  func testKurtosisA() {
    let result = Sigma.kurtosisA([2, 1, 3, 4.1, 19, 1.5])!
    XCTAssertEqual(5.4570693277, Helpers.round10(result))
  }
  
  func testKurtosisA_threeItems() {
    let result = Sigma.kurtosisA([4, 2.1, 5])
    XCTAssert(result == nil)
  }
  
  func testKurtosisA_twoItems() {
    let result = Sigma.kurtosisA([4, 2.1])
    XCTAssert(result == nil)
  }
  
  func testKurtosisA_oneItem() {
    let result = Sigma.kurtosisA([4])
    XCTAssert(result == nil)
  }
  
  func testKurtosisA_empty() {
    let result = Sigma.kurtosisA([])
    XCTAssert(result == nil)
  }
  
  func testKurtosisA_whenNoDeviation() {
    let result = Sigma.kurtosisA([1, 1, 1])
    XCTAssert(result == nil)
  }
}
