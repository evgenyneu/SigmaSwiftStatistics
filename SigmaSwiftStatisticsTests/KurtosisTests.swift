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
  
  func testKurtosisA_noDeviation() {
    let result = Sigma.kurtosisA([1, 1, 1])
    XCTAssert(result == nil)
  }
  
  // MARK: - kurtosisB
  
  func testKurtosisB() {
    let result = Sigma.kurtosisB([2, 1, 3, 4.1, 19, 1.5])!
    XCTAssertEqual(4.0138523409, Helpers.round10(result))
  }
  
  func testKurtosisB_twoItems() {
    let result = Sigma.kurtosisB([4, 2.1])!
    XCTAssertEqual(1.0, Helpers.round10(result))
  }

  func testKurtosisB_oneItem() {
    let result = Sigma.kurtosisB([4])
    XCTAssert(result == nil)
  }

  func testKurtosisB_empty() {
    let result = Sigma.kurtosisB([])
    XCTAssert(result == nil)
  }
  
  func testKurtosisB_noDeviation() {
    let result = Sigma.kurtosisB([1, 1, 1])
    XCTAssert(result == nil)
  }
}
