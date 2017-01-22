import XCTest
import SigmaSwiftStatistics

class QuantilesTests: XCTestCase {
  // MARK: - Q8
  
  func testQuantiles_q8() {
    let result = Sigma.quantiles.Q8([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-4.25, result)
  }
  
  func testQuantiles_q8_probabilityFiftyPercent() {
    let result = Sigma.quantiles.Q9([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(5.5, result)
  }
  
  func testQuantiles_q8_probablityCloseToZero() {
    let result = Sigma.quantiles.Q8([1, 12, 19.5, -5, 3, 8], alpha: 0.11)
    XCTAssertEqual(-4.82, Helpers.round10(result!))
  }
  
  func testQuantiles_q8_probablityZero() {
    let result = Sigma.quantiles.Q8([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_q8_probablityCloseToOne() {
    let result = Sigma.quantiles.Q8([1, 12, 19.5, -5, 3, 8], alpha: 0.89)
    XCTAssertEqual(19.275, result)
  }
  
  func testQuantiles_q8_probablityOne() {
    let result = Sigma.quantiles.Q8([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_q8_oneValue() {
    let result = Sigma.quantiles.Q8([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
 
  func testQuantiles_q8_empty() {
    let result = Sigma.quantiles.Q8([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  // MARK: - Q9
  
  func testQuantiles_q9() {
    let result = Sigma.quantiles.Q9([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-4.0625, result)
  }
  
  func testQuantiles_q9_probabilityFiftyPercent() {
    let result = Sigma.quantiles.Q9([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(5.5, result)
  }
  
  func testQuantiles_q9_probablityCloseToZero() {
    let result = Sigma.quantiles.Q9([1, 12, 19.5, -5, 3, 8], alpha: 0.10001)
    XCTAssertEqual(-4.999625, Helpers.round10(result!))
  }
  
  func testQuantiles_q9_probablityZero() {
    let result = Sigma.quantiles.Q9([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_q9_probablityCloseToOne() {
    let result = Sigma.quantiles.Q9([1, 12, 19.5, -5, 3, 8], alpha: 0.89)
    XCTAssertEqual(19.03125, result)
  }
  
  func testQuantiles_q9_probablityOne() {
    let result = Sigma.quantiles.Q9([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_q9_oneValue() {
    let result = Sigma.quantiles.Q9([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }

  
  func testQuantiles_q9_empty() {
    let result = Sigma.quantiles.Q9([], alpha: 0.125)
    XCTAssertNil(result)
  }
}
