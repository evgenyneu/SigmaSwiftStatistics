import XCTest
import SigmaSwiftStatistics

class UniqueValuesTests: XCTestCase {
  // MARK: - Unique values

  func testEmptyArray() {
    let result = Sigma.uniqueValues(values: [])
    XCTAssertNil(result)
  }
  
  func testArraySingle() {
    let result = Sigma.uniqueValues(values: [-99])
    XCTAssertEqual([-99], result!)
  }
  
  func testArrayHomogenous() {
    let result = Sigma.uniqueValues(values: [55,55,55,55,55])
    XCTAssertEqual([55], result!)
  }
  
  func testArrayPositive() {
    let result = Sigma.uniqueValues(values: [2,5,6,5,6,2,5])
    XCTAssertEqual([2,5,6], result!)
  }
  
  func testArrayNegative() {
    let result = Sigma.uniqueValues(values: [-4,-5,-4,-5,-99,-5])?.sorted(by: <)
    XCTAssertEqual([-99, -5,-4], result!)
  }
  
  func testArrayMixed() {
    let result = Sigma.uniqueValues(values: [55,-55,10,-10,-999, 10, -10, -55, 55, -999, 55])?.sorted(by: <)
    XCTAssertEqual([-999, -55, -10, 10, 55], result!)
  }
}
