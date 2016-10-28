import UIKit
import XCTest
import SigmaSwiftStatistics

class PearsonTests: XCTestCase {
  
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
