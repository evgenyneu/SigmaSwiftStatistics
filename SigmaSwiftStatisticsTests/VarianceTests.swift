import XCTest
import SigmaSwiftStatistics

class VarianceDeviationTests: XCTestCase {
  // MARK: - Sample variance
  
  func testVarianceSample() {
    let result = Sigma.varianceSample([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(75.2416666667, Helpers.round10(result))
  }
  
  func testVarianceSample_whenSame() {
    let result = Sigma.varianceSample([3, 3])!
    XCTAssertEqual(0, Helpers.round10(result))
  }
  
  func testVarianceSample_whenOne() {
    let result = Sigma.varianceSample([1])
    XCTAssert(result == nil)
  }
  
  func testVarianceSample_whenEmpty() {
    let result = Sigma.varianceSample([])
    XCTAssert(result == nil)
  }
  
  
  // MARK: - Population variance
  
  func testVariancePopulation() {
    let result = Sigma.variancePopulation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(62.7013888889, Helpers.round10(result))
  }
  
  func testVariancePopulation_whenSame() {
    let result = Sigma.variancePopulation([3, 3])!
    XCTAssertEqual(0, Helpers.round10(result))
  }
  
  func testVariancePopulation_whenOne() {
    let result = Sigma.variancePopulation([1])!
    XCTAssertEqual(0, Helpers.round10(result))
  }
  
  func testVariancePopulation_whenEmpty() {
    let result = Sigma.variancePopulation([])
    XCTAssert(result == nil)
  }
}
