import UIKit
import XCTest
import SigmaSwiftStatistics

class SigmaNormalProbabilityTests: XCTestCase {
  func testProbabilityDensity_μZero_σOne() {
    XCTAssertEqual(0.3989422804014327, Sigma.normalDensity(x: 0))
    XCTAssertEqual(0.2419707245191434, Helpers.round16(Sigma.normalDensity(x: 1)!))
    XCTAssertEqual(0.2419707245191434, Helpers.round16(Sigma.normalDensity(x: -1)!))
    XCTAssertEqual("5.52094836215982e-88", "\(Sigma.normalDensity(x: 20)!)")
  }
  
  func testProbabilityDensity_μσNonDefault() {
    XCTAssertEqual(0.4070839591779069,
                   Sigma.normalDensity(x: 2e-12, μ: 0.0000000014, σ: 0.980000001)!)

  }
  
  func testProbabilityDensity_σIsZero() {
    XCTAssertNil(Sigma.normalDensity(x: 2e-12, μ: 0.0000000014, σ: 0))
  }
}
