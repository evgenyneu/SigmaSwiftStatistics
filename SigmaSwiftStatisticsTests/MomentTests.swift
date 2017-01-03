import UIKit
import XCTest
import SigmaSwiftStatistics

class MomentTests: XCTestCase {
  
  // MARK: - Normal Distribution
  
  func testNormalDistribution_μZero_σOne() {
    XCTAssertEqual(0.5, Sigma.moment([1, 2, 3], m: 1)!)
  }
}
