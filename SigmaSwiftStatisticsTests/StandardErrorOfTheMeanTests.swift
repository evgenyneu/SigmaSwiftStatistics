import XCTest
import SigmaSwiftStatistics

class StandardErrorOfTheMeanTests: XCTestCase {
  func testStandardErrorOfTheMean() {
    let result = Sigma.standardErrorOfTheMean([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(3.5412254627, Helpers.round10(result))
  }
  
  func testStandardErrorOfTheMean_oneItem() {
    let result = Sigma.standardErrorOfTheMean([4])
    XCTAssert(result == nil)
  }
  
  func testStandardErrorOfTheMean_empty() {
    let result = Sigma.standardErrorOfTheMean([])
    XCTAssert(result == nil)
  }
}
  
