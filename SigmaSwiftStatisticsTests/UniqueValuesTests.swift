import XCTest
import SigmaSwiftStatistics

class UniqueValuesTests: XCTestCase {
  func testUniqueValues_arraySingle() {
    let result = Sigma.uniqueValues([-99])
    XCTAssertEqual([-99], result)
  }
  
  func testUniqueValues_arrayHomogenous() {
    let result = Sigma.uniqueValues([55, 55, 55, 55, 55])
    XCTAssertEqual([55], result)
  }
  
  func testUniqueValues_arrayPositive() {
    let result = Sigma.uniqueValues([2, 1, 3, 4, 5, 4, 3, 5])
    XCTAssertEqual([2, 3, 4, 5, 1], result)
  }
  
  func testUniqueValues_arrayNegative() {
    let result = Sigma.uniqueValues([-4, -5, -4, -5, -99, -5]).sorted()
    XCTAssertEqual([-99, -5, -4], result)
  }
  
  func testUniqueValues_arrayMixed() {
    let result = Sigma.uniqueValues([55, -55, 10, -10, -999, 10, -10, -55, 55, -999, 55]).sorted()
    XCTAssertEqual([-999, -55, -10, 10, 55], result)
  }
  
  func testUniqueValues_emptyArray() {
    let result = Sigma.uniqueValues([])
    XCTAssertEqual([], result)
  }
}
