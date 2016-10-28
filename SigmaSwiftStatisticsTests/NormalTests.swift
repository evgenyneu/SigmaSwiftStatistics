import UIKit
import XCTest
import SigmaSwiftStatistics

class NormalTests: XCTestCase {
  
  // MARK: - Normal Distribution

  func testNormalDistribution_μZero_σOne() {
    XCTAssertEqual(0.5, Sigma.normalDistribution(x: 0)!)
    XCTAssertEqual(0.1586552539314570, Sigma.normalDistribution(x: -1)!)
    XCTAssertEqual(0.8413447460685430, Sigma.normalDistribution(x: 1)!)
    XCTAssertEqual("0.999999999013412","\(Sigma.normalDistribution(x: 6)!)")
  }
  
  func testNormalDistribution_μσNonDefault() {
    XCTAssertEqual(0.7807704106838400, Sigma.normalDistribution(x: 0.014401, μ: -2.31, σ: 3.00001)!)
  }
  
  func testNormalDistribution_σIsZero() {
    XCTAssertNil(Sigma.normalDistribution(x: 0.014401, μ: -2.31, σ: 0))
  }
  
  func testNormalDistribution_σIsNegative() {
    XCTAssertNil(Sigma.normalDistribution(x: 0.014401, μ: -2.31, σ: -1.23))
  }
  
  // MARK: - Normal Density
  
  func testNormalDensity_μZero_σOne() {
    XCTAssertEqual(0.3989422804014327, Sigma.normalDensity(x: 0))
    XCTAssertEqual(0.2419707245191434, Helpers.round16(Sigma.normalDensity(x: 1)!))
    XCTAssertEqual(0.2419707245191434, Helpers.round16(Sigma.normalDensity(x: -1)!))
    XCTAssertEqual("5.52094836215982e-88", "\(Sigma.normalDensity(x: 20)!)")
  }
  
  func testNormalDensity_μσNonDefault() {
    XCTAssertEqual(0.1111004887053895,
                   Helpers.round16(Sigma.normalDensity(x: 13.92, μ: 12.4, σ: 3.21)!))
    
    XCTAssertEqual(0.4070839591779069,
                   Sigma.normalDensity(x: 2e-12, μ: 0.0000000014, σ: 0.980000001)!)

  }
  
  func testNormalDensity_σIsZero() {
    XCTAssertNil(Sigma.normalDensity(x: 2e-12, μ: 0.0000000014, σ: 0))
  }
  
  func testNormalDensity_σIsNigative() {
    XCTAssertNil(Sigma.normalDensity(x: 2e-12, μ: 0.0000000014, σ: -2))
  }
}
