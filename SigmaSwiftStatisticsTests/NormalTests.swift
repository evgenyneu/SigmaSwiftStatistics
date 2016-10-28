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
  
  
  // MARK: - Normal Quantile
  
  func testNormalQuantile_μZero_σOne() {
    XCTAssertEqual(-1.9599639845400538, Sigma.normalQuantile(p: 0.025))
    XCTAssertEqual(-1.6448536269514726, Sigma.normalQuantile(p: 0.05))
    XCTAssertEqual(-1.2815515655446008, Sigma.normalQuantile(p: 0.1))
    XCTAssertEqual(-0.52440051270804066, Sigma.normalQuantile(p: 0.3))
    XCTAssertEqual(-2.506628274566559724e-06, Sigma.normalQuantile(p: 0.499999))
    XCTAssertEqual(0, Sigma.normalQuantile(p: 0.5))
    XCTAssertEqual(2.5066282733116487548e-07, Sigma.normalQuantile(p: 0.5000001))
    XCTAssertEqual(0.841621233572914406, Sigma.normalQuantile(p: 0.8))
    XCTAssertEqual(1.959963984540053605, Sigma.normalQuantile(p: 0.975))
  }
  
  func testNormalQuantile_μZero_σOne_close_to_boundaries() {
    XCTAssertEqual(-3.71901648545567997, Sigma.normalQuantile(p: 0.0001))
    XCTAssertEqual(-10.4204522008030977, Sigma.normalQuantile(p: 1e-25))
    XCTAssertEqual(-14.9333375347884889, Sigma.normalQuantile(p: 1e-50))
    
    XCTAssertEqual(3.719016485455708398, Sigma.normalQuantile(p: 0.9999))
    XCTAssertEqual(8.209536151601385611, Sigma.normalQuantile(p: 0.9999999999999999))
  }
  
  func testNormalQuantile_μZero_σOne_probabilityZero() {
    XCTAssertEqual(-Double.infinity, Sigma.normalQuantile(p: 0))
  }
  
  func testNormalQuantile_μZero_σOne_probabilityOne() {
    XCTAssertEqual(Double.infinity, Sigma.normalQuantile(p: 1))
  }
  
  func testNormalQuantile_μZero_σOne_probabilityLessThenZero() {
    XCTAssertNil(Sigma.normalQuantile(p: -1))
  }
  
  func testNormalQuantile_μZero_σOne_probabilityGreaterThanOne() {
    XCTAssertNil(Sigma.normalQuantile(p: 1.2))
  }
  
  func testNormalQuantile_μσNonDefault() {
    XCTAssertEqual(1.9142201769251021, Sigma.normalQuantile(p: 0.412, μ: 2.0123, σ: 0.441))
  }
  
  func testNormalQuantile_μσNonDefault_σIsZero() {
    XCTAssertNil(Sigma.normalQuantile(p: 0.412, μ: 2.0123, σ: 0))
  }
  
  func testNormalQuantile_μσNonDefault_σIsNegative() {
    XCTAssertNil(Sigma.normalQuantile(p: 0.412, μ: 2.0123, σ: -0.3))
  }
}
