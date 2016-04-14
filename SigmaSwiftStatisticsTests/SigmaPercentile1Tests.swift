import UIKit
import XCTest
import SigmaSwiftStatistics

class SigmaPercentile1Tests: XCTestCase {
  
  // MARK: - Min
  
  func testPercentile1() {
    let result = Sigma.percentile1(values: [35, 20, 50, 40, 15], percentile: 0.4)!
    XCTAssertEqual(29, result)
  }
}

