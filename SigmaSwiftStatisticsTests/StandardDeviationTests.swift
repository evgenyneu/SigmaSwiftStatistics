import XCTest
import SigmaSwiftStatistics

class StandardDeviationTests: XCTestCase {
  
  // MARK: - Sample standard deviation
  
  func testSampleStandardDeviation() {
    let result = Sigma.standardDeviationSample([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(8.6741954478, Helpers.round10(result))
  }
  
  func testSampleStandardDeviation_whenSame() {
    let result = Sigma.standardDeviationSample([3, 3])!
    XCTAssertEqual(0, Helpers.round10(result))
  }
  
  func testSampleStandardDeviation_whenOne() {
    let result = Sigma.standardDeviationSample([1])
    XCTAssert(result == nil)
  }
  
  func testSampleStandardDeviation_whenEmpty() {
    let result = Sigma.standardDeviationSample([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Population standard deviation
  
  func testPopulationStandardDeviation() {
    let result = Sigma.standardDeviationPopulation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(7.9184208583, Helpers.round10(result))
  }
  
  func testPopulationStandardDeviation_whenOne() {
    let result = Sigma.standardDeviationPopulation([1])!
    XCTAssertEqual(0, result)
  }
  
  func testPopulationStandardDeviation_whenEmpty() {
    let result = Sigma.standardDeviationPopulation([])
    XCTAssert(result == nil)
  }
}
