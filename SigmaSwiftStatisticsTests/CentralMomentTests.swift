import UIKit
import XCTest
import SigmaSwiftStatistics

class MomentTests: XCTestCase {
  func testMoment_zero() {
    let result = Sigma.centralMoment([3, -1, 1, 4.1, 4.1, 0.7], m: 0)!
    XCTAssertEqual(1,  Helpers.round10(result))
  }
  
  func testMoment_first() {
    let result = Sigma.centralMoment([3, -1, 1, 4.1, 4.1, 0.7], m: 1)!
    XCTAssertEqual(0,  Helpers.round10(result))
  }
  
  func testMoment_second() {
    let result = Sigma.centralMoment([3, -1, 1, 4.1, 4.1, 0.7], m: 2)!
    XCTAssertEqual(3.5847222222,  Helpers.round10(result))
  }
  
  func testMoment_third() {
    let result = Sigma.centralMoment([3, -1, 1, 4.1, 4.1, 0.7], m: 3)!
    XCTAssertEqual(-1.5999259259,  Helpers.round10(result))
  }
  
  func testMoment_fourth() {
    let result = Sigma.centralMoment([3, -1, 1, 4.1, 4.1, 0.7], m: 4)!
    XCTAssertEqual(20.6794136574,  Helpers.round10(result))
  }
  
  func testMoment_oneItem() {
    let result = Sigma.centralMoment([2], m: 3)!
    XCTAssertEqual(0,  Helpers.round10(result))
  }
  
  func testMoment_empty() {
    let result = Sigma.centralMoment([], m: 3)
    XCTAssertNil(result)
  }
}
